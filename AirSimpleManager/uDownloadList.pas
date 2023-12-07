unit uDownloadList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frame_Download, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    ScrollBox_List: TScrollBox;
    Panel_Footer: TPanel;
    Button1: TButton;
    Label_Msg: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ClearList;
    procedure ShowList();
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uDM;

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  {
    for I := Low to High do
    begin

    end;
  }
end;

procedure TForm1.ClearList;
var
  I: Integer;
begin
  //

  with ScrollBox_List do
  begin
    if ControlCount = 0 then
      Exit;

    for I := ControlCount - 1 Downto 0 do
    begin
      if Controls[I] is TFrameDownload then
      begin
        (Controls[I] as TFrameDownload).Free;
      end;
    end;
  end;
end;

procedure TForm1.ShowList;
var
  I: Integer;
begin
  //
  ClearList;
  for I := Low(arrDownloadURL) to High(arrDownloadURL) do
  begin

  end;
end;

end.
