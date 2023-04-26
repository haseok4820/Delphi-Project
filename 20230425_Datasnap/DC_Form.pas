unit DC_Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, IPpeerClient,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FireDAC.Phys.DSDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.DS, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.TDBXBase, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Memo, FireDAC.Comp.DataSet, FMX.StdCtrls, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.ListView, FMX.Grid.Style, Fmx.Bind.Grid,
  Data.Bind.Grid, FMX.Grid;

type
  TForm1 = class(TForm)
    FDPhysDSDriverLink1: TFDPhysDSDriverLink;
    FDConnection1: TFDConnection;
    FDStoredProc1: TFDStoredProc;
    Button1: TButton;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    StringGrid1: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if FDConnection1.Connected then
begin
    with FDStoredProc1 do
    begin
      Close;
      Unprepare;
      StoredProcName := 'TServerMethods1.TestData';
      Prepare;
      ParamByName('sqlstr').Value := 'SELECT * FROM HSTOCK';
      Open;
    end;

    with FDMemTable1 do
    begin
      Close;
      Data := FDStoredProc1.Data;
      FDStoredProc1.Close;
    end;
end;
end;

end.
