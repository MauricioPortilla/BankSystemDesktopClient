object CreateTransactionMonthlyPaymentForm: TCreateTransactionMonthlyPaymentForm
  Left = 0
  Top = 0
  Caption = 'Registrar transacci'#243'n - Pagar mensualidad'
  ClientHeight = 365
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
  object CardNumberTitleLabel: TLabel
    Left = 8
    Top = 40
    Width = 95
    Height = 13
    Caption = 'N'#250'mero de cuenta: '
  end
  object CardNumberLabel: TLabel
    Left = 104
    Top = 40
    Width = 105
    Height = 13
    Caption = '0000 0000 0000 0000'
  end
  object Label1: TLabel
    Left = 8
    Top = 222
    Width = 44
    Height = 13
    Caption = 'Subtotal:'
  end
  object MinAmountLabel: TLabel
    Left = 159
    Top = 310
    Width = 28
    Height = 13
    Caption = '$0.00'
  end
  object Label2: TLabel
    Left = 8
    Top = 310
    Width = 152
    Height = 13
    Caption = 'Monto a pagar - monto m'#237'nimo: '
  end
  object Label3: TLabel
    Left = 8
    Top = 241
    Width = 137
    Height = 13
    Caption = 'Tasa de inter'#233's del subtotal:'
  end
  object Label4: TLabel
    Left = 8
    Top = 259
    Width = 141
    Height = 13
    Caption = 'Suma de las tasas de inter'#233's:'
  end
  object Label5: TLabel
    Left = 8
    Top = 278
    Width = 28
    Height = 13
    Caption = 'Total:'
  end
  object SubtotalLabel: TLabel
    Left = 58
    Top = 222
    Width = 28
    Height = 13
    Caption = '$0.00'
  end
  object SubtotalInterestRateLabel: TLabel
    Left = 151
    Top = 241
    Width = 30
    Height = 13
    Caption = '$0.00'
  end
  object InterestRatesSumLabel: TLabel
    Left = 151
    Top = 259
    Width = 28
    Height = 13
    Caption = '$0.00'
  end
  object TotalLabel: TLabel
    Left = 39
    Top = 278
    Width = 28
    Height = 13
    Caption = '$0.00'
  end
  object PayButton: TButton
    Left = 196
    Top = 327
    Width = 75
    Height = 25
    Caption = 'Pagar'
    TabOrder = 0
    OnClick = PayButtonClick
  end
  object BackButton: TButton
    Left = 277
    Top = 327
    Width = 75
    Height = 25
    Caption = 'Volver'
    TabOrder = 1
  end
  object AmountTF: TEdit
    Left = 8
    Top = 329
    Width = 182
    Height = 21
    TabOrder = 2
  end
  object TransactionsListView: TListView
    Left = 8
    Top = 59
    Width = 601
    Height = 150
    Columns = <
      item
        Caption = 'Mes'
      end
      item
        Caption = 'Monto adeudado'
      end
      item
        Caption = 'Sobrecargo'
      end
      item
        Caption = 'Tasa de inter'#233's'
      end>
    TabOrder = 3
    ViewStyle = vsReport
  end
end
