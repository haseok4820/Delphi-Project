unit Frame_MenuInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Frame_ComboBox, Frame_CheckBox, Vcl.ExtCtrls;

type
  TFrame_ENV_MenuInfo = class(TFrame)
    Frame_MenuKit: TFrame_ENV_ComboBox;
    Edit_MenuName: TEdit;
    Edit_MenuAmount: TEdit;
    Image_MenuCheck: TImage;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
