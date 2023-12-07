object Frame_ENV_CheckBox_Prn: TFrame_ENV_CheckBox_Prn
  Left = 0
  Top = 0
  Width = 450
  Height = 60
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = #44256#46020' B'
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 2
  Padding.Bottom = 2
  ParentBackground = False
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object Label_MSG: TLabel
    AlignWithMargins = True
    Left = 58
    Top = 5
    Width = 229
    Height = 50
    Align = alClient
    Caption = #49444#51221#47749#51012' '#51077#47141#54644#51452#49464#50836'.'
    Layout = tlCenter
    ExplicitLeft = 59
    ExplicitWidth = 207
    ExplicitHeight = 24
  end
  object Label_Normal: TLabel
    Left = 290
    Top = 2
    Width = 80
    Height = 56
    Align = alRight
    Alignment = taCenter
    AutoSize = False
    Caption = #48372#53685
    Color = 10770443
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = #44256#46020' M'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    OnClick = Label_PrnClick
    ExplicitLeft = 187
    ExplicitTop = 34
    ExplicitHeight = 50
  end
  object Label_Expand: TLabel
    Left = 370
    Top = 2
    Width = 80
    Height = 56
    Align = alRight
    Alignment = taCenter
    AutoSize = False
    Caption = #53356#44172
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -24
    Font.Name = #44256#46020' B'
    Font.Style = []
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    OnClick = Label_PrnClick
    ExplicitLeft = 273
    ExplicitTop = 21
    ExplicitHeight = 50
  end
  object Label_Check: TLabel
    Left = 5
    Top = 2
    Width = 50
    Height = 56
    Align = alLeft
    Alignment = taCenter
    AutoSize = False
    Caption = #55357#56626
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = #44256#46020' B'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    ExplicitLeft = 10
    ExplicitTop = 5
    ExplicitHeight = 50
  end
end
