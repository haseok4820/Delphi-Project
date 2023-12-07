unit Frame_Download;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrameDownload = class(TFrame)
    Label_Name: TLabel;
    Image_Open: TImage;
    ProgressBar1: TProgressBar;
    Label_Path: TLabel;
    Image_Delete: TImage;
    procedure Image_DeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM;

procedure TFrameDownload.Image_DeleteClick(Sender: TObject);
var
  sHint: String;
begin
  //
end;

end.
