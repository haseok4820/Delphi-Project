unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdCustomHTTPServer, IdHTTPServer, IdContext, Winapi.ShellApi;

type
  TForm1 = class(TForm)
    IdHTTPServer1: TIdHTTPServer;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

  with IdHTTPServer1 do
  begin
    if Active then
    begin
      Active := False;

      Button1.Caption := 'Server Start!!!';
    end
    else
    begin
      DefaultPort := 80;
      Active := True;
      AutoStartSession := True;

      Button1.Caption := 'Server Run...';
      ShellExecute(HANDLE_FLAG_INHERIT, 'Open', '"shell:Appsfolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge"', PChar(Memo1.Text),
        nil, SW_SHOWNORMAL);
    end;

  end;

end;

procedure TForm1.IdHTTPServer1CommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  sResText : String;
begin
  with Memo1.Lines do
  begin
    Add('RequestInfo URI : ' + ARequestInfo.URI);
    Add('ARequestInfo.Params.Text : ' + ARequestInfo.Params.Text);
  end;

  sResText := '구글 로그인 성공, 창을 닫고, 앱으로 돌아가주세요.';
  with AResponseInfo do
  begin
    ContentStream := TStringStream.Create(sResText, TEncoding.UTF8);
    ContentType := 'text/html; charset=utf-8';
  end;

end;

end.
