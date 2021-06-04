object CreateTransactionDepositForm: TCreateTransactionDepositForm
  Left = 0
  Top = 0
  Caption = 'Registrar transacci'#243'n - Abonar dinero'
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
    Left = 109
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
    Width = 76
    Height = 13
    Caption = 'Monto a abonar'
  end
  object Label2: TLabel
    Left = 227
    Top = 120
    Width = 52
    Height = 13
    Caption = 'Referencia'
  end
  object Label3: TLabel
    Left = 227
    Top = 168
    Width = 46
    Height = 13
    Caption = 'Concepto'
  end
  object AmountTF: TEdit
    Left = 227
    Top = 91
    Width = 182
    Height = 21
    TabOrder = 0
  end
  object ReferenceTF: TEdit
    Left = 227
    Top = 139
    Width = 182
    Height = 21
    MaxLength = 6
    TabOrder = 1
  end
  object ConceptTF: TEdit
    Left = 227
    Top = 187
    Width = 182
    Height = 21
    MaxLength = 25
    TabOrder = 2
  end
  object DepositButton: TButton
    Left = 280
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Abonar'
    TabOrder = 3
    OnClick = DepositButtonClick
  end
  object BackButton: TButton
    Left = 280
    Top = 255
    Width = 75
    Height = 25
    Caption = 'Volver'
    TabOrder = 4
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
    TabOrder = 5
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
