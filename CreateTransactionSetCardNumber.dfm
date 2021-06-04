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
  Position = poScreenCenter
  OnCreate = FormCreate
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
    MaxLength = 16
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
    OnClick = BackButtonClick
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
