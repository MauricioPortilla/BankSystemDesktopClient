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
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object EmailLabel: TLabel
    Left = 208
    Top = 80
    Width = 88
    Height = 13
    Caption = 'Correo Electr'#243'nico'
  end
  object PasswordLabel: TLabel
    Left = 208
    Top = 152
    Width = 56
    Height = 13
    Caption = 'Contrase'#241'a'
  end
  object BankSystemPanel: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 49
    Align = alTop
    Color = 1974250
    ParentBackground = False
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 10
      Width = 124
      Height = 23
      Caption = 'Bank System'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
    end
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
  object EmailTF: TEdit
    Left = 208
    Top = 99
    Width = 217
    Height = 21
    TabOrder = 1
  end
  object PasswordTF: TEdit
    Left = 208
    Top = 171
    Width = 217
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
end
