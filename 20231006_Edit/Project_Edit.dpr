program Project_Edit;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uList in 'uList.pas' {Form_List};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_List, Form_List);
  Application.Run;
end.
