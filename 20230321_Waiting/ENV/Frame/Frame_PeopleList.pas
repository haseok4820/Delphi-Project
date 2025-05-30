unit Frame_PeopleList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ImagingComponents;

type
  TFrame_People = class(TFrame)
    Label_Seq: TLabel;
    Edit_Name: TEdit;
    Memo_Notice: TMemo;
    Edit_Max: TEdit;
    Label_Check: TLabel;
    procedure Label_CheckClick(Sender: TObject);
    procedure Label_SeqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM;

procedure TFrame_People.Label_CheckClick(Sender: TObject);
var
  iTag: Integer;
begin
  if Sender <> Nil then
  begin
    iTag := (Sender as TLabel).Tag;
    if iTag = Low(arrYN) then
      iTag := High(arrYN)
    else
      iTag := Low(arrYN);
  end
  else
    iTag := Low(arrYN);
  Label_Check.Caption := arrYN[iTag];
  Label_Check.Tag := iTag;

  Edit_Name.Enabled := iTag = High(arrYN);
  Memo_Notice.Enabled := iTag = High(arrYN);
  Edit_Max.Enabled := iTag = High(arrYN);
end;

procedure TFrame_People.Label_SeqClick(Sender: TObject);
begin
  if Assigned(Self.OnClick) then
  begin
    Self.OnClick(Self);
  end;
end;

end.
