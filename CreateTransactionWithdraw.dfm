object CreateTransactionWithdrawForm: TCreateTransactionWithdrawForm
  Left = 0
  Top = 0
  Caption = 'Registrar transacci'#243'n - Retirar dinero'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CardNumberLabel: TLabel
    Left = 104
    Top = 55
    Width = 105
    Height = 13
    Caption = '0000 0000 0000 0000'
  end
  object CardNumberTitleLabel: TLabel
    Left = 8
    Top = 55
    Width = 95
    Height = 13
    Caption = 'N'#250'mero de cuenta: '
  end
  object Label1: TLabel
    Left = 227
    Top = 72
    Width = 72
    Height = 13
    Caption = 'Monto a retirar'
  end
  object AmountTF: TEdit
    Left = 227
    Top = 91
    Width = 182
    Height = 21
    TabOrder = 0
  end
  object WithdrawButton: TButton
    Left = 280
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Retirar'
    TabOrder = 1
    OnClick = WithdrawButtonClick
  end
  object BackButton: TButton
    Left = 280
    Top = 159
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
    object Label6: TLabel
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
