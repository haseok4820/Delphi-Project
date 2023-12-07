object Frame_EventBox: TFrame_EventBox
  Left = 0
  Top = 0
  Width = 200
  Height = 40
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Progress: TShape
    Left = 0
    Top = 0
    Width = 200
    Height = 40
    Align = alClient
    Pen.Color = clWhite
    ExplicitLeft = 72
    ExplicitTop = -8
    ExplicitWidth = 65
    ExplicitHeight = 65
  end
  object EventName: TLabel
    AlignWithMargins = True
    Left = 5
    Top = 0
    Width = 190
    Height = 40
    Margins.Left = 5
    Margins.Top = 0
    Margins.Right = 5
    Margins.Bottom = 0
    Align = alClient
    Alignment = taCenter
    Caption = #51060#48292#53944#47749
    Layout = tlCenter
    ExplicitLeft = 0
    ExplicitWidth = 68
    ExplicitHeight = 23
  end
  object CoolDownTime: TTimer
    Left = 144
    Top = 8
  end
end
