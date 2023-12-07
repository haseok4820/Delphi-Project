program Project_TicketOption;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPreview in 'uPreview.pas' {FormMain},
  Frame_Ticket in 'Frame_Ticket.pas' {FrameTicketList: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
