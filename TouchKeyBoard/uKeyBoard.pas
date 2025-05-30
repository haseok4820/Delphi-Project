﻿unit uKeyboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ImagingComponents, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TKeyInfo = record
    iTag: Integer;
    sCaption: String;
    iT: Integer;
    iL: Integer;
    iW: Integer;
    iH: Integer;
  end;

  TToolChk = record
    iTool: Integer; // Tool 번호
    bTool: Boolean; // Tool 유무
    bShift: Boolean;
    bTab: Boolean;
    bCaps: Boolean;
  end;

  TfmKeyboard = class(TForm)
    Timer: TTimer;
    procedure KeyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    procedure KeyDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure KeyUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure SEtKeyInfo(iType: Byte);
    procedure SetKeyBoard;
  end;

var
  fmKeyboard: TfmKeyboard;

  arrKeyInfo: array [0 .. 59] of TKeyInfo;
  ToolChk: TToolChk;
  KeyLabel : TLabel;

  arrChar: array [0 .. 59] of String = (
    '~ `',
    '! 1',
    '@ 2',
    '# 3',
    '$ 4',
    '% 5',
    '^ 6',
    '＆ 7',
    '* 8',
    '( 9',
    ') 0',
    '_ -',
    '+ =',
    '| \',
    '←',
    //
    'Tab',
    'Q==ㅃ ㅂ',
    'W==ㅉ ㅈ',
    'E==ㄸ ㄷ',
    'R==ㄲ ㄱ',
    'T==ㅆ ㅅ',
    'Y==ㅤ ㅛ',
    'U==ㅤ ㅕ',
    'I==ㅤ ㅑ',
    'O==ㅒ ㅐ',
    'P==ㅖ ㅔ',
    '{ [',
    '} ]',
    '==',
    //
    'Caps==Lock',
    'A ㅁ',
    'S ㄴ',
    'D ㅇ',
    'F ㄹ',
    'G ㅎ',
    'H ㅗ',
    'J ㅓ',
    'K ㅏ',
    'L ㅣ',
    ': ;',
    '" ''',
    'Enter',
    //
    'Shift',
    'Z ㅋ',
    'X ㅌ',
    'C ㅊ',
    'V ㅍ',
    'B ㅠ',
    'N ㅜ',
    'M ㅡ',
    '< ,',
    '> .',
    '? /',
    'Shift',
    //
    'Ctrl',
    'Win',
    'Alt',
    'Space',
    '한/영',
    '韓字'
  );

  arrTag: array [0 .. 59] of Integer = (
    192,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    48,
    189,
    187,
    220,
    8,
    //
    9,
    81,
    87,
    69,
    82,
    84,
    89,
    85,
    73,
    79,
    80,
    219,
    221,
    13,
    //
    20,
    65,
    83,
    68,
    70,
    71,
    72,
    74,
    75,
    76,
    186,
    222,
    13,
    //
    16,
    90,
    88,
    67,
    86,
    66,
    78,
    77,
    188,
    190,
    191,
    16,
    //
    17,
    91,
    18,
    32,
    21,
    25
  );

implementation

{$R *.dfm}
{ TForm3 }

procedure TfmKeyboard.FormCreate(Sender: TObject);
begin
  SetWindowLong(Self.Handle, GWL_EXSTYLE, WS_EX_NOACTIVATE);
  SetWindowPos(Self.Handle, HWND_TOPMOST, Top, Left, Width, Height, 0);
  SEtKeyInfo(0);
  SetKeyBoard;
end;

procedure TfmKeyboard.KeyDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //
  KeyLabel := (Sender as TLabel);
  if Timer.Enabled = False then
    Timer.Enabled := True
end;

procedure TfmKeyboard.KeyUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //
  KeyLabel := nil;
  Timer.Enabled := False;
  Timer.Interval := 2000;
end;


procedure TfmKeyboard.FormResize(Sender: TObject);
begin
  if (Width < 825) then
    Width := 825
  else if Height < 375 then
    Height := 375
  else
  begin
    SEtKeyInfo(0);
    SetKeyBoard;
  end;
end;

procedure TfmKeyboard.KeyClick(Sender: TObject);
var
  iKey: Byte;
  sKey: String;
  i: Integer;
  j: Integer;
begin
  for i := ControlCount - 1 Downto 0 do
  begin
    if Controls[i] is TLabel then
    begin
      with (Controls[i] as TLabel) do
      begin
        Color := clBlack;
        Font.Color := clWhite;
      end;
    end;
  end;

  if Sender is TLabel then
  begin
    with (Sender as TLabel) do
    begin
      Color := clSkyBlue;
      Font.Color := clBlack;
      iKey := Tag;
      sKey := Hint;

      if iKey = 13 then
      begin
        for i := ControlCount - 1 Downto 0 do
        begin
          if Controls[i] is TLabel then
          begin
            with (Controls[i] as TLabel) do
            begin
              if Tag = 13 then
              begin
                Color := clSkyBlue;
                Font.Color := clBlack;
              end;

            end;
          end;
        end;
      end;
    end;
  end;

  Caption := 'Press' + IntToStr(iKey);

  if (sKey <> '') AND (ToolChk.bTool = False) then
  begin
    ToolChk.bTool := True;
    ToolChk.iTool := iKey;
    Keybd_Event(ToolChk.iTool, MapVirtualKey(ToolChk.iTool, 0), 0, 0);
    case iKey of
      16:
        begin
          ToolChk.bShift := True
        end;
    end;
    Exit;
  end;

  Keybd_Event(iKey, MapVirtualKey(iKey, 0), 0, 0);
  Keybd_Event(iKey, MapVirtualKey(iKey, 0), KEYEVENTF_KEYUP, 0);

  if ToolChk.bTool then
  begin
    ToolChk.bTool := False;
    Keybd_Event(ToolChk.iTool, MapVirtualKey(ToolChk.iTool, 0), KEYEVENTF_KEYUP, 0);
    if ToolChk.bShift then
      ToolChk.bShift := False;
  end;
end;

procedure TfmKeyboard.SetKeyBoard;
var
  i, j: Integer;
begin
  //
  with Font do
  begin
    Size := 16;
    Name := '돋움체';
    style := [fsBold];
  end;

  for i := ControlCount - 1 Downto 0 do
  begin
    (Controls[i]).Free;
  end;

  for i := Low(arrKeyInfo) to High(arrKeyInfo) do
  begin
    with TLabel.Create(Self), arrKeyInfo[i] do
    begin
      Parent := Self;
      WordWrap := True;
      AutoSize := False;
      Layout := tlCenter;
      Alignment := taCenter;
      Transparent := False;
      Color := clBlack;

      Tag := arrKeyInfo[i].iTag;
      Caption := sCaption;
      if i in [15, 42, 53, 54, 56] then
        Hint := 'Tool'
      else
        Hint := '';

      Top := iT;
      Left := iL;
      Width := iW;
      Height := iH;

      OnClick := KeyClick;
      OnMouseDown := KeyDown;
      OnMouseUp := KeyUp;
    end;
  end;

end;

procedure TfmKeyboard.SEtKeyInfo(iType: Byte);
const
  s13 = #13#10;
  iPadding = 7;
  WType_1 = 1.5;
  WType_2 = 2.0;
  WType_3 = 2.5;
var
  iWidth: Integer;
  i, j, k, l: Integer;
begin
  //
  k := 0;
  j := 0;
  iWidth := 10;
  for i := Low(arrKeyInfo) to High(arrKeyInfo) do
  begin
    with arrKeyInfo[i] do
    begin
      iTag := arrTag[i];
      sCaption := StringReplace(arrChar[i], ' ', '  ' + Chr(13) + '  ', [rfIgnoreCase]);
      sCaption := StringReplace(sCaption, '==', ' ', [rfReplaceAll]);

      iH := ClientHeight div 5 - iPadding;
      iW := ((Self.Width div 16) - iPadding) + 3;
      iT := k * (Self.Height div 5 - iPadding);
      case i of
        0 .. 14: // 1
          begin
            if i = 14 then
              inc(k);
          end;
        15 .. 28:
          begin
            if i = 15 then
              iWidth := 10;
            if i = 28 then
            begin
              iH := iH + 10;
              inc(k);
            end;

            if i in [15, 28] then
              iW := Round(iW * WType_1);
          end;
        29 .. 41:
          begin
            if i = 29 then
              iWidth := 10;
            if i = 41 then
              inc(k);

            if i in [29, 41] then
              iW := Round(iW * WType_2);
          end;
        42 .. 53:
          begin
            if i = 42 then
              iWidth := 10;
            if i = 53 then
              inc(k);

            if i in [42, 53] then
              iW := Round(iW * WType_3);
          end;
        54 .. 59:
          begin
            if i = 54 then
              iWidth := 10;
            if i = 57 then
              iW := Round((iW * WType_1) * 5)
            else
              iW := Round(iW * WType_1);

          end;
      end;

      iL := iWidth;
      if i = 14 then
        l := iW + iL;

      if i in [28, 41, 53, 59] then
        iW := l - iL;

      iWidth := iWidth + iW + iPadding;
      // iL := j * iW + 10;
      inc(j);
    end;
  end;

end;

procedure TfmKeyboard.TimerTimer(Sender: TObject);
begin
  Timer.Interval := Timer.Interval div 2;
  if Timer.Interval <= 10 then
    Timer.Interval := 10;
  KeyClick(KeyLabel);


end;

end.
