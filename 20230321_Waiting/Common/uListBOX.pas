unit uListBOX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ImagingComponents, Vcl.ComCtrls;

type
  TFormList = class(TForm)
    LabelOK: TLabel;
    LabelTitle: TLabel;
    ImageCancel: TImage;
    PanelRight: TPanel;
    ButtonUP: TButton;
    ButtonDown: TButton;
    ListViewList: TListView;
    Timer_Scroll: TTimer;
    procedure FormShow(Sender: TObject);
    procedure ImageCancelClick(Sender: TObject);
    procedure LabelOKClick(Sender: TObject);
    procedure ButtonScrollClick(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ButtonUPMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ButtonUPMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Timer_ScrollTimer(Sender: TObject);
    procedure ListViewListSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure ListViewListDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowMenus;
  public
    { Public declarations }
  end;

var
  FormList: TFormList;
  iScroll: Integer;

implementation

{$R *.dfm}

uses uDM, Frame_Menu3;

procedure TFormList.ButtonScrollClick(Sender: TObject);
begin
  case (Sender as TButton).Tag of
    0:
      ListViewList.Scroll(0, ListViewList.ClientHeight div 2);
    1:
      ListViewList.Scroll(0, -ListViewList.ClientHeight div 2);
  end;
end;

procedure TFormList.ButtonUPMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer_Scroll.Enabled := True;
  Timer_Scroll.Tag := (Sender as TButton).Tag;
end;

procedure TFormList.ButtonUPMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer_Scroll.Enabled := False;
  Timer_Scroll.Interval := 500;
end;

procedure TFormList.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin

  if WheelDelta >= 0 then
    SendMEssage(ListViewList.Handle, WM_VSCROLL, SB_LINELEFT, 0)
  else
    SendMEssage(ListViewList.Handle, WM_VSCROLL, SB_LINERIGHT, 0);
end;

procedure TFormList.FormShow(Sender: TObject);
begin
  with ClientRect do
  begin
    SetWindowRgn(Handle, CreateRoundRectRgn(Left, Top, Right + 1, Bottom + 1, 30, 30), True);
  end;

  ButtonUP.Height := PanelRight.Height div 2;
  ButtonDown.Height := ButtonUP.Height;
end;

procedure TFormList.ImageCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormList.LabelOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFormList.ListViewListDblClick(Sender: TObject);
begin
  if LabelOK.Enabled then
    LabelOKClick(LabelOK);

end;

procedure TFormList.ListViewListSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  LabelOK.Enabled := Selected;
end;

procedure TFormList.ShowMenus;
begin
end;

procedure TFormList.Timer_ScrollTimer(Sender: TObject);
begin
  if Timer_Scroll.Interval <> 100 then
  begin
    Timer_Scroll.Interval := Timer_Scroll.Interval div 2;
    if Timer_Scroll.Interval < 100 then
      Timer_Scroll.Interval := 100;
  end;

  case Timer_Scroll.Tag of
    0:
      ButtonScrollClick(ButtonDown);
    1:
      ButtonScrollClick(ButtonUP);

  end;
end;

end.
