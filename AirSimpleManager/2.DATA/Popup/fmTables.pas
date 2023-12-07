unit fmTables;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Types, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, dxGDIPlusClasses, Vcl.Menus;

type
  TForm_Table = class(TForm)
    Panel_Header: TPanel;
    Image_Cancel: TImage;
    Label_title: TLabel;
    Button_Tool: TButton;
    ComboBox_Floor: TComboBox;
    Button_Reset: TButton;
    ScrollBox1: TScrollBox;
    Panel_Table: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Label_titleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Image_CancelClick(Sender: TObject);
    procedure ComboBox_FloorChange(Sender: TObject);
    procedure Button_ToolClick(Sender: TObject);
    procedure Button_ResetClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    procedure TableMDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TableMMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TableMUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TableKey(Sender: TObject; var Key: Char);
  public
    { Public declarations }
    procedure TableClick(Sender: TObject);
    procedure ShowTable(iFloor: SmallInt);
  protected
  end;

var
  Form_Table: TForm_Table;
  bMMove: Boolean = False;
  iMPoint, iRealPoint: TPoint;
  arrTableReset: array [0 .. 2] of String = (
    '크게 (6X6)',
    '보통 (7X8)',
    '작게 (9X12)'
    // '사용자 지정'
  );

implementation

{$R *.dfm}

uses fmTables_Tool, uDM, fmDATA2_2;

procedure TForm_Table.FormShow(Sender: TObject);
var
  i: Byte;
begin
  ComboBox_Floor.Items.Clear;
  for i := Low(arrFloor) to High(arrFloor) do
  begin
    ComboBox_Floor.Items.Add(IntToStr(i + 1) + ' : ' + arrFloor[i].sFloorName);
  end;

  ComboBox_Floor.ItemIndex := 0;
  iSelFloor := ComboBox_Floor.ItemIndex;

  // 좌석
  if iSelFloor <> -1 then
    ShowTable(iSelFloor);

  if Form_TableTool <> nil then
    FreeAndNil(Form_TableTool);

  Form_TableTool := TForm_TableTool.Create(Self);
  Form_TableTool.Top := Height + Top - Form_TableTool.Height;
  Form_TableTool.Left := Width + Left;
  Form_TableTool.Show;

end;

procedure TForm_Table.Button_ToolClick(Sender: TObject);
begin
  ShowTable(iSelFloor);
end;

procedure TForm_Table.Button_ResetClick(Sender: TObject);
var
  Res: TResult_IS;
  i: Integer;
begin
  Res := DM.GetList('배치유형을 선택해주세요.', arrTableReset);
  if Res.Result_int <> -99 then
  begin
    TableSizeGB := Res.Result_int + 1;
    for i := Low(arrTable[iSelFloor]) to High(arrTable[iSelFloor]) do
    begin
      with arrTable[iSelFloor, i] do
      begin
        iTable_X := 0;
        iTable_Y := 0;
        iTable_W := 0;
        iTable_H := 0;
      end;
    end;

    Form_DATA2_2.SaveTable;
    DM.GetTable;
    ShowTable(iSelFloor);
  end;
end;

procedure TForm_Table.ComboBox_FloorChange(Sender: TObject);
var
  i: Byte;
begin
  iSelFloor := ComboBox_Floor.ItemIndex;
  if iSelFloor <> -1 then
    ShowTable(iSelFloor);

end;

procedure TForm_Table.Image_CancelClick(Sender: TObject);
begin
  if Form_TableTool <> nil then
    FreeAndNil(Form_TableTool);
  ModalResult := mrOK;
end;

procedure TForm_Table.Label_titleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_NCLBUTTONDOWN, HTCAPTION, 0);
end;

procedure TForm_Table.ShowTable(iFloor: SmallInt);
var
  i: Integer;
  TableControl: TControl;
begin
  //
  iSelTable := -1;
  for i := Panel_Table.ControlCount - 1 Downto 0 do
  begin
    TableControl := Panel_Table.Controls[i];
    TableControl.Visible := False;
  end;

  for i := Low(arrTable[iFloor]) to High(arrTable[iFloor]) do
  begin
    TableControl := (FindComponent('Table_' + IntToStr(i)) as TPanel);
    if TableControl = nil then
    begin
      TableControl := TPanel.Create(Self);
      with (TableControl as TPanel) do
      begin
        Parent := Panel_Table;
        Name := 'Table_' + IntToStr(i);
        BorderStyle := bsSingle;
        ParentColor := False;
        ParentBackground := False;

        OnClick := TableClick;
        OnMouseDown := TableMDown;
        OnMouseMove := TableMMove;
        OnMouseUp := TableMUp;
      end;
    end;

    with (TableControl as TPanel) do
    begin
      with arrTable[iFloor, i] do
      begin
        Visible := bUsed;
        Caption := '[' + Format('%.3d', [i + 1]) + ']' + sTableName;
        Tag := i;
        SetBounds(iTable_X, iTable_Y, iTable_W, iTable_H);

        Color := clWhite;
        Font.Color := clBlack;
      end;

      case TableSizeGB of
        3:
          Font.Size := 13;
      else
        Font.Size := 16;
      end;
    end;
  end;

  if Form_TableTool <> nil then
    Form_TableTool.Timer_Refrush.Enabled := True;
end;

procedure TForm_Table.TableClick(Sender: TObject);
var
  i: Integer;
begin
  for i := Panel_Table.ControlCount - 1 Downto 0 do
  begin
    if Panel_Table.Controls[i] is TPanel then
    begin
      with (Panel_Table.Controls[i] as TPanel) do
      begin
        Color := clWhite;
        Font.Color := clBlack;
      end;
    end;
  end;

  if NOT(Sender = Nil) then
  begin
    with (Sender as TPanel) do
    begin
      Color := clLime;
      Font.Color := clPurple;

      iSelTable := Tag;
    end;

    Form_TableTool.Timer_Refrush.Enabled := True;
  end;
end;

procedure TForm_Table.TableKey(Sender: TObject; var Key: Char);
begin

end;

procedure TForm_Table.TableMDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TableClick(Sender);
  bMMove := True;

  GetCursorPos(iMPoint);
  iMPoint.X := iMPoint.X - Left;
  iMPoint.Y := iMPoint.Y - Top;
end;

procedure TForm_Table.TableMMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  iX, iY: SmallInt;
begin
  if bMMove then
  begin
    GetCursorPos(iRealPoint);
    iRealPoint.X := iRealPoint.X - Left;
    iRealPoint.Y := iRealPoint.Y - Top;

    with (Sender as TPanel), arrTable[iSelFloor, iSelTable] do
    begin
      iX := Left + (iRealPoint.X - iMPoint.X);
      iY := Top + (iRealPoint.Y - iMPoint.Y);

      SetBounds(iX, iY, Width, Height);
      iTable_X := Left;
      iTable_Y := Top;

      BringToFront;
    end;
    iMPoint := iRealPoint;
  end;
end;

procedure TForm_Table.TableMUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  bMMove := False;
  with (Sender as TPanel) do
  begin

    if Left < 0 then
      Left := 0;

    if Top < 0 then
      Top := 0;

    if Left + Width > Panel_Table.Width then
      Left := Panel_Table.Width - Width;

    if Top + Height > Panel_Table.Height then
      Top := Panel_Table.Height - Height;

    with arrTable[iSelFloor, iSelTable] do
    begin
      iTable_X := Left;
      iTable_Y := Top;
      iTable_W := Width;
      iTable_H := Height;
    end;

  end;
end;

procedure TForm_Table.FormKeyPress(Sender: TObject; var Key: Char);
const
  cLEFT = 37;
  cTOP = 38;
  cRight = 39;
  cBottom = 40;
begin
  //
  if iSelTable >= 0 then
  begin
    with (FindComponent('Table_' + IntToStr(iSelTable)) as TPanel) do
    begin
      case StrToIntDef(Key, 0) of
        cLEFT:
          Left := Left - 1;
        cTOP:
          Top := Top - 1;
        cRight:
          Left := Left + 1;
        cBottom:
          Top := Top + 1;
      end;
    end;
  end;
end;

end.
