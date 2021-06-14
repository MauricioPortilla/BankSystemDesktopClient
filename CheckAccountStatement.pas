unit CheckAccountStatement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Cards, Account;

type
  TCheckAccountStatementForm = class(TForm)
    bankSystemPanel: TPanel;
    BankSystemLabel: TLabel;
    AccountNameLabel: TLabel;
    monthComboBox: TComboBox;
    yearComboBox: TComboBox;
    AccountStatementPanel: TPanel;
    checkAccountStatementButton: TButton;
    Panel2: TPanel;
    CardTypeLabel: TLabel;
    CardNumberLabel: TLabel;
    CardAmountLabel: TLabel;
    AmountTypeLabel: TLabel;
    AccountsListView: TListView;
    procedure FormCreate(Sender: TObject);
  private
    _card: TCard;
    creditCard : TCreditCard;
    debitCard : TDebitCard;
  public
    constructor Create(AOwner: TComponent; const card: TCard); reintroduce; overload;
  end;

var
  CheckAccountStatementForm: TCheckAccountStatementForm;

implementation

{$R *.dfm}

constructor TCheckAccountStatementForm.Create(AOwner: TComponent; const card: TCard);
begin
  inherited Create(AOwner);
  _card := card;
end;

procedure TCheckAccountStatementForm.FormCreate(Sender: TObject);
begin
  if TAccount.Current <> nil then
  begin
    AccountNameLabel.Caption := AccountNameLabel.Caption + TAccount.Current.Name;
  end;

  if _card is TCreditCard then
  begin
     creditCard := _card as TCreditCard;
     CardTypeLabel.Caption := 'Tarjeta de crédito';
     AmountTypeLabel.Caption := 'Crédito:';
     CardNumberLabel.Caption := creditCard.CardNumber;
     CardAmountLabel.Caption := creditCard.Credit.ToString;
  end
  else if _card is TDebitCard then
  begin
     debitCard := _card as TDebitCard;
     CardTypeLabel.Caption := 'Tarjeta de débito';
     AmountTypeLabel.Caption := 'Saldo:';
     CardNumberLabel.Caption := debitCard.CardNumber;
     CardAmountLabel.Caption := debitCard.Balance.ToString;
  end;
end;

end.
