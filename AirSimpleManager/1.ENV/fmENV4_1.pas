unit fmENV4_1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Frame_ComboBox,
  Frame_Edit, Vcl.ExtCtrls, Frame_Nav, Vcl.ComCtrls;

type
  TForm_ENV4_1 = class(TForm)
    ScrollBox_Main: TScrollBox;
    Label_Title: TLabel;
    GroupBox_CARD: TGroupBox;
    Panel_VanList: TPanel;
    Button_Install: TButton;
    Label_MSG1: TLabel;
    Frame_ComboBox_Port1: TFrame_ENV_ComboBox;
    Frame_ComboBox_Port2: TFrame_ENV_ComboBox;
    Frame_ComboBox_Port3: TFrame_ENV_ComboBox;
    Frame_Edit_TID: TFrame_ENV_Edit;
    Label_Execute: TLabel;
    Label_Version: TLabel;
    Label_Path: TLabel;
    ProgressBar1: TProgressBar;
    Timer_Progress: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Frame_ComboBox_PortClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_InstallClick(Sender: TObject);
    procedure Timer_ProgressTimer(Sender: TObject);
  private
    { Private declarations }
    procedure ShowVanList;
    procedure VanClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form_ENV4_1: TForm_ENV4_1;
  Form_VANGB: Integer;

implementation

{$R *.dfm}

uses uDM;

procedure TForm_ENV4_1.Button_InstallClick(Sender: TObject);
const
  DOWNURL = 'https://down.asp2.kr/Upgrade/VAN_AGENT/';
begin
  try
    DM.FileDownload(DOWNURL + arrVanFileName[Form_VANGB], arrVanFileName[Form_VANGB]);
  finally
    Timer_Progress.Enabled := True;
  end;
end;

procedure TForm_ENV4_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VANGB := Form_VANGB;
  TermNo := Frame_Edit_TID.Edit_Value.Text;

  useSecuAgentport := Frame_ComboBox_Port1.Tag;
  useSecuRefPort := Frame_ComboBox_Port2.Tag;
  SignPadNo := Frame_ComboBox_Port3.Tag;
end;

procedure TForm_ENV4_1.FormShow(Sender: TObject);
begin
  Frame_ComboBox_Port1.Label_Key.Caption := Frame_ComboBox_Port1.Hint + ExtPortList[useSecuAgentport];
  Frame_ComboBox_Port1.Tag := useSecuAgentport;
  Frame_ComboBox_Port2.Label_Key.Caption := Frame_ComboBox_Port2.Hint + ExtPortList[useSecuRefPort];
  Frame_ComboBox_Port2.Tag := useSecuRefPort;
  Frame_ComboBox_Port3.Label_Key.Caption := Frame_ComboBox_Port3.Hint + ExtPortList[SignPadNo];
  Frame_ComboBox_Port3.Tag := SignPadNo;

  Frame_Edit_TID.Edit_Value.Text := TermNo;
  Timer_Progress.Enabled := Assigned(DownloadURL);

  Form_VANGB := VANGB;
  ShowVanList;

end;

procedure TForm_ENV4_1.Frame_ComboBox_PortClick(Sender: TObject);
var
  Result_IS: TResult_IS;
begin
  with (Sender as TFrame_ENV_ComboBox) do
  begin
    Result_IS := DM.GetList(Hint + ' 포트를 선택해주세요.', ExtPortList);
    if Result_IS.Result_int <> -99 then
    begin
      Tag := Result_IS.Result_int;
      Label_Key.Caption := Hint + Result_IS.Result_Str;
    end;
  end;
end;

procedure TForm_ENV4_1.ShowVanList;
var
  i, j, k: Integer;
begin
  //
  for i := Low(arrVanList) to High(arrVanList) do
  begin
    with TFrame_ENV_Nav.Create(Self) do
    begin
      Parent := Panel_VanList;
      Name := 'VAN_' + IntToStr(i);
      Tag := i;

      Width := (Panel_VanList.Width - 40) div 4;
      Height := (Panel_VanList.Height - 50) div 4;

      j := i mod 4;
      k := i div 4;

      Top := k * (Height + 10);
      Left := j * (Width + 10);

      onclick := VanClick;

      with Label_Value do
      begin
        Font.Size := 12;
        Caption := arrVanList[i];
      end;
    end;
  end;

  VanClick((FindComponent('VAN_' + IntToStr(Form_VANGB)) AS TFrame_ENV_Nav));
end;

procedure TForm_ENV4_1.Timer_ProgressTimer(Sender: TObject);
begin
  ProgressBar1.Visible := Assigned(DownloadURL);
  if Assigned(DownloadURL) then
  begin
    with DownloadURL do
    begin
      ProgressBar1.Max := iMAX;
      ProgressBar1.Position := iNOW;
    end;
  end
  else
    Timer_Progress.Enabled := False;
end;

procedure TForm_ENV4_1.VanClick(Sender: TObject);
var
  i, j: Integer;
begin
  j := (Sender as TFrame_ENV_Nav).Tag;
  for i := Panel_VanList.ControlCount - 1 Downto 0 do
  begin
    if Panel_VanList.Controls[i] is TFrame_ENV_Nav then
    begin
      with (Panel_VanList.Controls[i] as TFrame_ENV_Nav) do
      begin
        if Tag = j then // 선택
        begin
          Label_Value.Font.Color := cSelLabel_Font;
          Label_Value.Color := cSelLabel_BG;
          Color := cSelLabel_BG;
        end
        else // 기타
        begin
          Label_Value.Font.Color := cLabel_Font;
          Label_Value.Color := cLabel_BG;
          Color := cLabel_Font;
        end;

      end;
    end;
  end;
  Form_VANGB := j;
  if arrVanFileName[Form_VANGB] = '' then
    Button_Install.Visible := False
  else
    Button_Install.Visible := True;
  Button_Install.Caption := arrVanList[Form_VANGB] + #13#10 + Button_Install.Hint;
end;

end.
