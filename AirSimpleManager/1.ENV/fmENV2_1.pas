unit fmENV2_1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Frame_CheckBox;

type
  TForm_ENV2_1 = class(TForm)
    ScrollBox_Main: TScrollBox;
    Label_Title: TLabel;
    GroupBox_Device: TGroupBox;
    Frame_CheckBox_useOrdCashRecp: TFrame_ENV_CheckBox;
    Frame_CheckBox_QuesAppr: TFrame_ENV_CheckBox;
    Frame_CheckBox_useIDSave: TFrame_ENV_CheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ENV2_1: TForm_ENV2_1;

implementation

{$R *.dfm}

uses uDM;

procedure TForm_ENV2_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  useOrdCashRecp := Frame_CheckBox_useOrdCashRecp.Tag <> 0;
  QuesAppr := Frame_CheckBox_QuesAppr.Tag <> 0;
  useIDSave := Frame_CheckBox_useIDSave.Tag <> 0;
end;

procedure TForm_ENV2_1.FormShow(Sender: TObject);
begin
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT useOrdCashRecp)),
    Frame_CheckBox_useOrdCashRecp);
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT QuesAppr)), Frame_CheckBox_QuesAppr);
  DM.Image_CheckBOX(StrToInt(BoolToStr(NOT useIDSave)),
    Frame_CheckBox_useIDSave);
end;

end.
