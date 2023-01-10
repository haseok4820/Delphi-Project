program Project_Keyboard;

uses
  Vcl.Forms,
  uKeyboard in 'uKeyboard.pas' {fmKeyboard},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TfmKeyboard, fmKeyboard);
  Application.Run;
end.
