unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ImagingComponents, Vcl.ExtCtrls;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var
  ms: TMemoryStream;
  ImageType: String;
  aStr: AnsiString;
begin
  ms := TMemoryStream.Create;
  try
  //  Image1.Picture.Bitmap.SaveToStream(ms);
    ms.LoadFromFile(OpenDialog1.FileName);
    ms.Position := 0;

    SetLength(aStr, 5);
    ms.Read(aStr[1], Length(aStr));
    if Copy(aStr, 1, 2) = 'BM' then
      ImageType := 'BMP'
    else if Copy(aStr, 1, 3) = 'GIF' then
      ImageType := 'GIF'
    else if Copy(aStr, 2, 3) = 'PNG' then
      ImageType := 'PNG'
    else if (ORD(aStr[1]) = $FF) AND (ORD(aStr[2]) = $D8) then
      ImageType := 'JPEG(JPG)'
    else
      ImageType := 'Not Found';
  finally
    Edit1.Text := ImageType;
    ms.Free;
  end;

end;

procedure TForm5.Image1Click(Sender: TObject);
begin
  //
  if OpenDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenDialog1.FileName);
    Button1.Enabled := True;

  end;
end;

end.
