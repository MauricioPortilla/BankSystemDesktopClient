object SignUpForm: TSignUpForm
  Left = 0
  Top = 0
  Caption = 'Registrar Cuenta'
  ClientHeight = 408
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object NombreLabel: TLabel
    Left = 32
    Top = 64
    Width = 46
    Height = 13
    Caption = 'Nombre *'
  end
  object ApellidoPaternoLabel: TLabel
    Left = 232
    Top = 64
    Width = 87
    Height = 13
    Caption = 'Apellido Paterno *'
  end
  object ApellidoMaternoLabel: TLabel
    Left = 432
    Top = 64
    Width = 89
    Height = 13
    Caption = 'Apellido Materno *'
  end
  object FechaNacimientoLabel: TLabel
    Left = 32
    Top = 144
    Width = 108
    Height = 13
    Caption = 'Fecha de Nacimiento *'
  end
  object TelefonoLabel: TLabel
    Left = 232
    Top = 144
    Width = 51
    Height = 13
    Caption = 'Tel'#233'fono *'
  end
  object CorreoLabel: TLabel
    Left = 432
    Top = 144
    Width = 42
    Height = 13
    Caption = 'Correo *'
  end
  object DireccionLabel: TLabel
    Left = 32
    Top = 216
    Width = 52
    Height = 13
    Caption = 'Direcci'#243'n *'
  end
  object CodigoPostalLabel: TLabel
    Left = 432
    Top = 216
    Width = 74
    Height = 13
    Caption = 'C'#243'digo Postal *'
  end
  object NombreUsuarioLabel: TLabel
    Left = 32
    Top = 288
    Width = 91
    Height = 13
    Caption = 'Nombre de Usuario'
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
    Width = 169
    Height = 21
    TabOrder = 1
  end
  object ApellidoPatertoTF: TEdit
    Left = 232
    Top = 87
    Width = 169
    Height = 21
    TabOrder = 2
  end
  object ApellidoMaternoTF: TEdit
    Left = 432
    Top = 87
    Width = 193
    Height = 21
    TabOrder = 3
  end
  object FechaNacimientoTF: TEdit
    Left = 32
    Top = 163
    Width = 169
    Height = 21
    TabOrder = 4
  end
  object TelefonoTF: TEdit
    Left = 232
    Top = 163
    Width = 169
    Height = 21
    TabOrder = 5
  end
  object CorreoTF: TEdit
    Left = 432
    Top = 163
    Width = 193
    Height = 21
    TabOrder = 6
  end
  object DireccionTF: TEdit
    Left = 32
    Top = 235
    Width = 369
    Height = 21
    TabOrder = 7
  end
  object CodigoPostalTF: TEdit
    Left = 432
    Top = 235
    Width = 193
    Height = 21
    TabOrder = 8
  end
  object NombreUsuarioTF: TEdit
    Left = 32
    Top = 307
    Width = 169
    Height = 21
    TabOrder = 9
  end
  object CrearCuentaBttn: TButton
    Left = 550
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Crear Cuenta'
    TabOrder = 10
  end
end
