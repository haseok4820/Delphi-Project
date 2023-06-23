program Datasnap_Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  DC_Form in 'DC_Form.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
