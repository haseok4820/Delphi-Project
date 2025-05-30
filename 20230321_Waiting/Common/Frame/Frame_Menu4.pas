unit Frame_Menu4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrameMenu4 = class(TFrame)
    Label_Name: TLabel;
    Label_Notice: TLabel;
    Panel_List: TPanel;
  private
    { Private declarations }
  public
    procedure ButtonQtyClick(Sender: TObject);
    { Public declarations }
  end;

implementation

{$R *.dfm}
{ TFrameMenu4 }

procedure TFrameMenu4.ButtonQtyClick(Sender: TObject);
var
  i: Integer;
begin
  //
  for i := Panel_List.ControlCount - 1 Downto 0 do
  begin
    with (Panel_List.Controls[i] as TLabel) do
    begin
      Color := clGray;
      Font.Color := clWhite;
    end;
  end;

  with (Sender as TLabel) do
  begin
    Color := clWhite;
    Font.Color := clBlack;
  end;

  Panel_List.Tag := (Sender as TLabel).Tag;
  if Assigned(Self.OnClick) then
    Self.OnClick(Self);
end;

end.
