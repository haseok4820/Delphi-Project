program Project_URLDownloadToFile;

uses
  Vcl.Forms,
  uUnit1 in 'uUnit1.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
