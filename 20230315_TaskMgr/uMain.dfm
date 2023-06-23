object Form5: TForm5
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Form_Process Infomation'
  ClientHeight = 561
  ClientWidth = 792
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #46027#50880#52404
  Font.Style = [fsBold]
  OldCreateOrder = False
  DesignSize = (
    792
    561)
  PixelsPerInch = 96
  TextHeight = 16
  object Button1: TButton
    Left = 680
    Top = 8
    Width = 104
    Height = 41
    Anchors = [akTop, akRight]
    Caption = #49352#47196#44256#52840
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListView1: TListView
    Left = 8
    Top = 55
    Width = 776
    Height = 498
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <>
    RowSelect = True
    SortType = stText
    TabOrder = 1
    ViewStyle = vsReport
  end
end
