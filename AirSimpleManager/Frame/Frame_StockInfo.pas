unit Frame_StockInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Frame_ComboBox;

type
  TFrameStockInfo = class(TFrame)
    Label_StockCode: TLabel;
    Edit_StockName: TEdit;
    Edit_Value: TEdit;
    FrmCombo_Value: TFrame_ENV_ComboBox;
    procedure Label_StockCodeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM;

procedure TFrameStockInfo.Label_StockCodeClick(Sender: TObject);
begin

  arrStockInfo[Self.Tag].bCHk := NOT arrStockInfo[Self.Tag].bCHk;
  if arrStockInfo[Self.Tag].bCHk then
  begin
    Color := clSkyBlue;
  end
  else
  begin
    Color := clWhite;
  end;

  if Assigned(Self.OnClick) then
    Self.OnClick(Self);
end;

end.
