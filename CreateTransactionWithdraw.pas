unit CreateTransactionWithdraw;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RegularExpressions, Cards, Transaction, Enums;

type
  TCreateTransactionWithdrawForm = class(TForm)
    CardNumberLabel: TLabel;
    CardNumberTitleLabel: TLabel;
    Label1: TLabel;
    AmountTF: TEdit;
    WithdrawButton: TButton;
    BackButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure WithdrawButtonClick(Sender: TObject);
  private
    _card: TCard;
  public
    constructor Create(AOwner: TComponent; const card: TCard); reintroduce; overload;
  end;

var
  CreateTransactionWithdrawForm: TCreateTransactionWithdrawForm;

implementation

{$R *.dfm}

constructor TCreateTransactionWithdrawForm.Create(AOwner: TComponent; const card: TCard);
begin
  inherited Create(AOwner);
  _card := card;
end;

procedure TCreateTransactionWithdrawForm.FormCreate(Sender: TObject);
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

procedure TCreateTransactionWithdrawForm.WithdrawButtonClick(Sender: TObject);
var
  newTransaction: TTransaction;
begin
  if (AmountTF.Text = '') then
  begin
    ShowMessage('Faltan campos por completar.');
    exit;
  end
  else if not TRegEx.IsMatch(AmountTF.Text, '[0-9]+') then
  begin
    ShowMessage('Debes introducir datos válidos.');
    exit;
  end;
  newTransaction := TTransaction.Create(
    TRANSACTION_TYPE.WITHDRAWAL,
    EncodeDate(2000, 2, 9),
    StrToFloat(AmountTF.Text),
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
  if newTransaction.Save then
    ShowMessage('Transacción registrada.')
  else
    ShowMessage('Ocurrió un error al realizar esta acción.');
end;

end.
