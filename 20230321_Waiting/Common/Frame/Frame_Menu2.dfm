object FrameMenu2: TFrameMenu2
  Left = 0
  Top = 0
  Width = 400
  Height = 179
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = #48729#44536#47112#52404
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  Padding.Bottom = 5
  ParentBackground = False
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  DesignSize = (
    400
    179)
  object Label_Name: TLabel
    Left = 5
    Top = 5
    Width = 265
    Height = 40
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #49345#54408#47749#51012' '#51077#47141#54644#51452#49464#50836'.'
  end
  object Label_Amt: TLabel
    Left = 5
    Top = 119
    Width = 390
    Height = 55
    Align = alBottom
    Alignment = taRightJustify
    AutoSize = False
    Caption = '999,999 '#50896
    Layout = tlCenter
    Visible = False
    ExplicitTop = 139
    ExplicitWidth = 310
  end
  object Label3: TLabel
    Left = 5
    Top = 41
    Width = 265
    Height = 74
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = #49345#54408#49444#47749#51012' '#54364#49884#54624' '#49688'           '#51080#49845#45768#45796'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -19
    Font.Name = #48729#44536#47112#52404
    Font.Style = []
    ParentFont = False
    Visible = False
    WordWrap = True
    ExplicitHeight = 75
  end
  object Image1: TImage
    Left = 275
    Top = 5
    Width = 115
    Height = 105
    Anchors = [akLeft, akTop, akRight]
  end
  object PanelQty: TPanel
    Left = 5
    Top = 120
    Width = 160
    Height = 49
    Anchors = [akTop, akBottom]
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object Label_Qty: TLabel
      Left = 0
      Top = 0
      Width = 160
      Height = 49
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Layout = tlCenter
      ExplicitLeft = 56
      ExplicitWidth = 92
      ExplicitHeight = 55
    end
    inline Frame_ENV_ComboBox1: TFrame_ENV_ComboBox
      AlignWithMargins = True
      Left = 10
      Top = 0
      Width = 140
      Height = 49
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alClient
      DoubleBuffered = True
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #44256#46020' B'
      Font.Style = []
      Padding.Left = 2
      Padding.Top = 2
      Padding.Right = 2
      Padding.Bottom = 2
      ParentBackground = False
      ParentColor = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 10
      ExplicitWidth = 140
      ExplicitHeight = 49
      inherited Label_Key: TLabel
        Width = 86
        Height = 45
        Caption = '6'#47749
        ExplicitWidth = 164
        ExplicitHeight = 45
      end
      inherited Label1: TLabel
        Left = 88
        Height = 45
        ExplicitLeft = 178
        ExplicitHeight = 45
      end
    end
  end
end
