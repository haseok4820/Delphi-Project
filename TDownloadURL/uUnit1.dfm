object Form5: TForm5
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'URLDonwloadToFile'
  ClientHeight = 324
  ClientWidth = 479
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  DesignSize = (
    479
    324)
  PixelsPerInch = 96
  TextHeight = 30
  object ProgressBar1: TProgressBar
    Left = 160
    Top = 0
    Width = 320
    Height = 47
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object Memo_Log: TMemo
    Left = 0
    Top = 53
    Width = 479
    Height = 221
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Button_ALLCancel: TButton
    Left = 0
    Top = 274
    Width = 479
    Height = 50
    Align = alBottom
    Caption = 'ALL Download Cancel'
    TabOrder = 3
    OnClick = Button_ALLCancelClick
    ExplicitLeft = 32
  end
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 160
    Height = 47
    Hint = 'MineSweeper.exe'
    Caption = 'File1 Download'
    TabOrder = 0
    OnClick = DownloadButtonClick
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 232
    Top = 168
  end
end
