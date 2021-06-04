object CreateTransactionSelectTypeForm: TCreateTransactionSelectTypeForm
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
  object CardNumberTitleLabel: TLabel
    Left = 8
    Top = 64
    Width = 95
    Height = 13
    Caption = 'N'#250'mero de cuenta: '
  end
  object CardNumberLabel: TLabel
    Left = 104
    Top = 64
    Width = 105
    Height = 13
    Caption = '0000 0000 0000 0000'
  end
  object DepositButton: TButton
    Left = 112
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Abonar dinero'
    TabOrder = 0
    OnClick = DepositButtonClick
  end
  object WithdrawButton: TButton
    Left = 248
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Retirar dinero'
    TabOrder = 1
    OnClick = WithdrawButtonClick
  end
  object MonthlyPaymentButton: TButton
    Left = 376
    Top = 104
    Width = 113
    Height = 25
    Caption = 'Pagar mensualidad'
    TabOrder = 2
    OnClick = MonthlyPaymentButtonClick
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
