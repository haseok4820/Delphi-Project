object fmKeypad: TfmKeypad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'fmKeypad'
  ClientHeight = 550
  ClientWidth = 436
  Color = clSilver
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 20
  Padding.Top = 20
  Padding.Right = 20
  Padding.Bottom = 20
  OldCreateOrder = False
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Parent: TPanel
    Left = 20
    Top = 20
    Width = 396
    Height = 510
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Spoqa Han Sans Neo Bold'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    inline Frame_ENV_Edit1: TFrame_ENV_Edit
      Left = 0
      Top = 0
      Width = 396
      Height = 49
      Align = alTop
      DoubleBuffered = True
      Color = clSilver
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
      ExplicitWidth = 396
      inherited Label_Key: TLabel
        Caption = #44288#47532#51088' '#50516#54840
        ExplicitLeft = -5
        ExplicitHeight = 47
      end
      inherited Panel_Body: TPanel
        Width = 214
        ExplicitWidth = 214
        inherited Edit_Value: TEdit
          Width = 181
          PasswordChar = #9679
          TextHint = ''
          ExplicitWidth = 181
        end
      end
    end
  end
  object Timer_AllClear: TTimer
    Enabled = False
    OnTimer = Timer_AllClearTimer
    Left = 344
    Top = 304
  end
end
