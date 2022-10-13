program Minesweeper;

uses
  Vcl.Forms,
  fGamemain in 'fGamemain.pas' {fmMain},
  fNewGame in 'fNewGame.pas' {fmNew},
  uDM in 'uDM.pas' {DM: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  fSetting in 'fSetting.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
