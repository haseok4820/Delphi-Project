unit uUnit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Winapi.winINet, Vcl.ExtActns, sHELLaPI, Winapi.UrlMon, Vcl.ExtCtrls;

type
  TFileDownload_Thread = class(TThread)
    iSeq: Integer;
    sURL: String;
    sFileName: String;

    //
    bComplete: Boolean;
    procedure URL_AfterDownload(Sender: TObject);
    procedure URL_BeforeDownload(Sender: TObject);
    procedure URL_Progress(Sender: TDownLoadURL; Progress, ProgressMax: Cardinal; StatusCode: TURLDownloadStatus; StatusText: String;
      var Cancel: Boolean);
  protected
    procedure Execute; override;
  public
  end;

  TForm5 = class(TForm)
    Button1: TButton;
    Button_ALLCancel: TButton;
    ProgressBar1: TProgressBar;
    Memo_Log: TMemo;
    Timer1: TTimer;

    procedure Button_ALLCancelClick(Sender: TObject);
    procedure DownloadButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    // Sender is TNotifyEvent
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  DOWNURL = 'https://YourDownURL';

var
  Form5: TForm5;
  bCancel: Boolean = False;
  arrDownInfo: array of TFileDownload_Thread;

implementation

{$R *.dfm}

procedure TForm5.DownloadButtonClick(Sender: TObject);
var
  i: Cardinal;
begin
  if bCancel then
    bCancel := False;

  try
    SetLength(arrDownInfo, Length(arrDownInfo) + 1);
    i := High(arrDownInfo);
    arrDownInfo[i] := TFileDownload_Thread.Create(True);
    with arrDownInfo[i] do
    begin
      try
        iSeq := (Sender as TButton).Tag + 1;
        sURL := DOWNURL + (Sender as TButton).Hint;
        sFileName := (Sender as TButton).Hint;
        bComplete := False;

        Resume;
      except
        ON E: Exception do
        begin
          Memo_Log.Lines.Add('다운로드 오류 : ' + E.Message);
        end;
      end;
    end;
  finally
  end;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bCancel := True;
  Timer1Timer(Timer1);
end;

procedure TForm5.Timer1Timer(Sender: TObject);
var
  i: Integer;
begin
  Timer1.Enabled := False;
  for i := Low(arrDownInfo) to High(arrDownInfo) do
  begin
    if arrDownInfo[i].bComplete or bCancel then
      Delete(arrDownInfo, i, 1);
  end;
  Timer1.Enabled := True;
end;

procedure TForm5.Button_ALLCancelClick(Sender: TObject);
begin
  bCancel := True;
end;

{ FileDownload_Thread }

procedure TFileDownload_Thread.URL_AfterDownload(Sender: TObject);
begin
  bCancel := False;
  bComplete := True;
  Form5.Memo_Log.Lines.Add('다운로드 종료 : ' + sURL);
end;

procedure TFileDownload_Thread.URL_Progress(Sender: TDownLoadURL; Progress, ProgressMax: Cardinal; StatusCode: TURLDownloadStatus;
  StatusText: String; var Cancel: Boolean);
begin
  try
    with (Form5.FindComponent('ProgressBar' + IntToSTr(iSeq)) as TProgressBar) do
    begin
      Max := ProgressMax;
      Position := Progress;
      Refresh;
      Application.ProcessMessages;
    //  Cancel := bCancel;
    end;
  except
    oN E: Exception do
    begin
      Form5.Memo_Log.Lines.Add(sURL + ' 다운로드상태처리 : ' + E.Message);
      bCancel := True;
    end;
  end;

end;

procedure TFileDownload_Thread.Execute;
var
  HR: HRESULT;
  DownloadURL: TDownLoadURL;
begin
  inherited;
  (Form5.FindComponent('Button' + IntToSTr(iSeq)) as TButton).Enabled := False;

  DownloadURL := TDownLoadURL.Create(nil);
  try
    DownloadURL.URL := sURL;
    DownloadURL.FileName := ExtractFilePath(Application.ExeName) + sFileName;
    DownloadURL.BeforeDownload := URL_BeforeDownload;
    DownloadURL.AfterDownload := URL_AfterDownload;
    DownloadURL.OnDownloadProgress := URL_Progress;
    // DownloadURL.OnUpdate := URL_OnUpdate;

    HR := DownloadURL.ExecuteTargetResult(nil);
    case HR of
      S_OK:
        begin
          ShowMessage('[' + IntToSTr(iSeq) + '] 다운로드가 성공하였습니다.');
        end;
    else
      begin
        ShowMessage('[' + IntToSTr(iSeq) + '] 다운로드가 취소/종료되었습니다. [원인 : 사용자 취소, 또는 네트워크,URL 문제]');
      end;
    end;
  finally
  //  DownloadURL.Free;
    (Form5.FindComponent('Button' + IntToSTr(iSeq)) as TButton).Enabled := True;
  end;
end;

procedure TFileDownload_Thread.URL_BeforeDownload(Sender: TObject);
begin
  Form5.Memo_Log.Lines.Add('다운로드 시작 : ' + sURL);
end;

end.
