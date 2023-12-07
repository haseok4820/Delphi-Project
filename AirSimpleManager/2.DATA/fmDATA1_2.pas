unit fmDATA1_2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, uDM, System.iniFiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.WinXCtrls, Frame_StockInfo;

type
  TForm_DATA1_2 = class(TForm)
    Label_Title: TLabel;
    Timer_Resize: TTimer;
    Panel_Body: TPanel;
    Label_SetMenuTitle: TLabel;
    ListView_List: TListView;
    ToggleSwitch_Update: TToggleSwitch;
    Panel_SetItemTool: TPanel;
    Button_Del: TButton;
    Button_Fix: TButton;
    Panel_Right: TPanel;
    Button_Add: TButton;
    Button_Search: TButton;
    Panel_Left: TPanel;
    Label_Category: TLabel;
    Button_CategoryAdd: TButton;
    Button_CategoryDel: TButton;
    ListView_Category: TListView;
    Panel_Page: TPanel;
    Label_Pageing: TLabel;
    Button_Next: TButton;
    Button_Prev: TButton;
    Panel_Stock: TPanel;
    Panel_Search: TPanel;
    Edit_Search: TEdit;
    ComboBox_Category: TComboBox;
    ScrollBox_ItemList: TScrollBox;
    Button_ViewCategory: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure Button_CategoryAddClick(Sender: TObject); // 그룹메뉴 구번명 처리
    procedure Button_CategoryDelClick(Sender: TObject); // 그룹메뉴 구번명 삭제
    procedure ListView_CategorySelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure ListView_ListSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);

    procedure Button_AddClick(Sender: TObject);
    procedure Button_FixClick(Sender: TObject);
    procedure Button_DelClick(Sender: TObject);
    procedure Timer_ResizeTimer(Sender: TObject);
    procedure Button_SearchClick(Sender: TObject);
    procedure Button_PageClick(Sender: TObject);
    procedure ToggleSwitch_UpdateClick(Sender: TObject);
    procedure Button_ViewCategoryClick(Sender: TObject);
    procedure Edit_SearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure SetSetMenus; // 세트그룹 저장하기
    procedure ShowCategory; // 세트그룹 표시하기

    // 세트그룹 메뉴리스트
    procedure ShowList(ViewSEQ: Integer); // 상품리스트
    procedure StockCategorySearch;
    procedure StockSearch;

    procedure StockFrameClick(Sender: TObject);
    procedure StockFrameEditChange(Sender: TObject);
  public
    { Public declarations }
  protected
    procedure FormResizeEND(var Message: TMessage); message WM_EXITSIZEMOVE;
  end;

const
  LISTVIEW_UNSELECT = -1;

var
  Form_DATA1_2: TForm_DATA1_2;
  IS_Search_Category: TResult_IS; // 세트구성 선택
  IS_Select_Item: TResult_IS; // 세트 구성상품 선택

  iPage, iPage_MAX, iPage_ROW: Integer;
  arrAddSetMenuSEQ: array of Integer;

  iChange_SetTurn: Integer;

implementation

{$R *.dfm}

uses Frame_ComboBox;

procedure TForm_DATA1_2.FormShow(Sender: TObject);
begin
  iPage := 0;
  if DM.GetSetMenus then
    ShowCategory
  else
    ShowMEssage('세트 정보를 불러오지 못했습니다.');
  StockCategorySearch;
  DM.GetStocks;

  Timer_Resize.Enabled := True;
end;

procedure TForm_DATA1_2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetSetMenus;
end;

procedure TForm_DATA1_2.FormResizeEND(var Message: TMessage);
begin
  Timer_Resize.Enabled := True;
end;

procedure TForm_DATA1_2.SetSetMenus;
var
  i, j, k, iCnt: Integer;
  SetMenuInfo: TStock_Info;
  sDateTime: String;

  ini: TMeminiFile;

  teststr: STring;
begin
  // 리스트 정보 가져오기
  if NOT DM.DBConnect then
    Exit
  else
  begin
    try
      DM.FDConn.Commit;
      try
        sDateTime := FormatDateTime('YYYYMMDDHHMMSS', NOW);
        DM.DBSQLClear;
        with DM.FDQ do
        begin
          SQL.Text := 'DELETE FROM HSETMENU';
          ExecSQL;

          DM.DBSQLClear;
          iCnt := 0;
          for i := Low(arrStockSetMenus) to High(arrStockSetMenus) do
            iCnt := iCnt + Length(arrStockSetMenus[i].sOption_CODE);

          if iCnt <> 0 then
          begin
            SQL.Text := 'INSERT INTO HSETMENU (ISEQ, SETCODE, MENUNAME, INPUTAMT, INPUTQTY, UPDT) ' +
              '         VALUES (:ISEQ, :ITEMCODE, :ITEMNAME, :ITEMAMT, :ITEMQTY, :ITEMDATETIME)';
            Params.ArraySize := iCnt;

            k := 0;
            for i := Low(arrStockSetMenus) to High(arrStockSetMenus) do
            begin
              with arrStockSetMenus[i] do
              begin
                if Length(arrStockSetMenus[i].sOption_CODE) <> 0 then
                begin
                  for j := Low(arrStockSetMenus[i].sOption_CODE) to High(arrStockSetMenus[i].sOption_CODE) do
                  begin
                    ParamByName('ISEQ').AsIntegers[k] := iSEQ;
                    ParamByName('ITEMCODE').AsStrings[k] := DM.AnsiFormat(sOption_CODE[j]);
                    ParamByName('ITEMNAME').AsStrings[k] := DM.AnsiFormat(sOption_Name[j]);
                    ParamByName('ITEMAMT').AsIntegers[k] := iOption_AMT[j];
                    ParamByName('ITEMQTY').AsIntegers[k] := j;
                    ParamByName('ITEMDATETIME').AsStrings[k] := DM.AnsiFormat(sOption_DateTime[j]);

                    inc(k);
                  end;
                end;
              end;
            end;
            Execute(iCnt, 0);
          end;

        end;
      except
        ON E: Exception do
        begin
          DM.GetPopup('DB 처리중 오류가 발생하여,||변경사항이 적용되지 않았습니다.||연결상태를 확인 후 다시 시도해주세요.||ERR : ' + E.Message);
          DM.FDConn.Rollback;
        end;
      end;

      ini := TMeminiFile.Create(ProgramPath + 'SETMENU_NAME.ini', TEncoding.UTF8);
      try
        with ini do
        begin
          for i := Low(arrStockSetMenus) to High(arrStockSetMenus) do
            WriteString('SET_ISEQ_' + IntToStr(i + 1), 'CATEGORY', arrStockSetMenus[i].sName);
          UpdateFile;
        end;
      finally
        ini.Free;
      end;
    finally
      DM.DBDisConnect;
    end;

  end;
end;

procedure TForm_DATA1_2.ShowCategory;
var
  DelCon: TControl;
  i: Word;

  listItem: TListItem;
begin
  // 그룹 리스트 표시
  IS_Search_Category.Result_int := 0;
  IS_Search_Category.Result_Str := '';
  ListView_Category.Clear;

  for i := Low(arrStockSetMenus) to High(arrStockSetMenus) do
  begin
    listItem := ListView_Category.Items.Add;
    with listItem, arrStockSetMenus[i] do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(sName);
    end;
  end;
end;

procedure TForm_DATA1_2.ListView_CategorySelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  iChange_SetTurn := LISTVIEW_UNSELECT;
  // 그룹 리스트 선택
  if Selected then
  begin
    IS_Search_Category.Result_int := ListView_Category.ItemIndex;
    IS_Search_Category.Result_Str := Item.SubItems[0];
  end
  else
  begin
    IS_Search_Category.Result_int := LISTVIEW_UNSELECT;
    IS_Search_Category.Result_Str := '';
  end;

  ShowList(IS_Search_Category.Result_int);
end;

procedure TForm_DATA1_2.Button_AddClick(Sender: TObject);
var
  i, j: Integer;
  ItemList_SetMenu: TListItem;
  SetInfo: TStock_SetMenus;

  bPrimary: Boolean;
  sNotice_AddFail, sDateTime: string;

begin
  // 세트 구성상품 추가
  sNotice_AddFail := '';
  for i := Low(arrAddSetMenuSEQ) to High(arrAddSetMenuSEQ) do
  begin
    with arrStockInfo[arrAddSetMenuSEQ[i]] do
    begin
      with arrStockSetMenus[IS_Search_Category.Result_int] do
      begin
        bPrimary := False;
        for j := Low(sOption_CODE) to High(sOption_CODE) do
        begin
          if sStockCode = sOption_CODE[j] then
          begin
            bPrimary := True;
            Break;
          end;
        end;

        bCHk := False;
        if NOT bPrimary then
        begin

          System.Insert(sStockCode, sOption_CODE, Length(sOption_CODE));
          System.Insert(sStockName, sOption_Name, Length(sOption_Name));
          System.Insert(iStockAMT, iOption_AMT, Length(iOption_AMT));
          System.Insert(Length(iOption_SEQ) + 1, iOption_SEQ, Length(iOption_SEQ));
          System.Insert(sDateTime, sOption_DateTime, Length(sOption_DateTime));

          ItemList_SetMenu := ListView_List.Items.Add;
          with ItemList_SetMenu do
          begin
            Caption := sStockCode;
            SubItems.Add(sStockName);
            SubItems.Add(IntToStr(iStockAMT));
          end;
        end
        else
          sNotice_AddFail := sNotice_AddFail + '|' + sStockName;
      end;

    end;
  end;

  DELETE(arrAddSetMenuSEQ, 0, Length(arrAddSetMenuSEQ));

  if sNotice_AddFail <> '' then
    DM.GetPopup('세트에는 동일한 메뉴를 여러번 추가할 수 없습니다.||[중복된 상품 목록]||' + sNotice_AddFail + '');
  StockSearch;
end;

procedure TForm_DATA1_2.Button_CategoryAddClick(Sender: TObject);
var
  sCaption: String;

  arrKey, arrValues: array of String;
begin
  // 카테고리 구분명 처리
  if IS_Search_Category.Result_int = LISTVIEW_UNSELECT then
    Exit;
  sCaption := IS_Search_Category.Result_Str;
  if InputQuery(' 세트그룹 : [ ' + IntToStr(IS_Search_Category.Result_int + 1) + ' ]', '세트그룹 구분명을 입력해주세요.(선택)', sCaption) then
  begin
    ListView_Category.Selected.SubItems[0] := sCaption;
    IS_Search_Category.Result_Str := sCaption;
    arrStockSetMenus[IS_Search_Category.Result_int].sName := sCaption;
  end;
end;

procedure TForm_DATA1_2.Button_CategoryDelClick(Sender: TObject);
begin
  // 카테고리 구분명 삭제
  if IS_Search_Category.Result_int = LISTVIEW_UNSELECT then
    Exit
  else
  begin
    arrStockSetMenus[IS_Search_Category.Result_int].sName := '';
    ShowCategory;
  end;
end;

procedure TForm_DATA1_2.ShowList(ViewSEQ: Integer);
var
  listItem: TListItem;
  i: Integer;
begin

  // 세트구성 리스트 표시
  ListView_List.Clear;
  if ViewSEQ = LISTVIEW_UNSELECT then
  begin
    Button_Add.Enabled := False;
    Label_SetMenuTitle.Caption := '연결그룹을 먼저 선택해주세요.';
    Exit;
  end
  else
  begin
    Button_Add.Enabled := True;
    Label_SetMenuTitle.Caption := '"[' + IntToStr(arrStockSetMenus[ViewSEQ].iSEQ) + ']' + arrStockSetMenus[ViewSEQ].sName + '" 구성 목록.';
    if Length(arrStockSetMenus[ViewSEQ].sOption_CODE) <> 0 then
    begin
      ToggleSwitch_Update.Visible := True;
      for i := Low(arrStockSetMenus[ViewSEQ].sOption_CODE) to High(arrStockSetMenus[ViewSEQ].sOption_CODE) do
      begin
        listItem := ListView_List.Items.Add;
        with listItem, arrStockSetMenus[ViewSEQ] do
        begin
          Caption := sOption_CODE[i];
          SubItems.Add(sOption_Name[i]);
          SubItems.Add(IntToStr(iOption_AMT[i]));
          SubItems.Add(IntToStr(iOption_SEQ[i]));
        end;
      end;
    end;

  end;
end;

procedure TForm_DATA1_2.ListView_ListSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  Change_SetMenuninfo: TStock_SetMenus;
begin
  // 세트 리스트 선택
  if Selected then
  begin
    IS_Select_Item.Result_int := IS_Search_Category.Result_int;
    IS_Select_Item.Result_Str := Item.Caption;

    if (ToggleSwitch_Update.State = tssOn) then
    begin
      if iChange_SetTurn = LISTVIEW_UNSELECT then
        iChange_SetTurn := ListView_List.ItemIndex
      else
      begin
        with arrStockSetMenus[IS_Search_Category.Result_int] do
        begin
          SetLength(Change_SetMenuninfo.sOption_CODE, 1);
          SetLength(Change_SetMenuninfo.sOption_Name, 1);
          SetLength(Change_SetMenuninfo.iOption_AMT, 1);

          Change_SetMenuninfo.sOption_CODE[0] := sOption_CODE[iChange_SetTurn];
          Change_SetMenuninfo.sOption_Name[0] := sOption_Name[iChange_SetTurn];
          Change_SetMenuninfo.iOption_AMT[0] := iOption_AMT[iChange_SetTurn];

          sOption_CODE[iChange_SetTurn] := sOption_CODE[ListView_List.ItemIndex];
          sOption_Name[iChange_SetTurn] := sOption_Name[ListView_List.ItemIndex];
          iOption_AMT[iChange_SetTurn] := iOption_AMT[ListView_List.ItemIndex];

          sOption_CODE[ListView_List.ItemIndex] := Change_SetMenuninfo.sOption_CODE[0];
          sOption_Name[ListView_List.ItemIndex] := Change_SetMenuninfo.sOption_Name[0];
          iOption_AMT[ListView_List.ItemIndex] := Change_SetMenuninfo.iOption_AMT[0];
        end;
        iChange_SetTurn := LISTVIEW_UNSELECT;
        ShowList(IS_Search_Category.Result_int);
      end;

    end;
  end
  else
  begin
    IS_Select_Item.Result_int := LISTVIEW_UNSELECT;
    IS_Select_Item.Result_Str := '';
  end;
  Button_Fix.Enabled := Selected;
  Button_Del.Enabled := Selected;

end;

procedure TForm_DATA1_2.Button_PageClick(Sender: TObject);
begin
  iPage := iPage + (Sender as TButton).Tag;

  if iPage_MAX <= iPage then
  begin
    iPage := iPage - 1;
    Exit;
  end
  else if iPage <= -1 then
  begin
    iPage := 0;
    Exit;
  end;

  Label_Pageing.Caption := IntToStr(iPage + 1);
  StockSearch;
end;

procedure TForm_DATA1_2.Button_SearchClick(Sender: TObject);
begin
  iPage := 0;
  Label_Pageing.Caption := IntToStr(iPage + 1);
  StockSearch;
end;

procedure TForm_DATA1_2.Button_ViewCategoryClick(Sender: TObject);
begin
  Panel_Right.Visible := NOT Panel_Right.Visible;
  Panel_Stock.Visible := NOT Panel_Stock.Visible;

  if Panel_Stock.Visible then
  begin
    ListView_List.Align := alTop;
    ListView_List.Height := 160;
    Panel_SetItemTool.Align := alTop;

  end
  else
  begin
    ListView_List.Align := alClient;
    Panel_SetItemTool.Align := alBottom;
  end;
end;

procedure TForm_DATA1_2.Edit_SearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Button_SearchClick(Button_Search);
end;

procedure TForm_DATA1_2.Button_FixClick(Sender: TObject);
var
  i: Integer;
  arrSeq: array of Integer;
  arrList: array of String;
  arrVal: array of String;
begin
  // 세트 구성 수정
  if IS_Select_Item.Result_int = LISTVIEW_UNSELECT then
    Exit
  else
  begin
    with arrStockSetMenus[IS_Select_Item.Result_int] do
    begin
      while (ListView_List.ItemIndex >= 0) do
      begin
        i := ListView_List.ItemIndex;
        System.Insert(i, arrSeq, Length(arrSeq));
        System.Insert(sOption_Name[i], arrList, Length(arrList));
        System.Insert(IntToStr(iOption_AMT[i]), arrVal, Length(arrVal));
        ListView_List.ItemIndex := -1;
      end;

      if Length(arrSeq) > 0 then
      begin
        if InputQuery(IntToStr(iSEQ) + '세트 구성금액 수정', arrList, arrVal) then
        begin
          for i := Low(arrSeq) to High(arrSeq) do
          begin
            iOption_AMT[arrSeq[i]] := StrToIntDef(arrVal[i], 0);
          end;
        end;
      end;
      Button_Fix.Enabled := False;
      Button_Del.Enabled := False;
      ShowList(IS_Search_Category.Result_int);
    end;
  end;
end;

procedure TForm_DATA1_2.Button_DelClick(Sender: TObject);
var
  i: Integer;
begin
  // 세트 구성 삭제
  if IS_Select_Item.Result_int = LISTVIEW_UNSELECT then
    Exit
  else
  begin
    with arrStockSetMenus[IS_Select_Item.Result_int] do
    begin
      while (ListView_List.ItemIndex >= 0) do
      begin
        i := ListView_List.ItemIndex;
        DELETE(sOption_CODE, i, 1);
        DELETE(sOption_Name, i, 1);
        DELETE(iOption_AMT, i, 1);
        DELETE(iOption_SEQ, i, 1);
        DELETE(sOption_DateTime, i, 1);

        ListView_List.Items.DELETE(i);
      end;

      Button_Fix.Enabled := False;
      Button_Del.Enabled := False;
      ShowList(IS_Search_Category.Result_int);
    end;
  end;
end;

procedure TForm_DATA1_2.StockCategorySearch;
var
  i: Word;
begin
  //
  ComboBox_Category.Items.Clear;
  for i := Low(arrStockCategoryInfo) to High(arrStockCategoryInfo) do
  begin
    ComboBox_Category.Items.Add(arrStockCategoryInfo[i].sName);
  end;
  ComboBox_Category.ItemIndex := 0;
end;

procedure TForm_DATA1_2.StockFrameClick(Sender: TObject);
var
  iTag: Integer;
  i: Integer;
begin
  iTag := (Sender as TFrameStockInfo).Tag;
  if arrStockInfo[iTag].bCHk then
    System.Insert(iTag, arrAddSetMenuSEQ, Length(arrAddSetMenuSEQ))
  else
  begin
    for i := Low(arrAddSetMenuSEQ) to High(arrAddSetMenuSEQ) do
    begin
      if arrAddSetMenuSEQ[i] = iTag then
        DELETE(arrAddSetMenuSEQ, i, 1);
    end;
  end;
end;

procedure TForm_DATA1_2.StockFrameEditChange(Sender: TObject);
var
  iTag: Integer;
begin
  iTag := (FindComponent((Sender as TEdit).Parent.Name) as TFrameStockInfo).Tag;
  arrStockInfo[iTag].iStockAMT := StrToIntDef((Sender as TEdit).Text, 0);
end;

procedure TForm_DATA1_2.StockSearch;
var
  FrameControl: TControl;
  i, iFrameSeq: Word;
  j, k: Integer;

  bEND: Boolean;
begin
  bSQLExecute := True;
  SendMEssage(ScrollBox_ItemList.Handle, WM_SETREDRAW, 0, 0);
  Application.ProcessMessages;
  if ScrollBox_ItemList.ControlCount <> 0 then
  begin
    for i := ScrollBox_ItemList.ControlCount - 1 Downto 0 do
      (ScrollBox_ItemList.Controls[i]).Visible := False;
  end;

  iPage_ROW := ScrollBox_ItemList.Height div 41;
  iPage_MAX := Length(arrStockInfo) div iPage_ROW;
  if Frac(Length(arrStockInfo) / iPage_ROW) <> 0 then
    inc(iPage_MAX);
  bEND := False;
  i := 0;
  k := 0;
  j := -1;

  repeat
    inc(j);
    iFrameSeq := (iPage * iPage_ROW) + j;
    if (i >= iPage_ROW) OR (iFrameSeq > High(arrStockInfo)) then
    begin
      bEND := True;
      Break;
    end;

    if (((ComboBox_Category.ItemIndex <> LISTVIEW_UNSELECT) AND (ComboBox_Category.ItemIndex <> 0)) or (Edit_Search.Text <> '')) then
    begin
      if ((ComboBox_Category.ItemIndex <> LISTVIEW_UNSELECT) AND (ComboBox_Category.ItemIndex <> 0)) AND
        (arrStockInfo[iFrameSeq].sGubunCode <> arrStockCategoryInfo[ComboBox_Category.ItemIndex].sCODE) then
        Continue;

      if (Edit_Search.Text <> '') AND (pos(Edit_Search.Text, arrStockInfo[iFrameSeq].sStockName) = 0) then
        Continue;

      if (iPage <> 0) AND (k < (iPage * iPage_ROW)) then
      begin
        inc(k);
        Continue;
      end;
    end;

    if FindComponent('StockInfo_' + IntToStr(i)) <> nil then
      FrameControl := (FindComponent('StockInfo_' + IntToStr(i)) as TFrameStockInfo)
    else
    begin
      FrameControl := TFrameStockInfo.Create(Self);
    end;

    with (FrameControl as TFrameStockInfo) do
    begin
      Parent := ScrollBox_ItemList;
      Name := 'StockInfo_' + IntToStr(i);
      Tag := iFrameSeq;
      Align := alBottom;

      with arrStockInfo[iFrameSeq] do
      begin
        // 선택유무
        if bCHk then
          Color := clSkyBlue
        else
          Color := clWhite;

        // 코드
        with Label_StockCode do
        begin
          Font.Size := 14;
          width := Round(ScrollBox_ItemList.width * 0.15);
          Caption := sStockCode;

          Constraints.MinWidth := 150;
          Align := alLeft;
        end;

        // 상품명
        with Edit_StockName do
        begin
          width := Round(ScrollBox_ItemList.width * 0.6);
          Text := sStockName;
          ReadOnly := True;
          Align := alClient;
        end;

        // 가격
        with Edit_Value do
        begin
          width := Round(ScrollBox_ItemList.width * 0.25);
          MaxLength := 8;
          Text := IntToStr(iStockAMT);
          Edit_Value.Alignment := taRightJustify;
          Align := alRight;

          OnChange := StockFrameEditChange;
        end;

        FrmCombo_Value.Visible := False;
      end;

      OnClick := StockFrameClick;
      Align := alTop;
      Visible := True;
    end;

    inc(i);
  until bEND;
  Application.ProcessMessages;
  SendMEssage(ScrollBox_ItemList.Handle, WM_SETREDRAW, 1, 0);
  RedrawWindow(ScrollBox_ItemList.Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_FRAME or RDW_ALLCHILDREN);

  if i = 0 then
    Button_PageClick(Button_Prev);
  bSQLExecute := False;
end;

procedure TForm_DATA1_2.Timer_ResizeTimer(Sender: TObject);
begin
  Timer_Resize.Enabled := False;
  Button_Del.width := Panel_SetItemTool.width div 2;
  Button_Fix.width := Button_Del.width;

  with ListView_List do
  begin
    Height := Round(Panel_Body.Height / 4);
    Columns[0].width := Round(width * 0.25);
    Columns[1].width := Round(width * 0.5);
    Columns[2].width := Round(width * 0.2);
    // Columns[3].width := Round(width * 0.15);
  end;
  StockSearch;
end;

procedure TForm_DATA1_2.ToggleSwitch_UpdateClick(Sender: TObject);
begin
  ListView_List.MultiSelect := ToggleSwitch_Update.State = tssOff;
  ListView_List.ItemIndex := -1;
  iChange_SetTurn := LISTVIEW_UNSELECT;
end;

end.
