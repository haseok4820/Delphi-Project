unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.JSON, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ImagingComponents, Vcl.ExtCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    ImageBG: TImage;
    Timer_Free: TTimer;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Shape1: TShape;
    Panel3: TPanel;
    Shape2: TShape;
    Panel4: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ComboBox1: TComboBox;
    ColorDialog1: TColorDialog;
    CheckBox5: TCheckBox;
    ButtonSave: TButton;
    ButtonClear: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    MENU1_1: TMenuItem;
    MENU1_2: TMenuItem;
    N2: TMenuItem;
    MENU2_1: TMenuItem;
    OpenDialog1: TOpenDialog;
    MENU1_3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure LabelClick(Sender: TObject);

    procedure EditSave;
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure EditWndProc(var Message: TMessage);

    procedure Timer_FreeTimer(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure MENU2_1Click(Sender: TObject);
    procedure MENU1_1Click(Sender: TObject);
    procedure MENU1_2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
    FOldWndProc: TWndMethod;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  arrVal: array [0 .. 8, 0 .. 8] of TLabel;
  EditVal: TMemo;

implementation

{$R *.dfm}

procedure TForm1.ButtonSaveClick(Sender: TObject);
var
  TP: TPoint;
  DC: HDC;
  TrasnBit: TBitmap;

begin
  if Assigned(EditVal) then
  begin
    EditSave;
    FreeAndNil(EditVal);
  end;
  //
  SaveDialog1.DefaultExt := '.jpeg';
  SaveDialog1.Filter := 'jpeg File|*.jpeg';
  if SaveDialog1.Execute then
  begin
    Application.ProcessMessages;
    Sleep(100);
    Application.ProcessMessages;

    TrasnBit := TBitmap.Create;
    try
      TP.X := ImageBG.Left;
      TP.Y := ImageBG.Top;

      TP := ClientToScreen(TP);
      TrasnBit.SetSize(ImageBG.Width, ImageBG.Height);
      DC := GetDC(0);
      BitBlt(TrasnBit.Canvas.Handle, 0, 0, TrasnBit.Width, TrasnBit.Height, DC, TP.X, TP.Y, SRCCOPY);
      ReleaseDC(0, DC);
    finally;
      TrasnBit.SaveToFile(SaveDialog1.FileName);
      TrasnBit.Free;
    end;
  end;

end;

procedure TForm1.ButtonClearClick(Sender: TObject);
var
  i: Integer;
  j: Integer;
begin
  if MessageBox(Self.Handle, '모두 지우시겠습니까?' + #13#10 + '삭제시 복구되지 않습니다.', '경고', MB_OKCANCEL) = mrOk then
  begin
    if Assigned(EditVal) then
    begin
      EditSave;
      FreeAndNil(EditVal);
    end;
    for i := 0 to 8 do
    begin
      for j := 0 to 8 do
      begin
        arrVal[i, j].Caption := '';
        arrVal[i, j].Font.Size := 16;
      end;
    end;
  end;

end;

procedure TForm1.EditWndProc(var Message: TMessage);
begin
  if Message.Msg = WM_GETDLGCODE then
    Message.Result := Message.Result or DLGC_WANTTAB
  else if Assigned(FOldWndProc) then
    FOldWndProc(Message);
end;

procedure TForm1.EditKeyPress(Sender: TObject; var Key: Char);
var
  i, j: Byte;
begin
  //
  if Assigned(EditVal) then
  begin
    if ((Key = #13) OR (Key = #27)) then
    begin
      EditSave;
      Timer_Free.Enabled := True;
    end
    else if Key = #9 then
    begin
      EditSave;
      Timer_Free.Enabled := True;

      Application.ProcessMessages;
      Sleep(10);

      i := EditVal.Tag div 10;
      j := EditVal.Tag mod 10;
      if j < 8 then
        inc(j)
      else if (j >= 8) AND (i < 8) then
      begin
        inc(i);
        j := 0
      end
      else if (i = 8) AND (j = 8) then
      begin
        i := 0;
        j := 0;
      end;

      LabelClick(arrVal[i, j]);
    end;

  end;

end;

procedure TForm1.EditSave;
var
  i, j, iSize: Byte;
  Rect_FontSize: TRect;
  bChk: Boolean;
  sVal: String;
begin
  //
  if Assigned(EditVal) then
  begin
    bChk := False;
    i := EditVal.Tag div 10;
    j := EditVal.Tag mod 10;

    sVal := StringReplace(EditVal.Text, '  ', #13#10, [rfReplaceAll]);
    Rect_FontSize := Default (TRect);
    with Rect_FontSize do
    begin
      Right := arrVal[i, j].Width;
      Bottom := arrVal[i, j].Height;

      if (i in [1, 4, 7]) AND (j in [1, 4, 7]) then
        iSize := 18
      else
        iSize := 13;
      repeat
        arrVal[i, j].Canvas.Font.Size := iSize;
        arrVal[i, j].Canvas.TextRect(Rect_FontSize, sVal, [tfCalcRect]);

        if ((Right - Left) < arrVal[i, j].Width) AND ((Bottom - Top) < arrVal[i, j].Height) then
          bChk := True
        else
          Dec(iSize);
      until bChk;
      arrVal[i, j].Caption := sVal;
      arrVal[i, j].Font.Size := iSize;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i, j: Byte;
  iL, iT, iW, iH: Integer;
begin
  iW := 67;
  iH := 62;

  for i := 0 to 8 do
  begin
    for j := 0 to 8 do
    begin
      arrVal[i, j] := TLabel.Create(Self);
      with arrVal[i, j] do
      begin
        Parent := Self;
        AutoSize := False;
        WordWrap := True;
        Layout := tlCenter;
        Alignment := taCenter;

        // Caption := IntTOSTr(i) + ' X ' + IntTOSTr(j);
        Tag := i * 10 + j;

        iL := 6 + (j mod 9) * (iW + 1);
        iT := 8 + (i mod 9) * iH;
        SetBounds(iL, iT, iW, iH);

        onClick := LabelClick;
      end;
    end;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin

end;

procedure TForm1.LabelClick(Sender: TObject);
var
  iTag: Byte;
begin
  //
  if Assigned(EditVal) then
  begin
    EditSave;
    FreeAndNil(EditVal);
  end;

  Application.ProcessMessages;
  Sleep(20);

  iTag := (Sender as TLabel).Tag;
  EditVal := TMemo.Create(Self);
  with EditVal do
  begin
    Parent := Self;
    Tag := iTag;

    Text := (Sender as TLabel).Caption;
    Font.Size := 12;
    SetBounds((Sender as TLabel).Left, (Sender as TLabel).Top, (Sender as TLabel).Width, (Sender as TLabel).Height);

    OnKeyPress := EditKeyPress;
  end;

  EditVal.SetFocus;
end;

procedure TForm1.MENU2_1Click(Sender: TObject);
begin
  ShowMEssage('copyrights 2023. miniuser all rights reserved.');
end;

procedure TForm1.MENU1_1Click(Sender: TObject);
var
  JSONVal: TJSONObject;
  JSONFile: TextFile;
  i, j, iSize: Byte;
begin
  // Saved.
  if Assigned(EditVal) then
  begin
    EditSave;
    FreeAndNil(EditVal);
  end;

  JSONVal := TJSONObject.Create;
  for i := Low(arrVal) to High(arrVal) do
  begin
    for j := Low(arrVal[i]) to High(arrVal[i]) do
    begin
      iSize := arrVal[i, j].Font.Size;
      JSONVal.AddPair('MAP_' + IntToStr(i * 10 + j), StringReplace(arrVal[i, j].Caption, #13#10, '  ', [rfReplaceAll]));
      JSONVal.AddPair('MAP_FS' + IntToStr(i * 10 + j), TJSONNumber.Create(iSize));
    end;
  end;

  SaveDialog1.DefaultExt := '.txt';
  SaveDialog1.Filter := 'text File|*.txt';
  if SaveDialog1.Execute then
  begin
    AssignFile(JSONFile, SaveDialog1.FileName);
    try
      ReWrite(JSONFile);
      Writeln(JSONFile, JSONVal.ToString);

    finally
      CloseFile(JSONFile);
      FreeAndNil(JSONVal);
    end;
  end;
end;

procedure TForm1.MENU1_2Click(Sender: TObject);
var
  JSONVal: TJSONObject;
  Stream_JsonFile: TStringList;
  i, j: Byte;

  errMsg: String;
begin
  // Load
  if Assigned(EditVal) then
  begin
    EditSave;
    FreeAndNil(EditVal);
  end;

  if OpenDialog1.Execute then
  begin
    Stream_JsonFile := TStringList.Create;
    Stream_JsonFile.LoadFromFile(OpenDialog1.FileName);

    JSONVal := TJSONObject.Create;
    try
      try
        JSONVal := TJSONObject.ParseJSONValue(Stream_JsonFile.Text) as TJSONObject;
        for i := Low(arrVal) to High(arrVal) do
        begin
          for j := Low(arrVal[i]) to High(arrVal[i]) do
          begin
            arrVal[i, j].Caption := StringReplace(JSONVal.GetValue<String>('MAP_' + IntToStr(i * 10 + j), arrVal[i, j].Caption), '  ',
              #13#10, [rfReplaceAll]);
            arrVal[i, j].Font.Size := JSONVal.GetValue<Integer>('MAP_FS' + IntToStr(i * 10 + j), arrVal[i, j].Font.Size);
          end;
        end;
      except
        On E: Exception do
        begin
          errMsg := E.Message;
          ShowMEssage('유효하지 않은 정보입니다.' + #13#10 + '파일을 확인해주세요.');
        end;
      end;
    finally
      Stream_JsonFile.Free;
      FreeAndNil(JSONVal);
    end;

  end;

end;

procedure TForm1.Timer_FreeTimer(Sender: TObject);
begin
  Timer_Free.Enabled := False;
  FreeAndNil(EditVal);
end;

end.
