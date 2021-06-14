object CheckAccountForm: TCheckAccountForm
  Left = 0
  Top = 0
  Caption = 'Consultar Cuenta'
  ClientHeight = 256
  ClientWidth = 505
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
  object IdAccountLabel: TLabel
    Left = 16
    Top = 63
    Width = 199
    Height = 13
    Caption = 'Introduzca el ID de la cuenta a consultar:'
  end
  object bankSystemPanel: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 41
    Align = alTop
    Color = 921596
    ParentBackground = False
    TabOrder = 0
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
  end
  object accountsPanel: TPanel
    Left = 16
    Top = 90
    Width = 473
    Height = 23
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Caption = 'Accounts'
    Color = 13750737
    ParentBackground = False
    TabOrder = 1
  end
  object checkAccountStatementButton: TButton
    Left = 344
    Top = 216
    Width = 153
    Height = 25
    Caption = 'Check account statement'
    TabOrder = 2
    OnClick = checkAccountStatementButtonClick
  end
  object AccountsListView: TListView
    Left = 16
    Top = 112
    Width = 473
    Height = 98
    Columns = <
      item
        Caption = 'Tipo'
        Width = 45
      end
      item
        Caption = 'N'#250'mero de tarjeta'
        Width = 350
      end
      item
        Caption = 'Saldo'
        Width = 75
      end>
    ColumnClick = False
    Ctl3D = False
    TabOrder = 3
    ViewStyle = vsReport
  end
  object AccountIdTF: TEdit
    Left = 221
    Top = 60
    Width = 60
    Height = 21
    TabOrder = 4
  end
  object GetCardsButton: TButton
    Left = 376
    Top = 60
    Width = 113
    Height = 27
    Caption = 'Consultar cuenta'
    TabOrder = 5
    OnClick = GetCardsButtonClick
  end
end
