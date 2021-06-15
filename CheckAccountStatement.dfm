object checkAccountStatementForm: TcheckAccountStatementForm
  Left = 0
  Top = 0
  Caption = 'Consultar estado de cuenta'
  ClientHeight = 490
  ClientWidth = 505
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
  object BankSystemLabel: TLabel
    Left = 8
    Top = 6
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
  object TLabel
    Left = 16
    Top = 135
    Width = 169
    Height = 13
    Caption = 'Seleccione el mes y escriba un a'#241'o:'
  end
  object bankSystemPanel: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 41
    Align = alTop
    Color = 253
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 6
    object Label1: TLabel
      Left = 8
      Top = 6
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
      Left = 390
      Top = 10
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
  object checkAccountStatementPanel: TPanel
    Left = 16
    Top = 50
    Width = 473
    Height = 23
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Caption = 'Cuenta'
    Color = 13750737
    ParentBackground = False
    TabOrder = 1
  end
  object AccountStatementPanel: TPanel
    Left = 16
    Top = 76
    Width = 472
    Height = 53
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object CardTypeLabel: TLabel
      Left = 8
      Top = 8
      Width = 43
      Height = 13
      Caption = 'cardtype'
    end
    object CardNumberLabel: TLabel
      Left = 8
      Top = 27
      Width = 90
      Height = 13
      Caption = '000000000000000'
    end
    object CardAmountLabel: TLabel
      Left = 374
      Top = 24
      Width = 90
      Height = 17
      Caption = '000000000000000'
    end
    object AmountTypeLabel: TLabel
      Left = 374
      Top = 5
      Width = 54
      Height = 13
      Caption = 'amountype'
    end
  end
  object monthComboBox: TComboBox
    AlignWithMargins = True
    Left = 16
    Top = 154
    Width = 145
    Height = 21
    TabOrder = 3
    Text = 'Selecciona un mes'
    Items.Strings = (
      'Enero'
      'Febrero'
      'Marzo'
      'Abril'
      'Mayo'
      'Junio'
      'Julio'
      'Agosto'
      'Septiembre'
      'Octubre'
      'Noviembre'
      'Diciembre')
  end
  object checkAccountStatementButton: TButton
    Left = 344
    Top = 154
    Width = 144
    Height = 21
    Caption = 'Consultar estado de cuenta'
    TabOrder = 4
    OnClick = checkAccountStatementButtonClick
  end
  object Panel2: TPanel
    Left = 16
    Top = 178
    Width = 472
    Height = 23
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Caption = 'Cuenta'
    Color = 13750737
    ParentBackground = False
    TabOrder = 5
  end
  object TransactionsListView: TListView
    Left = 16
    Top = 204
    Width = 472
    Height = 269
    Columns = <
      item
        Caption = 'Fecha'
        Width = 45
      end
      item
        Caption = 'Concepto'
        Width = 45
      end
      item
        Caption = 'Tipo'
        Width = 45
      end
      item
        Caption = 'Referencia'
      end
      item
        Caption = 'Monto'
      end>
    ColumnClick = False
    Ctl3D = False
    TabOrder = 6
    ViewStyle = vsReport
  end
  object YearTF: TEdit
    Left = 184
    Top = 154
    Width = 137
    Height = 21
    TabOrder = 7
  end
end
