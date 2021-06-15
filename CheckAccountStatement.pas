unit CheckAccountStatement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Enums,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Cards, Account, Transaction;

type
  TCheckAccountStatementForm = class(TForm)
    bankSystemPanel: TPanel;
    BankSystemLabel: TLabel;
    AccountNameLabel: TLabel;
    monthComboBox: TComboBox;
    AccountStatementPanel: TPanel;
    checkAccountStatementButton: TButton;
    Panel2: TPanel;
    CardTypeLabel: TLabel;
    CardNumberLabel: TLabel;
    CardAmountLabel: TLabel;
    AmountTypeLabel: TLabel;
    TransactionsListView: TListView;
    YearTF: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure checkAccountStatementButtonClick(Sender: TObject);
  private
    _card: TCard;
    creditCard : TCreditCard;
    debitCard : TDebitCard;
    transactions : TTransactionArray;
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
  AccountNameLabel.Caption := AccountNameLabel.Caption + TAccount.Current.Name;

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

procedure TCheckAccountStatementForm.checkAccountStatementButtonClick(Sender: TObject);
var
  Itm: TListItem;
  transactionAux: TTransaction;
begin
  TransactionsListView.Clear;
   if monthComboBox.ItemIndex = -1 then
   begin
    ShowMessage('Seleccione un mes.');
    exit;
   end
   else if YearTF.Text = '' then
   begin
    ShowMessage('Escriba un año.');
    exit;
   end
   else
   begin
     try
      transactions:= _card.GetCardTransactionsByDate(_card.CardId,YearTF.Text, monthComboBox.ItemIndex + 1);
      TransactionsListView.Items.BeginUpdate;
      for transactionAux in transactions do
      begin
        Itm := TransactionsListView.Items.Add;
        Itm.Caption := DateTimeToStr(transactionAux.CreatedAt);
        Itm.SubItems.Add(transactionAux.Concept);
        if transactionAux.TypeT = TRANSACTION_TYPE.TRANSFER_OF_FUNDS then
          begin
            Itm.SubItems.Add('Transferencia de fondos');
          end
        else if transactionAux.TypeT = TRANSACTION_TYPE.DEPOSIT then
          Itm.SubItems.Add('Deposito')
        else if transactionAux.TypeT = TRANSACTION_TYPE.WITHDRAWAL  then
          Itm.SubItems.Add('Retiro de fondos')
        else if transactionAux.TypeT = TRANSACTION_TYPE.PAYMENT   then
          Itm.SubItems.Add('Pago')
        else if transactionAux.TypeT = TRANSACTION_TYPE.MONTHLY_PAYMENT   then
          Itm.SubItems.Add('Pago mensual');
        Itm.SubItems.Add(transactionAux.Reference);
        Itm.SubItems.Add(transactionAux.Amount.ToString);
      end;
      TransactionsListView.Items.EndUpdate;
    except
      on ex: Exception do begin
        ShowMessage(ex.ToString);
      end;
    end;
   end;

end;
end.
