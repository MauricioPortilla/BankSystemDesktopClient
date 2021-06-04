object SignUpForm: TSignUpForm
  Left = 0
  Top = 0
  Caption = 'Registrar Cuenta'
  ClientHeight = 409
  ClientWidth = 661
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
  object NombreLabel: TLabel
    Left = 32
    Top = 68
    Width = 46
    Height = 13
    Caption = 'Nombre *'
  end
  object ApellidoLabel: TLabel
    Left = 336
    Top = 68
    Width = 51
    Height = 13
    Caption = 'Apellidos *'
  end
  object FechaNacimientoLabel: TLabel
    Left = 232
    Top = 136
    Width = 108
    Height = 13
    Caption = 'Fecha de Nacimiento *'
  end
  object TelefonoCelularLabel: TLabel
    Left = 232
    Top = 261
    Width = 81
    Height = 13
    Caption = 'Tel'#233'fono Celular '
  end
  object CorreoLabel: TLabel
    Left = 432
    Top = 136
    Width = 42
    Height = 13
    Caption = 'Correo *'
  end
  object ColoniaLabel: TLabel
    Left = 32
    Top = 200
    Width = 44
    Height = 13
    Caption = 'Colonia *'
  end
  object CodigoPostalLabel: TLabel
    Left = 32
    Top = 261
    Width = 74
    Height = 13
    Caption = 'C'#243'digo Postal *'
  end
  object NombreUsuarioLabel: TLabel
    Left = 32
    Top = 136
    Width = 100
    Height = 13
    Caption = 'Nombre de Usuario *'
  end
  object ContraseñaLabel: TLabel
    Left = 32
    Top = 317
    Width = 65
    Height = 13
    Caption = 'Contrase'#241'a *'
  end
  object CalleLabel: TLabel
    Left = 232
    Top = 200
    Width = 32
    Height = 13
    Caption = 'Calle *'
  end
  object NumeroIntLabel: TLabel
    Left = 550
    Top = 200
    Width = 29
    Height = 13
    Caption = 'N'#176' Int'
  end
  object NumeroExtLabel: TLabel
    Left = 432
    Top = 200
    Width = 40
    Height = 13
    Caption = 'N'#176' Ext *'
  end
  object TelefonoCasaLabel: TLabel
    Left = 432
    Top = 261
    Width = 51
    Height = 13
    Caption = 'Tel'#233'fono *'
  end
  object BankSystemPanel: TPanel
    Left = 0
    Top = 0
    Width = 661
    Height = 41
    Align = alTop
    Color = 1842417
    ParentBackground = False
    TabOrder = 0
  end
  object NombreTF: TEdit
    Left = 32
    Top = 87
    Width = 273
    Height = 21
    TabOrder = 1
  end
  object ApellidoTF: TEdit
    Left = 336
    Top = 87
    Width = 289
    Height = 21
    TabOrder = 2
  end
  object FechaNacimientoTF: TEdit
    Left = 232
    Top = 155
    Width = 169
    Height = 21
    Hint = 'yyyy-mm-dd'
    TabOrder = 4
    TextHint = 'yyyy-mm-dd'
  end
  object TelefonoCelularTF: TEdit
    Left = 232
    Top = 280
    Width = 169
    Height = 21
    TabOrder = 11
  end
  object CorreoTF: TEdit
    Left = 432
    Top = 155
    Width = 193
    Height = 21
    TabOrder = 5
  end
  object ColoniaTF: TEdit
    Left = 32
    Top = 219
    Width = 169
    Height = 21
    TabOrder = 6
  end
  object CodigoPostalTF: TEdit
    Left = 32
    Top = 280
    Width = 169
    Height = 21
    TabOrder = 10
  end
  object NombreUsuarioTF: TEdit
    Left = 32
    Top = 155
    Width = 169
    Height = 21
    TabOrder = 3
  end
  object CrearCuentaBtn: TButton
    Left = 550
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Crear Cuenta'
    TabOrder = 14
    OnClick = CrearCuentaBtnClick
  end
  object ContraseñaTF: TEdit
    Left = 32
    Top = 336
    Width = 169
    Height = 21
    PasswordChar = '*'
    TabOrder = 13
  end
  object CalleTF: TEdit
    Left = 232
    Top = 219
    Width = 169
    Height = 21
    TabOrder = 7
  end
  object NumeroIntTF: TEdit
    Left = 550
    Top = 219
    Width = 75
    Height = 21
    TabOrder = 9
  end
  object NumeroExtTF: TEdit
    Left = 432
    Top = 219
    Width = 73
    Height = 21
    TabOrder = 8
  end
  object TelefonoCasaTF: TEdit
    Left = 432
    Top = 280
    Width = 193
    Height = 21
    TabOrder = 12
  end
end
