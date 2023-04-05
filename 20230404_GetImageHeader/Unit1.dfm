object Form5: TForm5
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Image Type'
  ClientHeight = 278
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = #46027#50880#52404
  Font.Style = [fsBold]
  OldCreateOrder = False
  DesignSize = (
    360
    278)
  PixelsPerInch = 96
  TextHeight = 21
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 360
    Height = 200
    Hint = #50668#44592#47484' '#53364#47533#54616#50668', '#51060#48120#51648#47484' '#48520#47084#50732' '#49688' '#51080#49845#45768#45796'.'
    Align = alTop
    Center = True
    ParentShowHint = False
    ShowHint = True
    OnClick = Image1Click
  end
  object Label1: TLabel
    Left = 0
    Top = 250
    Width = 144
    Height = 21
    Caption = 'Image Type :'
    Layout = tlCenter
  end
  object Button1: TButton
    Left = 0
    Top = 200
    Width = 360
    Height = 50
    Align = alTop
    Caption = 'Get Image Type'
    Enabled = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 150
    Top = 250
    Width = 210
    Height = 29
    Anchors = [akLeft, akRight, akBottom]
    ReadOnly = True
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Image|*.png;*.jpg;*.jpeg;*.gif;*.bmp'
    Left = 304
    Top = 56
  end
end
