unit CreateTransactionSelectType;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Models;

type
  TCreateTransactionSelectTypeForm = class(TForm)
    DepositButton: TButton;
    WithdrawButton: TButton;
    MonthlyPaymentButton: TButton;
    CardNumberTitleLabel: TLabel;
    CardNumberLabel: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    _card: Card;
  public
    constructor Create(AOwner: TComponent; const card: Card);
  end;

var
  CreateTransactionSelectTypeForm: TCreateTransactionSelectTypeForm;

implementation

{$R *.dfm}

constructor TCreateTransactionSelectTypeForm.Create(AOwner: TComponent; const card: Card);
begin
  inherited Create(AOwner);
  _card := card;
end;

procedure TCreateTransactionSelectTypeForm.FormCreate(Sender: TObject);
begin
  if _card is DebitCard then
    CardNumberLabel.Caption := (_card as DebitCard).GetCardNumber;
end;

end.
