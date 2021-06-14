object RegisterCardForm: TRegisterCardForm
  Left = 0
  Top = 0
  Caption = 'Registrar Tarjeta'
  ClientHeight = 289
  ClientWidth = 624
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
  object ChooseCardLabel: TLabel
    Left = 200
    Top = 72
    Width = 235
    Height = 13
    Caption = 'Selecciona el tipo de tarjeta que deseas registrar'
  end
  object TarjetaDebitoBttn: TButton
    Left = 56
    Top = 160
    Width = 193
    Height = 73
    Caption = 'D'#233'bito'
    TabOrder = 0
    OnClick = TarjetaDebitoBttnClick
  end
  object TarjetaCreditoBttn: TButton
    Left = 384
    Top = 160
    Width = 193
    Height = 73
    Caption = 'Cr'#233'dito'
    TabOrder = 1
    OnClick = TarjetaCreditoBttnClick
  end
  object BankSystemPanel: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 49
    Align = alTop
    Color = 1974250
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = -44
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
end
