object CreateTransactionSetCardNumberForm: TCreateTransactionSetCardNumberForm
  Left = 0
  Top = 0
  Caption = 'Registrar transacci'#243'n'
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
  object CardNumberLabel: TLabel
    Left = 184
    Top = 101
    Width = 88
    Height = 13
    Caption = 'N'#250'mero de cuenta'
  end
  object CardNumberTF: TEdit
    Left = 184
    Top = 120
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object ContinueButton: TButton
    Left = 264
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Continuar'
    TabOrder = 1
    OnClick = ContinueButtonClick
  end
  object BackButton: TButton
    Left = 264
    Top = 178
    Width = 75
    Height = 25
    Caption = 'Volver'
    TabOrder = 2
  end
end
