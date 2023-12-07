unit Frame_Control;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Json;

type
  TFrame_SYS_Control = class(TFrame)
    GroupBox_Group: TGroupBox;
    Panel_Option: TPanel;
    Button_Option1: TButton;
    Button_Option2: TButton;
    Button_Option3: TButton;
    Panel_Status: TPanel;
    Button_ALLCancel: TButton;
    Button_LoadOptions: TButton;
    Label_Status: TLabel;
    procedure Button_OptionClick(Sender: TObject);
    procedure Button_MsgClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM;

procedure TFrame_SYS_Control.Button_MsgClick(Sender: TObject);
begin
  // �޼��� ����
end;

procedure TFrame_SYS_Control.Button_OptionClick(Sender: TObject);
var
  json_obj: TJSONObject;
  iPopup, iRecv: Integer;
begin
  Button_ALLCancel.Enabled := True;

  // ���α׷� �����
  {
  if (Sender as TButton).Hint = '' then
    DM.GetPopup(0, '��������', '�ش� ��ġ�� ����� ������ �Ǿ����� �ʽ��ϴ�.', '')
  else if Label_Status.Font.Color = clRed then
    DM.GetPopup(0, '��������', '�ش� ��ġ�� ������ �����־�, ó���Ұ��մϴ�.', '')
  else
  begin
    try
      json_obj := TJSONObject.Create;
      try
        with json_obj, (Sender as TButton) do
        begin
          AddPair('MsgType', 'Req');
          AddPair('PosHost', Self.Hint); // ó���� ��ġ IP ALL ��� ��ġ
          AddPair('ReqType', TJSONNumber.Create(Tag)); // 0 �����, 1 ���α׷� �����
          AddPair('ReqValue', Hint);
          // [���α׷� ����� ����] 0 : NONE(��ġ ������ ����), 1 :Ǫ��ī��, 2 : Ű����ũ, 3 : DID , 4 : AirServer, 5 : AirTrain
          if Pos('AIR', Hint) > 0 then
            iPopup := 0
          else
            iPopup := 1;
          AddPair('PopupYN', TJSONNumber.Create(iPopup)); // �˾� ����

          iRecv := 0;
          AddPair('RecvYN', TJSONNumber.Create(iRecv)); // ó������ ����
        end;
        DM.Send_Msg(json_obj.ToString);
      except
        On E: Exception do
        begin
          DM.SetLog('�޼��� ���� �۾��� ���� : ' + E.Message);
        end;
      end;
    finally
    end;
  end;
  }
end;

end.
