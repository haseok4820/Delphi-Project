unit Frame_Edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type

  TLabel = class(Vcl.StdCtrls.TLabel)
  protected
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
  end;
  TFrame_ENV_Edit = class(TFrame)
    Label_Key: TLabel;
    Panel_Body: TPanel;
    Edit_Value: TEdit;
    procedure FrameClick(Sender: TObject);
    procedure Panel_BodyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrame_ENV_Edit.FrameClick(Sender: TObject);
begin
  Edit_Value.SetFocus;
end;

procedure TFrame_ENV_Edit.Panel_BodyClick(Sender: TObject);
begin
  Edit_Value.SetFocus;
end;

{ TLabel }

procedure TLabel.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

end.
