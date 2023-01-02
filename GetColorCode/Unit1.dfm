object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Color'
  ClientHeight = 287
  ClientWidth = 360
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = 'Spoqa Han Sans Neo Bold'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 38
  object Panel_BGR: TPanel
    Left = 0
    Top = 198
    Width = 360
    Height = 89
    Align = alBottom
    ParentBackground = False
    ParentColor = True
    ShowCaption = False
    TabOrder = 0
    ExplicitTop = 189
    ExplicitWidth = 350
  end
  object Button1: TButton
    Left = 0
    Top = 142
    Width = 360
    Height = 56
    Align = alClient
    Caption = 'Get Color Code'
    TabOrder = 1
    OnClick = Button1Click
    ExplicitLeft = -2
    ExplicitTop = 148
  end
  object Edit1: TEdit
    Left = 0
    Top = 0
    Width = 360
    Height = 46
    Align = alTop
    TabOrder = 2
    Text = '$003232FF'
    TextHint = 'BGR CODE'
    OnChange = EditClick
    OnClick = EditClick
    ExplicitTop = 8
    ExplicitWidth = 350
  end
  object Edit2: TEdit
    Tag = 1
    Left = 0
    Top = 46
    Width = 360
    Height = 46
    Align = alTop
    TabOrder = 3
    TextHint = 'RGB CODE'
    OnChange = EditClick
    OnClick = EditClick
    ExplicitLeft = 1
    ExplicitTop = 40
    ExplicitWidth = 350
  end
  object Panel1: TPanel
    Left = 0
    Top = 92
    Width = 360
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    TabOrder = 4
    ExplicitTop = 98
    ExplicitWidth = 350
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 50
      Height = 46
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = 'R :'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Spoqa Han Sans Neo Bold'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 48
    end
    object Label2: TLabel
      Left = 121
      Top = 2
      Width = 50
      Height = 46
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = 'G :'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Spoqa Han Sans Neo Bold'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      ExplicitLeft = 147
      ExplicitTop = -4
      ExplicitHeight = 48
    end
    object Label3: TLabel
      Left = 240
      Top = 2
      Width = 50
      Height = 46
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = 'B :'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'Spoqa Han Sans Neo Bold'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      ExplicitLeft = 233
      ExplicitTop = 6
      ExplicitHeight = 48
    end
    object Edit3: TEdit
      Tag = 2
      Left = 52
      Top = 2
      Width = 69
      Height = 46
      Align = alLeft
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 0
      OnChange = EditClick
      OnClick = EditClick
      ExplicitLeft = 51
      ExplicitTop = 1
      ExplicitHeight = 48
    end
    object Edit4: TEdit
      Tag = 2
      Left = 171
      Top = 2
      Width = 69
      Height = 46
      Align = alLeft
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 1
      OnChange = EditClick
      OnClick = EditClick
      ExplicitLeft = 175
      ExplicitTop = -6
      ExplicitHeight = 50
    end
    object Edit5: TEdit
      Tag = 2
      Left = 290
      Top = 2
      Width = 69
      Height = 46
      Align = alLeft
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 2
      OnChange = EditClick
      OnClick = EditClick
      ExplicitLeft = 291
      ExplicitTop = 1
      ExplicitHeight = 48
    end
  end
  object ColorDialog1: TColorDialog
    Color = 8454143
    CustomColors.Strings = (
      'ColorA=FFFFFFFF'
      'ColorB=FFFFFFFF'
      'ColorC=FFFFFFFF'
      'ColorD=FFFFFFFF'
      'ColorE=FFFFFFFF'
      'ColorF=FFFFFFFF'
      'ColorG=FFFFFFFF'
      'ColorH=FFFFFFFF'
      'ColorI=FFFFFFFF'
      'ColorJ=FFFFFFFF'
      'ColorK=FFFFFFFF'
      'ColorL=FFFFFFFF'
      'ColorM=FFFFFFFF'
      'ColorN=FFFFFFFF'
      'ColorO=FFFFFFFF'
      'ColorP=FFFFFFFF')
    Left = 288
    Top = 32
  end
end
