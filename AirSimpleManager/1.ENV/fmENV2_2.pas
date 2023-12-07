unit fmENV2_2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frame_CheckBox, Vcl.StdCtrls, Frame_Edit, Vcl.ExtCtrls, Frame_LoadFile,
  Vcl.OleCtrls, WMPLib_TLB;

type
  TForm_ENV2_2 = class(TForm)
    ScrollBox_Main: TScrollBox;
    Label_Title: TLabel;
    Panel1: TPanel;
    Frame_CheckBox_useDualMonitor: TFrame_ENV_CheckBox;
    Frame_Edit_DualDisplayText: TFrame_ENV_Edit;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    WindowsMediaPlayer1: TWindowsMediaPlayer;
    GroupBox1: TGroupBox;
    Frame_ENV_LoadFile5: TFrame_ENV_LoadFile;
    Frame_ENV_LoadFile4: TFrame_ENV_LoadFile;
    Frame_ENV_LoadFile3: TFrame_ENV_LoadFile;
    Frame_ENV_LoadFile2: TFrame_ENV_LoadFile;
    Frame_ENV_LoadFile1: TFrame_ENV_LoadFile;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Frame_ENV_LoadFile2Label_ValueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ENV2_2: TForm_ENV2_2;

implementation

{$R *.dfm}

uses uDM;

procedure TForm_ENV2_2.Button2Click(Sender: TObject);
var
  Result_IS: TResult_IS;
begin
  Result_IS := DM.GetOpen(1);
  if Result_IS.Result_int <> 0 then
  begin
    WindowsMediaPlayer1.URL := Result_IS.Result_Str;

  end;
end;

procedure TForm_ENV2_2.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  useDualMonitor := Frame_CheckBox_useDualMonitor.Tag <> 0;
  DualDisplayText := Frame_Edit_DualDisplayText.Edit_Value.Text;

  for i := Low(DualDisplayFile) to High(DualDisplayFile) do
  begin
    DualDisplayFile[i] := (FindComponent('Frame_ENV_LoadFile' + IntToStr(i)) as TFrame_ENV_LoadFile)
      .Label_Value.Caption;
  end;

end;

procedure TForm_ENV2_2.FormShow(Sender: TObject);
var
  i: Integer;
begin
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT useDualMonitor)), Frame_CheckBox_useDualMonitor);
  Frame_Edit_DualDisplayText.Edit_Value.Text := DualDisplayText;

  for i := Low(DualDisplayFile) to High(DualDisplayFile) do
  begin
    (FindComponent('Frame_ENV_LoadFile' + IntToStr(i)) as TFrame_ENV_LoadFile).Label_Value.Caption :=
      DualDisplayFile[i];
  end;
end;

procedure TForm_ENV2_2.Frame_ENV_LoadFile2Label_ValueClick(Sender: TObject);
begin
  Frame_ENV_LoadFile2.Label_ValueClick(Sender);

end;

end.
