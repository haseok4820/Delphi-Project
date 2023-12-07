object Frame_ENV_DoubleComboBox_Title: TFrame_ENV_DoubleComboBox_Title
  Left = 0
  Top = 0
  Width = 800
  Height = 78
  DoubleBuffered = True
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = #44256#46020' B'
  Font.Style = []
  Padding.Left = 1
  Padding.Top = 1
  Padding.Right = 1
  Padding.Bottom = 1
  ParentBackground = False
  ParentColor = False
  ParentDoubleBuffered = False
  ParentFont = False
  TabOrder = 0
  object Panel_Parent: TPanel
    Left = 1
    Top = 1
    Width = 798
    Height = 76
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object Label_Title: TLabel
      Left = 10
      Top = 10
      Width = 150
      Height = 56
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = #53440#51060#53952
      Color = 15592941
      ParentColor = False
      Transparent = False
      Layout = tlCenter
    end
    object Label_hide: TLabel
      Left = 160
      Top = 10
      Width = 6
      Height = 24
      Align = alLeft
    end
    object Label1: TLabel
      Left = 482
      Top = 10
      Width = 6
      Height = 24
      Align = alRight
    end
    object Label2: TLabel
      Left = 476
      Top = 10
      Width = 6
      Height = 24
      Align = alRight
    end
    inline COMBO_1: TFrame_ENV_ComboBox
      Left = 166
      Top = 10
      Width = 310
      Height = 56
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
      ExplicitLeft = 166
      ExplicitTop = 10
      ExplicitWidth = 310
      ExplicitHeight = 56
      inherited Label_Key: TLabel
        Width = 244
        Height = 52
        Caption = #51109#52824#50976#54805#51012' '#49440#53469#54644#51452#49464#50836'.'
        ExplicitWidth = 243
        ExplicitHeight = 54
      end
      inherited Label1: TLabel
        Left = 258
        Height = 52
        ExplicitLeft = 257
        ExplicitHeight = 54
      end
    end
    inline COMBO_2: TFrame_ENV_ComboBox
      Left = 488
      Top = 10
      Width = 300
      Height = 56
      Align = alRight
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
      TabOrder = 1
      ExplicitLeft = 488
      ExplicitTop = 10
      ExplicitWidth = 300
      ExplicitHeight = 56
      inherited Label_Key: TLabel
        Width = 234
        Height = 52
        Caption = #51109#52824#50976#54805#51012' '#49440#53469#54644#51452#49464#50836'.'
        ExplicitWidth = 243
        ExplicitHeight = 54
      end
      inherited Label1: TLabel
        Left = 248
        Height = 52
        ExplicitLeft = 257
        ExplicitHeight = 54
      end
    end
  end
end
