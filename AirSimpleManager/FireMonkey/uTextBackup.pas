unit uTextBackup;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.ScrollBox, FMX.Memo;

type
  TfmBackup = class(TForm)
    ScrollBox1: TScrollBox;
    Label1X1: TLabel;
    Label2X1: TLabel;
    Label_2X2: TLabel;
    Label1X2: TLabel;
    Label_1: TLabel;
    Label_2: TLabel;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBackup: TfmBackup;
  PreViewLine: String;

implementation

{$R *.fmx}

procedure TfmBackup.FormShow(Sender: TObject);
var
  i, PrnLineCnt: Byte;
begin
  PrnLineCnt := 20;
  SetLength(PreViewLine, PrnLineCnt);
  for i := 2 to Length(PreViewLine) + 1 do
    PreViewLine[i - 1] := '-';
  Label_1.Text := PreViewLine + PreViewLine + #13#10 + Label_1.Text + #13#10 + PreViewLine + PreViewLine;
  Label_2.Text := PreViewLine + #13#10 + Label_2.Text + #13#10 + PreViewLine;

end;

end.
