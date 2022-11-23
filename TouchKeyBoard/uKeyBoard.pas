unit uKeyBoard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Touch.Keyboard, imm,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, Vcl.AppEvnts;

type
  TKeyBoard_Info = record
    bHangul: Boolean; // 한/영 체크
    bTool: Boolean; // Shift, Alt, Ctrl 통합
    iTool: Integer; // 구분
    {
      bCapsLoack: Boolean; // Caps Loack 체크
      bShift: Boolean; // Shift 체크
      bCtrl: Boolean; // Ctrl 체크
      bAlt: Boolean; // Alt 체크
    }
  end;

  TForm_KeyBoard = class(TForm)
    Panel1: TPanel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel2: TPanel;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button29: TButton;
    Panel3: TPanel;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Button36: TButton;
    Button37: TButton;
    Button38: TButton;
    Button39: TButton;
    Button40: TButton;
    Button41: TButton;
    Button43: TButton;
    Button44: TButton;
    Button45: TButton;
    Button16: TButton;
    Button27: TButton;
    Panel4: TPanel;
    Button28: TButton;
    Button30: TButton;
    Button31: TButton;
    Button42: TButton;
    Button46: TButton;
    Button47: TButton;
    Button48: TButton;
    Button49: TButton;
    Button50: TButton;
    Button51: TButton;
    Button54: TButton;
    Button55: TButton;
    Panel5: TPanel;
    Button60: TButton;
    Button62: TButton;
    Button63: TButton;
    Button_Close: TButton;
    Button53: TButton;
    Button56: TButton;
    Label_MadeBy: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button_CloseClick(Sender: TObject);
    procedure Label_MadeByClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetKeyList(iType: Byte);
  public
    { Public declarations }
  end;

const
  const_KEYNUMBER = 10;

var
  Form_KeyBoard: TForm_KeyBoard;
  KeyBoard_Info: TKeyBoard_Info;

implementation

{$R *.dfm}

procedure TForm_KeyBoard.Button2Click(Sender: TObject);
var
  iKey: Byte;
  sKey: String;
  ks: TKeyboardState;
  i: Integer;
  j: Integer;

  KeyType_Hangul: Boolean;
begin
  if Sender is TButton then
  begin
    iKey := (Sender as TButton).Tag;
    sKey := (Sender as TButton).Hint;
  end;

  Caption := 'Press' + IntToStr(iKey);
  if (sKey <> '') AND (KeyBoard_Info.bTool = False) then
  begin
    KeyBoard_Info.bTool := True;
    KeyBoard_Info.iTool := iKey;
    Keybd_Event(iKey, MapVirtualKey(iKey, 0), 0, 0);
    Exit;
  end;

  Keybd_Event(iKey, MapVirtualKey(iKey, 0), 0, 0);
  Keybd_Event(iKey, MapVirtualKey(iKey, 0), KEYEVENTF_KEYUP, 0);

  if KeyBoard_Info.bTool then
  begin
    KeyBoard_Info.bTool := False;
    Keybd_Event(iKey, MapVirtualKey(KeyBoard_Info.iTool, 0), KEYEVENTF_KEYUP, 0);
  end;

  GetKeyboardState(ks);

  KeyType_Hangul := NOT KeyType_Hangul;

end;

procedure TForm_KeyBoard.Button_CloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_KeyBoard.FormCreate(Sender: TObject);
var
  hContext: HIMC;
  mcon, msen: DWORD;

  i, j: Byte;
begin
  SetWindowLong(Self.Handle, GWL_EXSTYLE, WS_EX_NOACTIVATE);
  ImmSetConversionStatus(hContext, IME_CMODE_HANGUL, IME_SMODE_NONE);

  KeyBoard_Info.bTool := False;
end;

procedure TForm_KeyBoard.GetKeyList(iType: Byte);
var
  i, j: Integer;
begin
  // KeyBoard Type
  // 0 - Number & Key
  // 1 - Key
  // 2 - Number
  if ControlCount <> 0 then
  begin
    for i := ControlCount - 1 Downto 0 do
    begin
      if Controls[i] is TButton then
        (Controls[i] as TButton).Free;

    end;
  end;

  case iType of
    0:
      begin
        // Number
        for i := 0 to 9 do
        begin
          with TButton.Create(Self) do
          begin
            Parent := Self;
            Name := 'Num' + IntToStr(i);
            Tag := i + 48;
            Hint := IntToStr(i);
            Caption := Hint;

            Width := (Self.ClientWidth div 10);
            Height := (Self.ClientHeight div 5);

            Top := 5;
            Left := 5 + (i * Width);

            onClick := Button2Click;
          end;

        end;

        for i := 0 to 9 do
        begin
          with TButton.Create(Self) do
          begin
            Parent := Self;
            Name := 'Key_Top' + IntToStr(i);
            Width := (Self.ClientWidth div 10);
            Height := (Self.ClientHeight div 5);
            Top := 10 + Height;
            Left := 5 + (i * Width);
            case i of
              0:
                begin
                  Tag := 81;
                  Caption := 'Q(ㅂ)';
                end;
              1:
                Begin
                  Tag := 87;
                  Caption := 'W(ㅈ)';
                end;
              2:
                Begin
                  Tag := 69;
                  Caption := 'E(ㄷ)';
                end;
              3:
                Begin
                  Tag := 82;
                  Caption := 'R(ㄱ)';
                end;
              4:
                Begin
                  Tag := 84;
                  Caption := 'T(ㅅ)';
                end;
              5:
                Begin
                  Tag := 89;
                  Caption := 'Y(ㅛ)';
                end;
              6:
                Begin
                  Tag := 85;
                  Caption := 'U(ㅕ)';
                end;
              7:
                Begin
                  Tag := 73;
                  Caption := 'I(ㅑ)';
                end;
              8:
                Begin
                  Tag := 79;
                  Caption := 'O(ㅐ)';
                end;
              9:
                Begin
                  Tag := 80;
                  Caption := 'P(ㅔ)';
                end;
            end;
            onClick := Button2Click;
          end;

        end;

        for i := 0 to 8 do
        begin
          with TButton.Create(Self) do
          begin
            Parent := Self;
            Name := 'Key_Middle' + IntToStr(i);
            Width := (Self.ClientWidth div 9);
            Height := (Self.ClientHeight div 5);
            Top := 10 + (Height * 2);
            Left := 5 + (i * Width);
            case i of
              0:
                begin
                  Tag := 65;
                  Caption := 'A(ㅁ)';
                end;
              1:
                Begin
                  Tag := 83;
                  Caption := 'S(ㄴ)';
                end;
              2:
                Begin
                  Tag := 68;
                  Caption := 'D(ㄷ)';
                end;
              3:
                Begin
                  Tag := 70;
                  Caption := 'F(ㄹ)';
                end;
              4:
                Begin
                  Tag := 71;
                  Caption := 'G(ㅎ)';
                end;
              5:
                Begin
                  Tag := 72;
                  Caption := 'H(ㅗ)';
                end;
              6:
                Begin
                  Tag := 74;
                  Caption := 'J(ㅓ)';
                end;
              7:
                Begin
                  Tag := 75;
                  Caption := 'K(ㅏ)';
                end;
              8:
                Begin
                  Tag := 76;
                  Caption := 'L(ㅣ)';
                end;
            end;
            onClick := Button2Click;
          end;

        end;

        for i := 0 to 6 do
        begin
          with TButton.Create(Self) do
          begin
            Parent := Self;
            Name := 'Key_Bottom' + IntToStr(i);
            Width := (Self.ClientWidth div 7);
            Height := (Self.ClientHeight div 5);
            Top := 10 + (Height * 3);
            Left := 5 + (i * Width);
            case i of
              0:
                begin
                  Tag := 90;
                  Caption := 'Z(ㅋ)';
                end;
              1:
                Begin
                  Tag := 88;
                  Caption := 'X(ㅌ)';
                end;
              2:
                Begin
                  Tag := 67;
                  Caption := 'C(ㅊ)';
                end;
              3:
                Begin
                  Tag := 86;
                  Caption := 'V(ㅍ)';
                end;
              4:
                Begin
                  Tag := 66;
                  Caption := 'B(ㅠ)';
                end;
              5:
                Begin
                  Tag := 78;
                  Caption := 'N(ㅜ)';
                end;
              6:
                Begin
                  Tag := 77;
                  Caption := 'M(ㅡ)';
                end;
            end;
            onClick := Button2Click;
          end;

        end;

        for i := 0 to 3 do
        begin
          with TButton.Create(Self) do
          begin
            Parent := Self;
            Name := 'Key_Option' + IntToStr(i);
            Width := (Self.ClientWidth div 4);
            Height := (Self.ClientHeight div 5);
            Top := 10 + (Height * 4);
            Left := 5 + (i * Width);
            case i of
              0:
                begin
                  Tag := VK_SHIFT;
                  Caption := 'Shift';
                end;
              1:
                Begin
                  Tag := VK_SPACE;
                  Caption := 'Space';
                end;
              2:
                Begin

                  Tag := VK_HANGUL;
                  Caption := '한/Eng';
                end;
              3:
                Begin
                  Tag := VK_RETURN;
                  Caption := 'Enter';
                end;
            end;
            onClick := Button2Click;
          end;

        end;
      end;

    1:
      begin

      end;

  end;

end;

procedure TForm_KeyBoard.Label_MadeByClick(Sender: TObject);
begin
  sHOWmeSSAGE('Copyright @ Miniuser. All rights Reserved.');
end;

end.
