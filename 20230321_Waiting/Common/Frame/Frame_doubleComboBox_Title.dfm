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
    Padding.Right = 5
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
    inline COMBO_1: TFrame_ENV_ComboBox
      AlignWithMargins = True
      Left = 170
      Top = 10
      Width = 298
      Height = 56
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 5
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
        Left = 246
        Height = 52
        ExplicitLeft = 257
        ExplicitHeight = 54
      end
    end
    inline COMBO_2: TFrame_ENV_ComboBox
      AlignWithMargins = True
      Left = 483
      Top = 10
      Width = 300
      Height = 56
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
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
        Width = 246
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
