unit uPrintTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ImagingComponents;

type
  TFormPrtTest = class(TForm)
    LabelTitle: TLabel;
    ImageCancel: TImage;
    RadioGroup_PortList: TRadioGroup;
    RadioGroup_Baudrate: TRadioGroup;
    Panel1: TPanel;
    Button_Refrush: TButton;
    Button_Print: TButton;
    RadioGroup1: TRadioGroup;
    procedure Button_PrintClick(Sender: TObject);
    procedure ImageCancelClick(Sender: TObject);
    procedure Button_RefrushClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrtTest: TFormPrtTest;
  bTestPrt: Boolean;

implementation

{$R *.dfm}

uses uDM;

procedure TFormPrtTest.Button_PrintClick(Sender: TObject);
var
  Res: TResult_IS;
begin

  if NOT bTestPrt then
  begin
    Button_Print.Caption := RadioGroup_PortList.Items[RadioGroup_PortList.ItemIndex] + ' �����..';
    Button_Print.Enabled := False;
    Button_Refrush.Enabled := False;
    ImageCancel.Enabled := False;
    bTestPrt := True;
    try
{$IFDEF WIN32}
      Res := DM.PrintTest( //
        RadioGroup_PortList.Items[RadioGroup_PortList.ItemIndex], RadioGroup_Baudrate.ItemIndex);

      if Res.iRes <> 0 then
        DM.PopupMsg(Res.sRes);
{$ENDIF}
    finally
      bTestPrt := False;
      Button_Print.Caption := '�׽�Ʈ ���';
      Button_Print.Enabled := True;
      Button_Refrush.Enabled := True;
      ImageCancel.Enabled := True;
    end;
  end
  else
    DM.PopupMsg('���� ��� ó�����Դϴ�.#13����� �ٽ� �õ����ּ���.');

end;

procedure TFormPrtTest.Button_RefrushClick(Sender: TObject);
var
  Result_IS: TResult_IS;
  i: Integer;
begin
  RadioGroup_PortList.Items.Clear;

  Result_IS := DM.GetComPort;
  if Result_IS.iRes <> 0 then
  begin
    if Result_IS.iRes > 6 then
      RadioGroup_PortList.Columns := 2;
    for i := Low(arrComPort) + 1 to High(arrComPort) do
      RadioGroup_PortList.Items.Add(arrComPort[i]);
    RadioGroup_PortList.ItemIndex := 0;
  end;
end;

procedure TFormPrtTest.FormShow(Sender: TObject);
begin
  Button_RefrushClick(nil);
end;

procedure TFormPrtTest.ImageCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
