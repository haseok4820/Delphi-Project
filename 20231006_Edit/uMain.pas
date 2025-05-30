unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls, System.Actions, Vcl.ActnList;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    MaskEdit1: TMaskEdit;
    Panel2: TPanel;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Panel_RichEditOption: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel3: TPanel;
    Shape1: TShape;
    Button5: TButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    ColorDialog1: TColorDialog;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure RichEditEventClick(Sender: TObject);
    procedure RichEdit1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RichEdit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RichEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  Rich_Bold = 0;
  Rich_Under = 1;
  Rich_Italic = 2;
  Rich_StrikeOut = 3;
  Rich_Color = 4;
  Rich_Font = 5;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uList;

procedure TForm1.RichEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      Ord('B'), Ord('b'):
        begin
          RichEditEventClick(Button1);
        end;
      Ord('U'), Ord('u'):
        begin
          RichEditEventClick(Button2);
        end;
      Ord('I'), Ord('i'):
        begin
          RichEditEventClick(Button3);
        end;
      Ord('D'), Ord('d'):
        begin
          RichEditEventClick(Button4);
        end;
    end;
  end;

end;

procedure TForm1.RichEdit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Label1.Caption := 'RichEdit SelInfo : ' + RichEdit1.SelText + IntToSTr(RichEdit1.SelStart) + ' ' + IntToSTr(RichEdit1.SelLength);
end;

procedure TForm1.RichEdit1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Label1.Caption := 'RichEdit SelInfo : ' + RichEdit1.SelText + IntToSTr(RichEdit1.SelStart) + ' ' + IntToSTr(RichEdit1.SelLength);
end;

procedure TForm1.RichEditEventClick(Sender: TObject);
var
  iTag: Byte;
begin
  iTag := (Sender as TButton).Tag;
  case iTag of
    Rich_Bold:
      RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style + [fsBold];
    Rich_Italic:
      RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style + [fsItalic];
    Rich_Under:
      RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style + [fsUnderline];
    Rich_StrikeOut:
      RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style + [fsStrikeOut];
    Rich_Color:
      RichEdit1.SelAttributes.Color := Shape1.Brush.Color;
    Rich_Font:
      begin
        Form_List := TForm_List.Create(Self);
        with Form_List do
        begin
          ShowModal;
          if ModalResult = mrOK then
            RichEdit1.SelAttributes.Name := Hint;
          Free;
        end;
      end;
  end;
end;

procedure TForm1.Shape1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ColorDialog1.Color := Shape1.Brush.Color;
  if ColorDialog1.Execute then
    Shape1.Brush.Color := ColorDialog1.Color;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RichEdit1.SelAttributes.Style := RichEdit1.SelAttributes.Style + [fsBold];
end;

end.
