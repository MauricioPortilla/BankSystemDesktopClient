unit CreateTransactionDeposit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RegularExpressions, Cards, Transaction, Enums;

type
  TCreateTransactionDepositForm = class(TForm)
    CardNumberLabel: TLabel;
    CardNumberTitleLabel: TLabel;
    Label1: TLabel;
    AmountTF: TEdit;
    Label2: TLabel;
    ReferenceTF: TEdit;
    Label3: TLabel;
    ConceptTF: TEdit;
    DepositButton: TButton;
    BackButton: TButton;
    procedure DepositButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    _card: TCard;
  public
    constructor Create(AOwner: TComponent; const card: TCard);
  end;

var
  CreateTransactionDepositForm: TCreateTransactionDepositForm;

implementation

{$R *.dfm}

constructor TCreateTransactionDepositForm.Create(AOwner: TComponent; const card: TCard);
begin
  inherited Create(AOwner);
  _card := card;
end;

procedure TCreateTransactionDepositForm.DepositButtonClick(Sender: TObject);
var
  newTransaction: TTransaction;
begin
  if (AmountTF.Text = '') or (ReferenceTF.Text = '') or (ConceptTF.Text = '') then
  begin
    ShowMessage('Faltan campos por completar.');
    exit;
  end
  else if not TRegEx.IsMatch(AmountTF.Text, '[0-9]+') or not TRegEx.IsMatch(ReferenceTF.Text, '[0-9]+') then
  begin
    ShowMessage('Debes introducir datos válidos.');
    exit;
  end;
  newTransaction := TTransaction.Create(
    EncodeDate(2000, 2, 9),
    StrToFloat(AmountTF.Text),
    ReferenceTF.Text,
    ConceptTF.Text, 0.0, 0.0,
    TRANSACTION_STATUS.PAID
  );
  if newTransaction.Save then
    ShowMessage('Transacción registrada.')
  else
    ShowMessage('Ocurrió un error al realizar esta acción.');
end;

procedure TCreateTransactionDepositForm.FormCreate(Sender: TObject);
begin
  if _card is TDebitCard then
  begin
    CardNumberLabel.Caption := (_card as TDebitCard).GetCardNumber;
  end
  else if _card is TCreditCard then
  begin
    CardNumberLabel.Caption := (_card as TCreditCard).GetCardNumber;
  end
end;

end.
