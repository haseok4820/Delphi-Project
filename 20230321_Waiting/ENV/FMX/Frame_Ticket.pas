unit Frame_Ticket;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation,
  FMX.EditBox, FMX.NumberBox;

type
  TFrameTicketList = class(TFrame)
    CheckBox_Used: TCheckBox;
    NumberBox_X: TNumberBox;
    NumberBox_Y: TNumberBox;
    procedure CheckBox_UsedChange(Sender: TObject);
    procedure NumberBox_Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses uPreview;

procedure TFrameTicketList.CheckBox_UsedChange(Sender: TObject);
begin
  arrTicketInfo[Tag].bUsed := CheckBox_Used.IsChecked;
  NumberBox_X.Enabled := CheckBox_Used.IsChecked;
  NumberBox_Y.Enabled := CheckBox_Used.IsChecked;

end;

procedure TFrameTicketList.NumberBox_Change(Sender: TObject);
begin
  if Self.Hint <> '' then
  begin
    arrTicketInfo[Tag].iExtend_X := Round(NumberBox_X.Value);
    arrTicketInfo[Tag].iExtend_Y := Round(NumberBox_Y.Value);
  end;

end;

end.
