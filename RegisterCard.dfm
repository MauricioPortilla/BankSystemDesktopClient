object RegisterCardForm: TRegisterCardForm
  Left = 0
  Top = 0
  Caption = 'Registrar Tarjeta'
  ClientHeight = 358
  ClientWidth = 591
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
    Left = 168
    Top = 72
    Width = 235
    Height = 13
    Caption = 'Selecciona el tipo de tarjeta que deseas registrar'
  end
  object SystemBankPanel: TPanel
    Left = 0
    Top = 0
    Width = 591
    Height = 41
    Align = alTop
    Color = 3158260
    ParentBackground = False
    TabOrder = 0
  end
  object TarjetaDebitoBttn: TButton
    Left = 56
    Top = 160
    Width = 193
    Height = 73
    Caption = 'D'#233'bito'
    TabOrder = 1
    OnClick = TarjetaDebitoBttnClick
  end
  object TarjetaCreditoBttn: TButton
    Left = 344
    Top = 160
    Width = 193
    Height = 73
    Caption = 'Cr'#233'dito'
    TabOrder = 2
    OnClick = TarjetaCreditoBttnClick
  end
end
