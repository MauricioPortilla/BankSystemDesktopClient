unit CreateTransactionMonthlyPayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.ComCtrls, RegularExpressions, Cards, Transaction, Enums,
  Vcl.ExtCtrls, Account;

type
  TCreateTransactionMonthlyPaymentForm = class(TForm)
    CardNumberTitleLabel: TLabel;
    CardNumberLabel: TLabel;
    PayButton: TButton;
    BackButton: TButton;
    Label1: TLabel;
    AmountTF: TEdit;
    MinAmountLabel: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SubtotalLabel: TLabel;
    SubtotalInterestRateLabel: TLabel;
    InterestRatesSumLabel: TLabel;
    TotalLabel: TLabel;
    TransactionsListView: TListView;
    BankSystemPanel: TPanel;
    Label6: TLabel;
    AccountNameLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure PayButtonClick(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
  private
    _card: TCard;
    _minAmount: double;
    _surchargeRate: double;
  public
    constructor Create(AOwner: TComponent; const card: TCard); reintroduce; overload;
    procedure AddTransactionToListView(
      listView: TListView;
      month: string;
      debtAmount: double;
      surcharge: double;
      interestRate: double
    );
  end;

var
  CreateTransactionMonthlyPaymentForm: TCreateTransactionMonthlyPaymentForm;

implementation

{$R *.dfm}

procedure TCreateTransactionMonthlyPaymentForm.BackButtonClick(Sender: TObject);
begin
  Close;
end;

constructor TCreateTransactionMonthlyPaymentForm.Create(AOwner: TComponent; const card: TCard);
begin
  inherited Create(AOwner);
  _card := card;
end;

procedure TCreateTransactionMonthlyPaymentForm.FormCreate(Sender: TObject);
begin
  if TAccount.Current <> nil then
    AccountNameLabel.Caption := AccountNameLabel.Caption + TAccount.Current.Name;

  if _card is TDebitCard then
  begin
    CardNumberLabel.Caption := (_card as TDebitCard).CardNumber;
  end
  else if _card is TCreditCard then
  begin
    CardNumberLabel.Caption := (_card as TCreditCard).CardNumber;
  end;
  // TODO: RETRIEVE CURRENT SURCHARGE RATE FROM API REST
  // TODO: RETRIEVE TRANSACTIONS FROM API REST
  TransactionsListView.Items.BeginUpdate;
  AddTransactionToListView(TransactionsListView, 'Marzo', 500, 25, 7.5);
  AddTransactionToListView(TransactionsListView, 'Abril', 150, 0, 0);
  TransactionsListView.Items.EndUpdate;
end;

procedure TCreateTransactionMonthlyPaymentForm.PayButtonClick(Sender: TObject);
var
  newTransaction: TTransaction;
  creditCard: TCreditCard;
begin
  creditCard := _card as TCreditCard;
  if (AmountTF.Text = '') then
  begin
    ShowMessage('Faltan campos por completar.');
    exit;
  end
  else if not TRegEx.IsMatch(AmountTF.Text, '[0-9]+') then
  begin
    ShowMessage('Debes introducir datos válidos.');
    exit;
  end
  else if StrToFloat(AmountTF.Text) < _minAmount then
  begin
    ShowMessage('Debes ingresar el monto mínimo indicado.');
    exit;
  end;
  // NOTE: ALL THE OTHER TRANSACTIONS CHANGES STATUS IN NEW TRANSACTION IF TYPE IS MONTHLY_PAYMENT
  newTransaction := TTransaction.Create(
    _card.CardId,
    TRANSACTION_TYPE.MONTHLY_PAYMENT,
    EncodeDate(2000, 2, 9),
    StrToFloat(AmountTF.Text),
    NULL,
    NULL,
    creditCard.CreditCardType.InterestRate,
    _surchargeRate
  );
  if newTransaction.Save then
    ShowMessage('Transacción registrada.')
  else
    ShowMessage('Ocurrió un error al realizar esta acción.');
end;

procedure TCreateTransactionMonthlyPaymentForm.AddTransactionToListView(
  listView: TListView;
  month: string;
  debtAmount: double;
  surcharge: double;
  interestRate: double
);
var
  listItem: TListItem;
begin
  listItem := listView.Items.Add;
  listItem.Caption := month;
  listItem.SubItems.Add('$' + debtAmount.ToString);
  listItem.SubItems.Add('$' + surcharge.ToString);
  listItem.SubItems.Add('$' + interestRate.ToString);
end;

end.
