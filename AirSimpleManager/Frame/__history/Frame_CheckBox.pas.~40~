unit Frame_CheckBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, ImagingComponents;

type
  TFrame_ENV_CheckBox = class(TFrame)
    Image_Check: TImage;
    Label_MSG: TLabel;
    Label2: TLabel;
    procedure Image_CheckClick(Sender: TObject);
    procedure Label_MSGClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM;

procedure TFrame_ENV_CheckBox.Image_CheckClick(Sender: TObject);
var
  iTag: integer;
begin
  iTag := Self.Tag;
  DM.Image_CheckBOX(iTag, Self);
  if Assigned(Self.OnClick) then
  begin
    Self.OnClick(Self);
  end;

end;

procedure TFrame_ENV_CheckBox.Label_MSGClick(Sender: TObject);
begin
  Image_CheckClick(Image_Check);
end;

end.
