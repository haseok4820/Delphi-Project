unit uBG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm_BG = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
  end;

var
  Form_BG: TForm_BG;

implementation

{$R *.dfm}

uses fmMain_Re, uDM;

constructor TForm_BG.Create(AOwner: TComponent);
begin
  inherited;
  AlphaBlend := True;
  AlphaBlendValue := 200;
  SetBounds(Scn_X, Scn_Y, Scn_W, Scn_H);
end;

procedure TForm_BG.FormShow(Sender: TObject);
begin
  AlphaBlend := True;
  AlphaBlendValue := 200;
  // SetWindowLong(Handle, GWL_EXSTYLE, WS_EX_NOACTIVATE);
end;

end.
