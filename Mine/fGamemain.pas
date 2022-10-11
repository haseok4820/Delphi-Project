unit fGamemain;

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
  end;

  TResult_BI = record
    BMine: Boolean; // ��������
    iCnt: Integer; // ���� �� ���ڼ�
  end;

  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Help1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
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
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    procedure Map(X, Y: Integer);
    procedure MapClick(Sender: TObject; X, Y: Integer); overload; // ��Ŭ��
    procedure MapClick(Sender: TObject); overload; // ��Ŭ��
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  MapInfo: TMap;
  arrMineInfo: array of array of TResult_BI;

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

    Map(iX, iY);
  end;
end;

procedure TfmMain.N3Click(Sender: TObject);
begin
  //
end;

procedure TfmMain.NewClick(Sender: TObject);
begin
  fmNew := TfmNew.Create(Self);
  with fmNew do
  begin
    ShowModal;
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
    MapClick(Sender, i, j)
  else if Button = mbRight then
    MapClick(Sender);

end;

procedure TfmMain.ExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfmMain.Map(X, Y: Integer);
var
  i, j, k: Integer;
begin
  // �ʱ�ȭ
  SetLength(arrMineInfo, 0);
  if Panel_Map.ControlCount <> 0 then
  begin
    with Panel_Map do
    begin
      for i := Low(ControlCount) Downto 0 do
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

  // ����
  SetLength(arrMineInfo, X);
  k := (Panel_Map.Width - ((X) * MapInfo.iW)) div 2;
  for i := 0 to X - 1 do
  begin
    SetLength(arrMineInfo[i], Y);
    for j := 0 to Y - 1 do
    begin
      with arrMineInfo[i, j] do
      begin
        BMine := Random(4) = 0;
        iCnt := 0;
      end;

      with TShape.Create(Self) do
      begin
        Parent := Panel_Map;
        Name := 'Shape_' + IntToStr((i + 1) * 1000 + (j + 1));
        Tag := i * 1000 + j;
        Top := i * MapInfo.iH + Panel_Map.Padding.Top;
        Left := j * MapInfo.iW + k;
        Width := MapInfo.iW;
        Height := MapInfo.iH;

        Brush.Color := clSilver;

        OnMouseDown := Shape_MapMouseDown;
      end;
    end;
  end;
end;

procedure TfmMain.MapClick(Sender: TObject);
var
  iL, iT, iW, iH: Integer;
begin
  with (Sender as TShape) do
  begin
    iL := Left;
    iT := Top;
    iW := Width;
    iH := Height;
  end;

  with TImage.Create(Self) do
  begin
    Parent := Panel_Map;
    Name := 'Image_Flag' + (Sender as TShape).Tag;
  end;
end;

procedure TfmMain.MapClick(Sender: TObject; X, Y: Integer);
var
  arrRange: array [1 .. 9] of Boolean;
  bMineChk: Boolean;
  i, j: Integer;
  iL, iT, iW, iH: Integer;
begin
  with (Sender as TShape) do
  begin
    iL := Left;
    iT := Top;
    iW := Width;
    iH := Height;

    if arrMineInfo[X, Y].BMine then
      Brush.Color := clBlack
    else
      Brush.Color := clWhite;
  end;

  if arrMineInfo[X, Y].BMine then
  begin
    ShowMEssage('Game Over!');
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
    end
    else if X = High(arrMineInfo) then
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
    end
    else if Y = High(arrMineInfo[X]) then
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
        Inc(arrMineInfo[X, Y].iCnt);
    end;

    if arrMineInfo[X, Y].iCnt = 0 then
    begin

    end
    else
    begin

      with TLabel.Create(Self) do
      begin
        Parent := Panel_Map;
        Alignment := taCenter;
        Layout := tlCenter;
        AutoSize := False;

        Name := 'Label_' + IntToStr((X + 1) * 1000 + (Y + 1));
        Caption := IntToStr(arrMineInfo[X, Y].iCnt);
        Tag := i * 1000 + j;

        Top := iT;
        Left := iL;
        Width := iW;
        Height := iH;

        with font do
        begin
          Style := [fsBold];
        end;

      end;
    end;
  end;




  // Congratulations!

end;

end.
