unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Diagnostics, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function SetLabelFontSize(Label_Test: TLabel): Integer;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormResize(Sender: TObject);
var
  rLabel: TLabel;
  i: Integer;
  sName: String;
  StopWatch: TStopWatch;
begin
  StopWatch := TStopWatch.StartNew;
  for i := 0 to 9 do
  begin
    rLabel := (FindComponent('LabelTest_' + IntToStr(i)) as TLabel);
    rLabel.Font.Size := SetLabelFontSize(rLabel);

    with rLabel do
    begin
      sName := Name;
      Align := alBottom;
      Caption := 'FontSize : ' + IntToStr(Font.Size);
      Align := alTop;
    end;
  end;
  StopWatch.Stop;
  Caption := Hint + ' Time(MS) ' + IntToStr(StopWatch.ElapsedMilliseconds);
end;

procedure TForm4.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to 9 do
  begin
    with TLabel.Create(Self) do
    begin
      Parent := Self;
      AutoSize := False;
      Transparent := False;
      Color := clBlack;
      Align := alBottom;
      Name := 'LabelTest_' + IntToStr(i);
      Caption := 'FontSize : ' + IntToStr(Font.Size);
      Tag := i;

      Width := Self.ClientWidth;
      Height := 10 * (i + 1);

      Align := alTop;
      ParentFont := False;
      Font.Color := clWhite;
    end;
  end;
end;

function TForm4.SetLabelFontSize(Label_Test: TLabel): Integer;
var
  Rect_Test: TRect;

  bChk, bGet: Boolean;
  sText: String;
  i, j: Byte;
begin
  if Label_Test = nil then
  begin
    Result := 10;
    Exit;
  end;

  bGet := False;
  bChk := bGet;
  i := 255;
  sText := Label_Test.Caption;

  Rect_Test := Default (TRect);
  with Rect_Test do
  begin
    Right := Label_Test.Width;
    Bottom := Label_Test.Height;

    j := i;
    repeat
      with Label_Test do
      begin
        Canvas.Font.Size := j;
        Canvas.TextRect(Rect_Test, sText, [tfCalcRect]);

        if ((Rect_Test.Right - Rect_Test.Left) < Width) AND ((Rect_Test.Bottom - Rect_Test.Top) < Height) then
        begin
          Result := j;
          bGet := True;
        end
        else
        begin
          if ((Rect_Test.Right - Rect_Test.Left) < Width) OR ((Rect_Test.Bottom - Rect_Test.Top) < Height) then
            bChk := True
          else
            bChk := False;

          if bChk then
            Dec(j)
          else
            j := j div 2;
        end;
      end;
    until bGet;
  end;
end;

end.
