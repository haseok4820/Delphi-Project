unit fmENV3_3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Frame_ComboBox, Vcl.ExtCtrls, Frame_CheckBox, Frame_Edit;

type
  TForm_ENV3_3 = class(TForm)
    ScrollBox_Main: TScrollBox;
    Label_Guide1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Frame_ComboBox_vDelvPort: TFrame_ENV_ComboBox;
    Panel3: TPanel;
    Label1: TLabel;
    Frame_ComboBox_vDelvKitNumber: TFrame_ENV_ComboBox;
    Frame_CheckBox_vDelvRec: TFrame_ENV_CheckBox;
    Button_Install: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_InstallClick(Sender: TObject);
    procedure Frame_ComboBox_Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ENV3_3: TForm_ENV3_3;

implementation

{$R *.dfm}

uses uDM, uMain;

procedure TForm_ENV3_3.Button_InstallClick(Sender: TObject);
begin

  if bWin32 AND FileExists('.\Visual_COM_32.exe') then
    DM.ControlProgram(0, '.\Visual_COM_32.exe')
  else if FileExists('.\Visual_COM_64.exe') then
    DM.ControlProgram(0, '.\Visual_COM_64.exe')
  else
  begin
    DM.GetPopup(0, '��ġ���� ����', '������Ʈ ��ġ������ �������� �ʽ��ϴ�.' + #13#10 + '������Ʈ �� �ٽ� �̿����ּ���.', '');
  end;
end;

procedure TForm_ENV3_3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vDelvPort := Frame_ComboBox_vDelvPort.Label_Key.Caption;
  if vDelvPort = '������' then
    vDelvPort := '';

  vDelvRec := Frame_CheckBox_vDelvRec.Tag <> 0;
  vDelvKitNumber := Frame_ComboBox_vDelvKitNumber.Tag;
end;

procedure TForm_ENV3_3.FormShow(Sender: TObject);
var
  sPath: String;
begin
  if vDelvPort = '' then
    vDelvPort := '������';
  Frame_ComboBox_vDelvPort.Label_Key.Caption := vDelvPort;
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT vDelvRec)), Frame_CheckBox_vDelvRec);
  Frame_ComboBox_vDelvKitNumber.Label_Key.Caption := arrvKitSendList[vDelvKitNumber];
  Frame_ComboBox_vDelvKitNumber.Tag := vDelvKitNumber;

  if bWin32 then
  begin
    sPath := 'C:\Program Files\com0com';
    Button_Install.Caption := Button_Install.Caption + '(Win32)';
  end
  else
  begin
    sPath := 'C:\Program Files (x86)\com0com';
    Button_Install.Caption := Button_Install.Caption + '(Win64)';
  end;

  if DirectoryExists(sPath) then
  begin
    Button_Install.Caption := '������Ʈ�� ��ġ�Ǿ� �ֽ��ϴ�.';
    Button_Install.Enabled := False;
    Button_Install.OnClick := nil;
  end;

end;

procedure TForm_ENV3_3.Frame_ComboBox_Click(Sender: TObject);
var
  Result_Is: TResult_IS;
begin
  //
  if Sender is TFrame_ENV_ComboBox then
  begin
    with (Sender as TFrame_ENV_ComboBox) do
    begin

      if Hint = '������Ʈ' then
        Result_Is := DM.GetList('������Ʈ�� �������ּ���.', ExtPortList)
      else if Hint = '�ֹ�����' then
        Result_Is := DM.GetList('�ֹ����� ��ȣ�� �������ּ���.', arrvKitSendList);

      if Result_Is.Result_int <> -99 then
      begin
        Tag := Result_Is.Result_int;
        Label_Key.Caption := Result_Is.Result_Str;
      end;
    end;
  end;

end;

end.
