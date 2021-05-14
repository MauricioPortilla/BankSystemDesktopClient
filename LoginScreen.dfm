object LoginForm: TLoginForm
  Left = 0
  Top = 0
  Caption = 'Iniciar sesi'#243'n'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object correoElectronicoLabel: TLabel
    Left = 208
    Top = 72
    Width = 88
    Height = 13
    Caption = 'Correo Electr'#243'nico'
  end
  object ContraseñaLabel: TLabel
    Left = 208
    Top = 144
    Width = 56
    Height = 13
    Caption = 'Contrase'#241'a'
  end
  object LoginButton: TButton
    Left = 288
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Iniciar sesi'#243'n'
    TabOrder = 0
    OnClick = LoginButtonClick
  end
  object CorreoTF: TEdit
    Left = 208
    Top = 99
    Width = 217
    Height = 21
    TabOrder = 1
  end
  object ContraseñaTF: TEdit
    Left = 208
    Top = 171
    Width = 217
    Height = 21
    TabOrder = 2
  end
  object BankSystemPanel: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    Color = 1974250
    ParentBackground = False
    TabOrder = 3
    ExplicitLeft = 104
    ExplicitTop = 250
  end
end
