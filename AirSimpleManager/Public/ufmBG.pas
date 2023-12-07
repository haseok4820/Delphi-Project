unit ufmBG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfmBG = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBG: TfmBG;

implementation

{$R *.dfm}

uses uMain;

procedure TfmBG.FormShow(Sender: TObject);
begin
  Top := Form_AirManager.Top;
  Left := Form_AirManager.Left;
  Width := Form_AirManager.Width;
  Height := Form_AirManager.Height;
end;

end.
