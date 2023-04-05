unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Winapi.TlHelp32, Vcl.ComCtrls, Winapi.PsAPI;

type
  TForm5 = class(TForm)
    Button1: TButton;
    ListView1: TListView;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetProgress;

  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}
{ TForm5 }

procedure TForm5.Button1Click(Sender: TObject);
begin
  GetProgress;
end;

procedure TForm5.GetProgress;
var
  Process32: TProcessEntry32;
  HSnapshot, HProcHandle: THandle;
  pmcProceMemoryUsing: TProcessMemoryCounters;
  bNext: Boolean;

  cb: Integer;
  i: Word;

  szFileName: array [0 .. 255] of Char;

  sProc_ID, sProc_HeapID, sProc_ModuleID, sProc_Threads, sProc_ParentID, sProc_PricassBase, sProc_Flag, sProc_Exefile, sProc_useMemory,
    sProc_ExePath: String;
  // https://learn.microsoft.com/en-us/windows/win32/api/tlhelp32/ns-tlhelp32-processentry32

  ListCol: TListColumn;
  ListData: TListItem;
begin
  // Process32.szExeFile
  // ũ�� ����
  Process32.dwSize := SizeOf(TProcessEntry32); // �������� ������, Process32First ������
  HSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  {
    TH32CS_INHERIT     : ������ �ڵ��� ����� �� ����
    TH32CS_SNAPALL     : ��� ���μ���, �����带 ������
    TH32CS_SNAPHEAPLIST: �������� ���μ����� ��� ���� ����
    TH32CS_SNAPMODULE  : ������ ���μ����� ��� ����� ����
    TH32CS_SNAPPROCESS : ��� ���μ����� ������
    TH32CS_SNAPTHREAD  : ��� �����带 ����

    ���� ����Ʈ : https://learn.microsoft.com/ko-kr/windows/win32/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot
  }

  if Process32First(HSnapshot, Process32) then
  begin
    ListView1.Columns.Clear;
    ListView1.Clear;

    ListCol := ListView1.Columns.Add;
    ListCol.Caption := '���μ�����';
    ListCol.Width := 250;

    ListCol := ListView1.Columns.Add;
    ListCol.Caption := '���μ���ID';
    ListCol.Width := 100;

    ListCol := ListView1.Columns.Add;
    ListCol.Caption := 'Unused(DefaultHeapID)';
    ListCol.Width := 0;

    ListCol := ListView1.Columns.Add;
    ListCol.Caption := 'Unused(ModuleID)';
    ListCol.Width := 0;

    ListCol := ListView1.Columns.Add;
    ListCol.Caption := '������ ��';
    ListCol.Width := 100;

    ListCol := ListView1.Columns.Add;
    ListCol.Caption := '�θ� ���μ���ID';
    ListCol.Width := 150;

    ListCol := ListView1.Columns.Add;
    ListCol.Caption := '�켱 ����';
    ListCol.Width := 100;

    ListCol := ListView1.Columns.Add;
    ListCol.Caption := 'Unused(Flags)';
    ListCol.Width := 0;

    ListCol := ListView1.Columns.Add;
    ListCol.Caption := '�޸� ��뷮';
    ListCol.Width := 100;

    ListCol := ListView1.Columns.Add;
    ListCol.Caption := '���� ���';
    ListCol.Width := 500;

    i := 0;
    repeat
      sProc_Exefile := '';

      bNext := (Process32Next(HSnapshot, Process32));
      SetString(sProc_Exefile, PChar(@Process32.szExeFile[0]), Length(Process32.szExeFile));
      sProc_ID := IntToStr(Process32.th32ProcessID);
      sProc_HeapID := IntToStr(Process32.th32DefaultHeapID);
      sProc_ModuleID := IntToStr(Process32.th32ModuleID);
      sProc_Threads := IntToStr(Process32.cntThreads);
      sProc_ParentID := IntToStr(Process32.th32ParentProcessID);
      sProc_PricassBase := IntToStr(Process32.pcPriClassBase);
      sProc_Flag := IntToStr(Process32.dwFlags);

      // ��ü ������
      HProcHandle := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, Process32.th32ProcessID);
      try
        // ���� �����Ѵٸ�
        if HProcHandle <> 0 then
        begin
          // ���ϸ��� �ִٸ�
          if GetModuleFileNameEx(HProcHandle, 0, szFileName, 255) > 0 then
            sProc_ExePath := szFileName;

          // ���� ����Ʈ : https://hbesthee.tistory.com/82
        end;
      finally
        CloseHandle(HProcHandle);
      end;

      // �޸� ��뷮
      HProcHandle := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, Process32.th32ProcessID);
      cb := SizeOf(TProcessMemoryCounters);
      try
        Initialize(pmcProceMemoryUsing);
        pmcProceMemoryUsing.cb := cb;

        if GetProcessMemoryInfo(HProcHandle, @pmcProceMemoryUsing, cb) then
          sProc_useMemory := FormatFloat('##,###,##0', pmcProceMemoryUsing.WorkingSetSize div 1024) + 'KB'
        else
          sProc_useMemory := '';

      finally
        Finalize(pmcProceMemoryUsing);

      end;

      ListData := ListView1.Items.Add;
      with ListData do
      begin
        Caption := sProc_Exefile;
        SubItems.Add(sProc_ID);
        SubItems.Add(sProc_HeapID);
        SubItems.Add(sProc_ModuleID);
        SubItems.Add(sProc_Threads);
        SubItems.Add(sProc_ParentID);
        SubItems.Add(sProc_PricassBase);
        SubItems.Add(sProc_Flag);
        SubItems.Add(sProc_useMemory);
        SubItems.Add(sProc_ExePath);
      end;
    until NOT bNext;
  end;

end;

end.
