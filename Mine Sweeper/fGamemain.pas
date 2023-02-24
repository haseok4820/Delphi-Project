unit fGamemain;

// 만든이 Miniuser
// E-Mail : haseok4820@naver.com

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  ImagingComponents;

type
  TMap = record
    iX: Integer;
    iY: Integer;
    iW: Integer;
    iH: Integer;
    iLevel: Integer;
    bTimer: Boolean;
  end;

  TResult_BI = record
    BMine: Boolean; // 지뢰유무
    iCnt: Integer; // 주위 총 지뢰수
  end;

  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Help1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Panel_Header: TPanel;
    Panel_Footer: TPanel;
    Label_Time: TLabel;
    Label1: TLabel;
    Panel_Map: TPanel;
    Timer: TTimer;
    Image_Icon: TImage;
    N5: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure NewClick(Sender: TObject);
    procedure Shape_MapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Label_MapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Image_IconClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    procedure Map(X, Y: Integer); // Init
    procedure MapClick(Sender: TObject; X, Y: Integer); overload; // Left Click
    procedure MapClick(Sender: TObject); overload; // Right Click
    procedure MapCheck;

  public
    { Public declarations }
    function ShowPopup(sMSG: String; iViewType: Byte): Integer;
  end;

const
  cMSG_Normal = 0;
  cMSG_YESNO = 1;

var
  fmMain: TfmMain;
  MapInfo: TMap;
  arrMineInfo: array of array of TResult_BI;
  bFail: Boolean = False;
  tStart: TDateTime;

implementation

{$R *.dfm}

uses fNewGame;
{ TForm2 }

procedure TfmMain.FormShow(Sender: TObject);
begin
  //
  with MapInfo do
  begin
    iX := 8;
    iY := 8;
    iW := 30;
    iH := 30;
    iLevel := 6;

    Map(iX, iY);
  end;
end;

procedure TfmMain.Image_IconClick(Sender: TObject);
begin
  MapCheck;
end;

procedure TfmMain.N4Click(Sender: TObject);
var
  sl: TStringList;
begin

  sl := TStringList.Create;
  try
    sl.Add('Made up : Miniuser');
    sl.Add('E-Mail : haseok4820@naver.com');
    sl.Add('Program By Delphi (Rad Studio)');
    sl.Add('Copyright 2022 Miniuser All Rights reserved.');
    sl.Add('Thank you for Playing');

    ShowPopup(sl.Text, cMSG_Normal);
  finally
    sl.Free;
  end;
end;

procedure TfmMain.NewClick(Sender: TObject);
begin
  fmNew := TfmNew.Create(Self);
  with fmNew do
  begin
    ShowModal;

    if ModalResult = mrOK then
    begin
      with MapInfo do
      begin
        if CheckBox_Self.Checked = False then
        begin
          case GROUP1.ItemIndex of
            0:
              begin
                iX := 8;
                iY := 8;
                iLevel := 6;
              end;
            1:
              begin
                iX := 16;
                iY := 16;
                iLevel := 5;
              end;
            2:
              begin
                iX := 32;
                iY := 32;
                iLevel := 4;
              end;
          end;

        end
        else
        begin
          iX := StrToIntDef(Edit_Width.Text, 8);
          iY := StrToIntDef(Edit_Height.Text, 8);
          iLevel := 10 - TrackBar_.Position;
        end;

        bTimer := CheckBox_Timer.Checked;
        iW := 30;
        iH := 30;

        Map(iX, iY);
      end;
    end;
    Free;
  end;
end;

procedure TfmMain.Shape_MapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, j: Integer;
  sHint: String;
begin
  //
  if Sender is TShape then
  begin
    i := (Sender as TShape).Tag div 1000;
    j := (Sender as TShape).Tag mod 1000;
  end;

  if Button = mbLeft then
  begin
    if Sender is TShape then
      MapClick(Sender, i, j)
    else
      MapClick(Sender);
  end
  else if Button = mbRight then
    MapClick(Sender);

  if bFail = False then
    MapCheck;
end;

procedure TfmMain.Label_MapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i, j: Integer;
  ic, iTag: Integer;
  iCap, iVal: Byte; // 지뢰개수, 지정한 지뢰 개수, 처리할 이벤트 수
  arrMapClick: array [1 .. 9] of Integer;
begin
  //
  if Button <> mbRight then
    Exit;

  iCap := 10;
  iVal := 0;
  if Sender is TLabel then
  begin
    // 지뢰 체크
    with (Sender as TLabel) do
    begin
      iCap := StrToIntDef(Caption, 0);
      iTag := StrToIntDef(Copy(Name, Pos('_', Name) + 1, 5), 0);
      i := iTag div 1000;
      j := iTag mod 1000;
    end;

    for ic := 1 to 9 do
    begin
      if ic = 5 then
        Continue;

      case ic of
        1:
          iTag := (i - 1) * 1000 + (j - 1);
        2:
          iTag := (i - 1) * 1000 + j;
        3:
          iTag := (i - 1) * 1000 + (j + 1);

        // Middle
        4:
          iTag := i * 1000 + (j - 1);
        6:
          iTag := i * 1000 + (j + 1);

        // Bottom
        7:
          iTag := (i + 1) * 1000 + (j - 1);
        8:
          iTag := (i + 1) * 1000 + j;
        9:
          iTag := (i + 1) * 1000 + (j + 1);
      end;

      if (FindComponent('Image_' + IntToStr(iTag)) as TImage) <> nil then
      begin
        arrMapClick[ic] := -1;
        inc(iVal);
      end
      else
        arrMapClick[ic] := iTag;
    end;
  end;

  if (iCap = iVal) then
  begin
    for ic := 1 to 9 do
    begin
      iTag := arrMapClick[ic];

      if (ic = 5) OR ((FindComponent('Label_' + IntToStr(iTag)) as TLabel) <> nil) then
        Continue
      else if iTag <> -1 then
        MapClick(nil, (iTag div 1000) - 1, (iTag mod 1000) - 1);
    end;
  end
  else
  begin
    ShowMEssage('먼저 지뢰 예상 지점을 처리후 진행해주세요!' + #13#10 + 'Please proceed after processing the estimated landmine point first!');
  end;
end;

function TfmMain.ShowPopup(sMSG: String; iViewType: Byte): Integer;
begin
  case iViewType of
    0:
      begin
        ShowMEssage(sMSG);
        Result := 1;
      end;
    1:
      begin
        Result := MessageDlg(sMSG, mtCustom, [mbYes, mbNo], 0);
      end;
  end;
end;

procedure TfmMain.TimerTimer(Sender: TObject);
begin
  Label_Time.Caption := Label_Time.Hint + FormatDateTime('HH:MM:SS', Now - tStart);
end;

procedure TfmMain.ExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfmMain.Map(X, Y: Integer);
var
  i, j, k: Integer;
begin
  // 초기화
  Application.ProcessMessages;

  bFail := False;
  fmMain.Width := MapInfo.iX * 30 + 100;
  fmMain.Height := MapInfo.iY * 30 + 175;

  SetLength(arrMineInfo, 0);

  if Panel_Map.ControlCount <> 0 then
  begin
    for i := Panel_Map.ControlCount - 1 Downto 0 do
    begin
      with Panel_Map do
      begin
        if Controls[i] is TLabel then
          (Controls[i] as TLabel).Free
        else if Controls[i] is TShape then
          (Controls[i] as TShape).Free
        else if Controls[i] is TImage then
          (Controls[i] as TImage).Free;
      end;
    end;
  end;

  // 생성
  SetLength(arrMineInfo, X);
  k := (Panel_Map.Width - ((X) * MapInfo.iW)) div 2;
  for i := 0 to X - 1 do
  begin
    SetLength(arrMineInfo[i], Y);
    for j := 0 to Y - 1 do
    begin
      with arrMineInfo[i, j] do
      begin
        BMine := Random(MapInfo.iLevel) = 0;
        iCnt := 0;
      end;

      with TShape.Create(Self) do
      begin
        Parent := Panel_Map;
        Name := 'Shape_' + IntToStr((i + 1) * 1000 + (j + 1));
        Tag := i * 1000 + j;
        Top := j * MapInfo.iH + Panel_Map.Padding.Top;
        Left := i * MapInfo.iW + k;
        Width := MapInfo.iW;
        Height := MapInfo.iH;

        Brush.Color := clSilver;
        OnMouseDown := Shape_MapMouseDown;
      end;
    end;
  end;

  // 타이머
  if MapInfo.bTimer then
  begin
    tStart := Now;

    Timer.Enabled := True;
    Label_Time.Visible := True;
    Label_Time.Caption := Label_Time.Hint + FormatDateTime('HH:MM:SS', Now - tStart);
  end
  else
  begin
    Timer.Enabled := False;
    Label_Time.Visible := False;
  end;
end;

procedure TfmMain.MapCheck;
var
  i, j: Integer;
  bVictory: Boolean;
  sMSG: String;
begin
  // 승리유무 확인
  bVictory := True;
  for i := Low(arrMineInfo) to High(arrMineInfo) do
  begin
    for j := Low(arrMineInfo[i]) to High(arrMineInfo[i]) do
    begin
      if (arrMineInfo[i, j].BMine = False) AND ((FindComponent('Shape_' + IntToStr((i + 1) * 1000 + (j + 1))) as TShape).Brush.Color <>
        clWhite) then
      begin
        Image_Icon.Hint := IntToStr((i + 1) * 1000 + (j + 1));
        bVictory := False;
        Break;
      end;
    end;
  end;

  if bVictory then
  begin
    bFail := True;
    if (MapInfo.iLevel = 2) AND (MapInfo.iX = 2017) AND (MapInfo.iY = 217) then
      sMSG := '우리 하늘/바다 생일이에요~,' + Chr(13) + '오늘도 고생하셨고,좋은 하루 보내세요.'
    else
    begin
      sMSG := '축하합니다!! 해내셨어요!' + Chr(13) + '난이도를 높여 게속 진행하시겠어요?';
      sMSG := sMSG + Chr(13) + 'Congratulations! You made it!!' + Chr(13) + 'Do you want to increase the difficulty level and continue?';

      if MapInfo.bTimer then
        sMSG := sMSG + Chr(13) + Chr(13) + Label_Time.Caption;
    end;

    if ShowPopup(sMSG, cMSG_YESNO) = mrYes then
    begin
      with MapInfo do
      begin
        if iLevel <> 2 then
          dec(iLevel);
        inc(iX);
        inc(iY);

        Map(iX, iY);
      end;
    end;
  end;
end;

procedure TfmMain.MapClick(Sender: TObject);
var
  sFlagName: String;
  iL, iT, iW, iH: Integer;
begin
  if Sender is TShape then
  begin
    with (Sender as TShape) do
    begin
      iL := Left;
      iT := Top;
      iW := Width;
      iH := Height;

      Brush.Color := clGreen;
      sFlagName := StringReplace(Name, 'Shape', 'Image', [rfIgnoreCase]);
    end;

    with TImage.Create(Self) do
    begin
      Parent := Panel_Map;
      Stretch := True;
      AutoSize := False;

      Name := sFlagName;
      Left := iL;
      Top := iT;
      Width := iW;
      Height := iH;

      Picture.Assign(nil);
      OnClick := MapClick;
      OnMouseDown := Shape_MapMouseDown;

    end;

  end
  else if Sender is TImage then
  begin
    sFlagName := StringReplace((Sender as TImage).Name, 'Image', 'Shape', [rfIgnoreCase]);
    (Sender as TImage).Free;

    (FindComponent(sFlagName) as TShape).Brush.Color := clSilver;
  end;
end;

procedure TfmMain.MapClick(Sender: TObject; X, Y: Integer);
var
  arrRange: array [1 .. 9] of Boolean;
  bMineChk: Boolean;
  i, j: Integer;
  i2, j2: Integer;
  iL, iT, iW, iH: Integer;
begin
  if (X < 0) OR (Y < 0) then
    Exit;

  if Sender is TShape then
  begin
    with (Sender as TShape) do
    begin
      iL := Left;
      iT := Top;
      iW := Width;
      iH := Height;

      if arrMineInfo[X, Y].BMine then
      begin
        bFail := True;
        Brush.Color := clRed;
      end
      else
        Brush.Color := clWhite;
    end;
  end
  else if Sender = Nil then
  begin
    if FindComponent('Shape_' + IntToStr((X + 1) * 1000 + (Y + 1))) = nil then
      Exit;

    with (FindComponent('Shape_' + IntToStr((X + 1) * 1000 + (Y + 1))) as TShape) do
    begin
      iL := Left;
      iT := Top;
      iW := Width;
      iH := Height;

      if arrMineInfo[X, Y].BMine then
        Brush.Color := clRed
      else
        Brush.Color := clWhite;
    end;
  end;

  if arrMineInfo[X, Y].BMine then
  begin
    if ShowPopup('Game Over' + Chr(13) + 'try again?', cMSG_YESNO) = mrYes then
    begin
      Map(MapInfo.iX, MapInfo.iY);
      Exit;
    end
    else
    begin
      with TImage.Create(Self) do
      begin
        Parent := Panel_Map;
        Name := 'Image_' + IntToStr((X + 1) * 1000 + (Y + 1));;
        Stretch := True;

        Top := iT;
        Left := iL;
        Width := iW;
        Height := iH;
      end;
    end;

  end
  else
  begin
    for i := 1 to 9 do
    begin
      arrRange[i] := True;
    end;

    if X = Low(arrMineInfo) then
    begin
      for i := 1 to 3 do
        arrRange[i] := False;
    end;
    if X = High(arrMineInfo) then
    begin
      for i := 7 to 9 do
        arrRange[i] := False;
    end;

    if Y = Low(arrMineInfo[X]) then
    begin
      for i := 1 to 7 do
      begin
        if (i - 1) mod 3 = 0 then
          arrRange[i] := False;
      end;
    end;
    if Y = High(arrMineInfo[X]) then
    begin
      for i := 3 to 9 do
      begin
        if i mod 3 = 0 then
          arrRange[i] := False;
      end;
    end;

    j := 0;
    for i := Low(arrRange) to High(arrRange) do
    begin
      if arrRange[i] = False then
        Continue;

      bMineChk := False;
      case i of
        // Top
        1:
          bMineChk := arrMineInfo[X - 1, Y - 1].BMine;
        2:
          bMineChk := arrMineInfo[X - 1, Y].BMine;
        3:
          bMineChk := arrMineInfo[X - 1, Y + 1].BMine;

        // Middle
        4:
          bMineChk := arrMineInfo[X, Y - 1].BMine;
        6:
          bMineChk := arrMineInfo[X, Y + 1].BMine;

        // Bottom
        7:
          bMineChk := arrMineInfo[X + 1, Y - 1].BMine;
        8:
          bMineChk := arrMineInfo[X + 1, Y].BMine;
        9:
          bMineChk := arrMineInfo[X + 1, Y + 1].BMine;
      end;
      if bMineChk then
        inc(arrMineInfo[X, Y].iCnt);
    end;

    with TLabel.Create(Self) do
    begin
      Parent := Panel_Map;
      Alignment := taCenter;
      Layout := tlCenter;
      AutoSize := False;

      Name := 'Label_' + IntToStr((X + 1) * 1000 + (Y + 1));
      if arrMineInfo[X, Y].iCnt = 0 then
        Caption := ''
      else
        Caption := IntToStr(arrMineInfo[X, Y].iCnt);
      Tag := i * 1000 + j;

      Top := iT;
      Left := iL;
      Width := iW;
      Height := iH;

      OnMouseDown := Label_MapMouseDown;

      with font do
      begin
        Style := [fsBold];
      end;

    end;

    if arrMineInfo[X, Y].iCnt = 0 then
    begin
      for i := Low(arrRange) to High(arrRange) do
      begin

        if (arrRange[i] = False) then
          Continue;

        bMineChk := False;
        case i of
          // Top
          1:
            begin
              i2 := X - 1;
              j2 := Y - 1;
            end;
          2:
            begin
              i2 := X - 1;
              j2 := Y;
            end;
          3:
            begin
              i2 := X - 1;
              j2 := Y + 1;
            end;

          4:
            begin
              i2 := X;
              j2 := Y - 1;
            end;
          6:
            begin
              i2 := X;
              j2 := Y + 1;
            end;

          7:
            begin
              i2 := X + 1;
              j2 := Y - 1;
            end;
          8:
            begin
              i2 := X + 1;
              j2 := Y;
            end;
          9:
            begin
              i2 := X + 1;
              j2 := Y + 1;
            end;
        else
          Continue;
        end;

        if FindComponent('Label_' + IntToStr((i2 + 1) * 1000 + (j2 + 1))) <> nil then
        begin
          Continue;
        end;

        MapClick(nil, i2, j2);

        if bMineChk then
          inc(arrMineInfo[X, Y].iCnt);
      end;
    end;

  end;

end;

end.
