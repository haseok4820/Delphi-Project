program Project_PapagoAPI;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form5},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
