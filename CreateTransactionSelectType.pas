unit CreateTransactionSelectType;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Account, Cards, CreateTransactionDeposit,
  CreateTransactionWithdraw, CreateTransactionMonthlyPayment, Vcl.ExtCtrls;

type
  TCreateTransactionSelectTypeForm = class(TForm)
    DepositButton: TButton;
    WithdrawButton: TButton;
    MonthlyPaymentButton: TButton;
    CardNumberTitleLabel: TLabel;
    CardNumberLabel: TLabel;
    BankSystemPanel: TPanel;
    Label2: TLabel;
    AccountNameLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DepositButtonClick(Sender: TObject);
    procedure WithdrawButtonClick(Sender: TObject);
    procedure MonthlyPaymentButtonClick(Sender: TObject);
  private
    _card: TCard;
  public
    constructor Create(AOwner: TComponent; const card: TCard); reintroduce; overload;
  end;

var
  CreateTransactionSelectTypeForm: TCreateTransactionSelectTypeForm;

implementation

{$R *.dfm}

constructor TCreateTransactionSelectTypeForm.Create(AOwner: TComponent; const card: TCard);
begin
  inherited Create(AOwner);
  _card := card;
end;

procedure TCreateTransactionSelectTypeForm.DepositButtonClick(Sender: TObject);
var
  form: TCreateTransactionDepositForm;
begin
  form := TCreateTransactionDepositForm.Create(Application, _card);
  form.ShowModal;
  form.Release;
end;

procedure TCreateTransactionSelectTypeForm.FormCreate(Sender: TObject);
begin
  if TAccount.Current <> nil then
    AccountNameLabel.Caption := AccountNameLabel.Caption + TAccount.Current.Name;

  if _card is TDebitCard then
  begin
    CardNumberLabel.Caption := (_card as TDebitCard).GetCardNumber;
    MonthlyPaymentButton.Enabled := false;
  end
  else if _card is TCreditCard then
  begin
    CardNumberLabel.Caption := (_card as TCreditCard).GetCardNumber;
    DepositButton.Enabled := false;
  end
end;

procedure TCreateTransactionSelectTypeForm.MonthlyPaymentButtonClick(
  Sender: TObject);
var
  form: TCreateTransactionMonthlyPaymentForm;
begin
  form := TCreateTransactionMonthlyPaymentForm.Create(Application, _card);
  form.ShowModal;
  form.Release;
end;

procedure TCreateTransactionSelectTypeForm.WithdrawButtonClick(Sender: TObject);
var
  form: TCreateTransactionWithdrawForm;
begin
  form := TCreateTransactionWithdrawForm.Create(Application, _card);
  form.ShowModal;
  form.Release;
end;

end.
