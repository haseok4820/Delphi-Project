unit Frame_YN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrame_ENV_YN = class(TFrame)
    Label_Y: TLabel;
    Label_N: TLabel;
    procedure Label_Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM;

procedure TFrame_ENV_YN.Label_Click(Sender: TObject);
var
  iTag: Integer;
  bBool : Boolean;
begin
  iTag := (Sender as TLabel).Tag;
  bBool := iTag = 1;
  if Assigned(Self.OnClick) then
  begin
    Self.OnClick(Self);
  end
end;

end.
