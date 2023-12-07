object Form_DATA2_3: TForm_DATA2_3
  Left = 0
  Top = 0
  HelpType = htKeyword
  BorderStyle = bsNone
  Caption = 'Form_DATA2_3'
  ClientHeight = 550
  ClientWidth = 840
  Color = clWhite
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = #48729#44536#47112#52404
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  Padding.Bottom = 10
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    840
    550)
  PixelsPerInch = 96
  TextHeight = 25
  object Label_Title: TLabel
    Left = 5
    Top = 5
    Width = 830
    Height = 42
    Align = alTop
    AutoSize = False
    Caption = '2-3. '#49324#47932#54632'('#46973#52964') '#53468#44536#44288#47532
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 10770443
    Font.Height = -27
    Font.Name = #44256#46020' B'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    ExplicitLeft = -464
  end
  object CheckBox_AllCheck: TCheckBox
    Left = 730
    Top = 5
    Width = 100
    Height = 40
    Alignment = taLeftJustify
    Anchors = [akTop, akRight]
    Caption = #49692#48264' '#48320#44221
    Checked = True
    State = cbChecked
    TabOrder = 0
    Visible = False
  end
  object Panel_Footer: TPanel
    Left = 5
    Top = 440
    Width = 830
    Height = 100
    Align = alBottom
    BevelOuter = bvNone
    Padding.Top = 5
    ShowCaption = False
    TabOrder = 1
    object Label_Guide: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 380
      Height = 95
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alClient
      Caption = #51221#48372#47484' '#44032#51256#50724#44256' '#51080#49845#45768#45796'. '#51104#49884#47564' '#44592#45796#47140' '#51452#49464#50836'.'
      Layout = tlCenter
      WordWrap = True
      ExplicitWidth = 378
      ExplicitHeight = 50
    end
    object Button_DEL: TButton
      Left = 610
      Top = 5
      Width = 220
      Height = 95
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Caption = #49324#47932#54632' '#53468#44536' '#51221#48372#49325#51228
      TabOrder = 0
      OnClick = Button_DELClick
    end
    object Button_Execute: TButton
      Left = 390
      Top = 5
      Width = 220
      Height = 95
      Hint = #49324#47932#54632'('#46973#52964') '#49688#47049#48320#44221
      Margins.Left = 0
      Margins.Top = 45
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Caption = #49324#47932#54632'('#46973#52964') '#49688#47049#48320#44221
      TabOrder = 1
      OnClick = Button_ExecuteClick
    end
  end
  object ListView_Tag: TListView
    Left = 5
    Top = 47
    Width = 830
    Height = 393
    Align = alClient
    Columns = <
      item
        Caption = #49692#48264
        MinWidth = 55
        Width = 55
      end
      item
        Caption = #53468#44536#44050
        MinWidth = 400
        Width = 400
      end
      item
        Alignment = taCenter
        Caption = #49324#50857#50976#47924
        MinWidth = 90
        Width = 90
      end
      item
        Alignment = taCenter
        Caption = #53468#44536#50976#47924
        MinWidth = 90
        Width = 90
      end>
    Items.ItemData = {
      05440000000100000000000000FFFFFFFFFFFFFFFF04000000FFFFFFFF000000
      0003310032003300013100B045B33C013200D849B33C0133000039B33C013400
      084CB33CFFFFFFFFFFFFFFFF}
    MultiSelect = True
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
    OnKeyPress = FormKeyPress
  end
  object Timer_Refrush: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer_RefrushTimer
    Left = 768
    Top = 64
  end
end
