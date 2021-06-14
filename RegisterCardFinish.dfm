object RegisterCardFinishForm: TRegisterCardFinishForm
  Left = 0
  Top = 0
  Caption = 'Registrar Tarjeta - Datos'
  ClientHeight = 289
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 80
    Width = 91
    Height = 13
    Caption = 'Fecha de creaci'#243'n:'
  end
  object Label2: TLabel
    Left = 16
    Top = 99
    Width = 125
    Height = 13
    Caption = 'Nuevo n'#250'mero de tarjeta:'
  end
  object Label3: TLabel
    Left = 16
    Top = 118
    Width = 23
    Height = 13
    Caption = 'CVV:'
  end
  object Label5: TLabel
    Left = 16
    Top = 137
    Width = 100
    Height = 13
    Caption = 'Fecha de expiraci'#243'n:'
  end
  object CreationDateLabel: TLabel
    Left = 113
    Top = 80
    Width = 26
    Height = 13
    Caption = 'DATE'
  end
  object CardNumberLabel: TLabel
    Left = 145
    Top = 99
    Width = 105
    Height = 13
    Caption = '0000 0000 0000 0000'
  end
  object CardCVVLabel: TLabel
    Left = 41
    Top = 118
    Width = 18
    Height = 13
    Caption = '000'
  end
  object ExpirationDateLabel: TLabel
    Left = 122
    Top = 137
    Width = 44
    Height = 13
    Caption = 'mm/aaaa'
  end
  object BankSystemPanel: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 49
    Align = alTop
    Color = 1974250
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 635
    object Label4: TLabel
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
    object AccountNameLabel: TLabel
      Left = 521
      Top = 14
      Width = 99
      Height = 18
      Alignment = taRightJustify
      Caption = 'Atendiendo: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
    end
  end
  object AcceptButton: TButton
    Left = 521
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 1
    OnClick = AcceptButtonClick
  end
end
