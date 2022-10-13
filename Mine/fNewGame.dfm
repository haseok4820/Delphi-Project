object fmNew: TfmNew
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #49352#47196' '#47564#46308#44592
  ClientHeight = 185
  ClientWidth = 353
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  Padding.Left = 10
  Padding.Top = 10
  Padding.Right = 10
  Padding.Bottom = 10
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 21
  object Group2: TGroupBox
    Left = 10
    Top = 90
    Width = 333
    Height = 44
    Align = alClient
    Caption = #49324#50857#51088' '#51648#51221' '#49444#51221'(User Self Option)'
    Padding.Left = 10
    Padding.Top = 5
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 0
    Visible = False
    ExplicitHeight = 49
    object Panel1: TPanel
      Left = 136
      Top = 28
      Width = 185
      Height = 4
      Align = alRight
      BevelOuter = bvLowered
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 2
      ShowCaption = False
      TabOrder = 0
      ExplicitHeight = 9
      object Label_Hint: TLabel
        Left = 6
        Top = 6
        Width = 173
        Height = 21
        Align = alClient
        Caption = 'Easy                 Hard'
        Layout = tlBottom
        ExplicitWidth = 169
      end
      object TrackBar_: TTrackBar
        Left = 6
        Top = -44
        Width = 173
        Height = 45
        Align = alBottom
        BorderWidth = 2
        Max = 8
        PageSize = 1
        Position = 3
        TabOrder = 0
        ThumbLength = 25
        ExplicitTop = -39
      end
    end
    object Panel2: TPanel
      Left = 12
      Top = 28
      Width = 124
      Height = 4
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      Padding.Left = 5
      Padding.Top = 2
      Padding.Right = 5
      ParentFont = False
      TabOrder = 1
      ExplicitHeight = 9
      object Label1: TLabel
        Left = 5
        Top = 2
        Width = 114
        Height = 17
        Align = alTop
        Caption = #44032#47196'(Columns) :'
        Layout = tlBottom
        ExplicitWidth = 94
      end
      object Label2: TLabel
        Left = 5
        Top = 44
        Width = 114
        Height = 17
        Align = alTop
        Caption = #49464#47196'(Rows) :'
        Layout = tlBottom
        ExplicitWidth = 74
      end
      object Edit_Width: TEdit
        Left = 5
        Top = 19
        Width = 114
        Height = 25
        Align = alTop
        Alignment = taRightJustify
        MaxLength = 3
        NumbersOnly = True
        TabOrder = 0
        Text = '8'
        TextHint = '(1~255)'
      end
      object Edit_Height: TEdit
        Left = 5
        Top = 61
        Width = 114
        Height = 25
        Align = alTop
        Alignment = taRightJustify
        MaxLength = 3
        NumbersOnly = True
        TabOrder = 1
        Text = '8'
        TextHint = '(1~255)'
      end
    end
  end
  object Panel_Footer: TPanel
    Left = 10
    Top = 134
    Width = 333
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 139
    object Button_OK: TButton
      Left = 184
      Top = 5
      Width = 144
      Height = 31
      Align = alRight
      Caption = #47564#46308#44592'(OK)'
      TabOrder = 0
      OnClick = Button_OKClick
    end
    object CheckBox_Timer: TCheckBox
      Left = 5
      Top = 5
      Width = 156
      Height = 31
      Align = alLeft
      Caption = #44221#44284#49884#44036'(Timer)'
      TabOrder = 1
    end
  end
  object Group1: TRadioGroup
    Left = 10
    Top = 10
    Width = 333
    Height = 80
    Align = alTop
    Caption = #45212#51060#46020'(difficulty)'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      '(8X8)'
      '(16X16)'
      '(32X32)')
    TabOrder = 2
  end
  object CheckBox_Self: TCheckBox
    Left = 180
    Top = 13
    Width = 160
    Height = 17
    Alignment = taLeftJustify
    Caption = #49324#50857#51088' '#51648#51221'(Self Mode)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = CheckBox_SelfClick
  end
end
