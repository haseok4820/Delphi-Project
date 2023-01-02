program Project_KeyBoard;

uses
  Vcl.Forms,
  uKeyBoard in 'uKeyBoard.pas' {Form_KeyBoard},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amethyst Kamri');
  Application.CreateForm(TForm_KeyBoard, Form_KeyBoard);
  Application.Run;
end.
