program Project_MiniGame;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  uFrame_Event in 'Frame_public\uFrame_Event.pas' {Frame_EventBox: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('TabletDark');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
