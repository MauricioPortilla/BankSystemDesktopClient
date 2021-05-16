unit CreateTransactionMonthlyPayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.ComCtrls, RegularExpressions, Cards, Transaction, Enums,
  Vcl.ExtCtrls, Account, System.JSON;

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
  public
    constructor Create(AOwner: TComponent; const card: TCard); reintroduce; overload;
    procedure AddTransactionToListView(
      listView: TListView;
      dateStr: string;
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
var
  data: TJSONValue;
  totals: TJSONValue;
  sumStack: TJSONArray;
  I: Integer;
  currentSumStackItem: TJSONValue;
  hasInit: boolean;
  hasInsertedLastPayment: boolean;
  currentPayment: TJSONValue;
  currentPaymentSurcharge: double;
  currentPaymentInterest: double;
begin
  hasInit := false;
  hasInsertedLastPayment := false;
  currentPaymentSurcharge := 0.0;
  currentPaymentInterest := 0.0;
  if TAccount.Current <> nil then
    AccountNameLabel.Caption := AccountNameLabel.Caption + TAccount.Current.Name;
  if _card = nil then
    exit;
  if _card is TDebitCard then
  begin
    Close;
    exit;
  end
  else if _card is TCreditCard then
  begin
    CardNumberLabel.Caption := (_card as TCreditCard).CardNumber;
  end;
  TransactionsListView.Items.BeginUpdate;
  try
    data := (_card as TCreditCard).GetDebt;
    totals := data.FindValue('data');
    sumStack := (data.FindValue('stack') as TJSONArray);
    for I := 0 to sumStack.Count - 1 do
    begin
      currentSumStackItem := sumStack.Items[I];
      if currentSumStackItem.FindValue('type').Value = 'payment' then
      begin
        hasInsertedLastPayment := false;
        if hasInit then
        begin  
          AddTransactionToListView(
            TransactionsListView,
            currentPayment.FindValue('date').Value,
            currentPayment.FindValue('amount').Value.ToDouble,
            currentPaymentSurcharge,
            currentPaymentInterest
          );
          currentPaymentSurcharge := 0.0;
          currentPaymentInterest := 0.0;
          hasInsertedLastPayment := true;
        end;
        currentPayment := currentSumStackItem;
        hasInit := true;
      end
      else if currentSumStackItem.FindValue('type').Value = 'surcharge' then
        currentPaymentSurcharge := currentPaymentSurcharge +
          currentSumStackItem.FindValue('amount').Value.ToDouble()
      else if currentSumStackItem.FindValue('type').Value = 'interest' then
        currentPaymentInterest := currentPaymentInterest +
          currentSumStackItem.FindValue('amount').Value.ToDouble()
      else if currentSumStackItem.FindValue('type').Value = 'monthly' then
      begin
        if not hasInsertedLastPayment then
        begin
          AddTransactionToListView(
            TransactionsListView,
            currentPayment.FindValue('date').Value,
            currentPayment.FindValue('amount').Value.ToDouble,
            currentPaymentSurcharge,
            currentPaymentInterest
          );
          hasInsertedLastPayment := true;
        end;
        AddTransactionToListView(
          TransactionsListView,
          currentSumStackItem.FindValue('date').Value,
          currentSumStackItem.FindValue('amount').Value.ToDouble,
          0.0,
          0.0
        );
      end;
    end;
    if not hasInsertedLastPayment then
      AddTransactionToListView(
        TransactionsListView,
        currentPayment.FindValue('date').Value,
        currentPayment.FindValue('amount').Value.ToDouble,
        currentPaymentSurcharge,
        currentPaymentInterest
      );
    _minAmount := totals.FindValue('minAmount').Value.ToDouble;  
    MinAmountLabel.Caption := '$' + _minAmount.ToString;
    SubtotalLabel.Caption := '$' + totals.FindValue('subtotal').Value;
    SubtotalInterestRateLabel.Caption := '$' + totals.FindValue('generalInterest').Value;
    InterestRatesSumLabel.Caption := '$' + totals.FindValue('interest').Value;
    TotalLabel.Caption := '$' + totals.FindValue('total').Value;
  except
    on ex: Exception do begin
      ShowMessage(ex.Message);
      Close;
    end;
  end;
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
  else if not TRegEx.IsMatch(AmountTF.Text, '^[0-9.]+$') then
  begin
    ShowMessage('Debes introducir datos válidos.');
    exit;
  end
  else if StrToFloat(AmountTF.Text) < _minAmount then
  begin
    ShowMessage('Debes ingresar el monto mínimo indicado.');
    exit;
  end;
  newTransaction := TTransaction.Create(
    _card.CardId,
    TRANSACTION_TYPE.MONTHLY_PAYMENT,
    EncodeDate(2000, 2, 9),
    StrToFloat(AmountTF.Text),
    '000000',
    '',
    creditCard.CreditCardType.InterestRate,
    0.0
  );
  try
    newTransaction.Save;
    ShowMessage('Transacción registrada.');
    Close;
  except
    on ex: Exception do begin
      ShowMessage(ex.Message);
    end;
  end;
end;

procedure TCreateTransactionMonthlyPaymentForm.AddTransactionToListView(
  listView: TListView;
  dateStr: string;
  debtAmount: double;
  surcharge: double;
  interestRate: double
);
var
  listItem: TListItem;
begin
  listItem := listView.Items.Add;
  listItem.Caption := dateStr;
  listItem.SubItems.Add('$' + debtAmount.ToString);
  listItem.SubItems.Add('$' + surcharge.ToString);
  listItem.SubItems.Add('$' + interestRate.ToString);
end;

end.
