unit fmENV_Admin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm_ENV_Admin = class(TForm)
    Panel_Header: TPanel;
    Panel_Footer: TPanel;
    Panel_Client: TPanel;
    Image_MSG: TImage;
    Label_MSG: TLabel;
    Label_Title: TLabel;
    Panel_Body: TPanel;
    PageControl_Body: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Timer_Tab: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    procedure Image_BGClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl_BodyChange(Sender: TObject);
    procedure Timer_TabTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ENV_Admin: TForm_ENV_Admin;

implementation

{$R *.dfm}

procedure TForm_ENV_Admin.FormShow(Sender: TObject);
begin
  Timer_Tab.Enabled := True;
end;

procedure TForm_ENV_Admin.Image_BGClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_ENV_Admin.PageControl_BodyChange(Sender: TObject);
begin
//  ShowMEssage(IntToStr(PageControl_Body.TabIndex));
end;

procedure TForm_ENV_Admin.Timer_TabTimer(Sender: TObject);
begin
  Timer_Tab.Enabled := False;
  PageControl_Body.TabWidth := Panel_Body.Width div 7 -3;
end;

end.
