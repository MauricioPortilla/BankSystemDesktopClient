unit CreateTransactionSetCardNumber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, RegularExpressions, CreateTransactionSelectType,
  Cards, Enums;

type
  TCreateTransactionSetCardNumberForm = class(TForm)
    CardNumberTF: TEdit;
    CardNumberLabel: TLabel;
    ContinueButton: TButton;
    BackButton: TButton;
    procedure ContinueButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreateTransactionSetCardNumberForm: TCreateTransactionSetCardNumberForm;

implementation

{$R *.dfm}

procedure TCreateTransactionSetCardNumberForm.ContinueButtonClick(
  Sender: TObject);
var
  createTransactionSelectTypeForm: TCreateTransactionSelectTypeForm;
  card: TDebitCard;
begin
  if CardNumberTF.Text = '' then
  begin
    ShowMessage('Faltan campos por completar');
    exit;
  end
  else if not TRegEx.IsMatch(CardNumberTF.Text, '[0-9]+') then
  begin
    ShowMessage('Debes introducir datos válidos');
    exit;
  end;
  // TODO: SEND REQUEST TO CHECK CARD NUMBER.
  card := TDebitCard.Create(CardNumberTF.Text, 0, EncodeDate(2000, 2, 9), 0, EncodeDate(2000, 2, 9), CARD_STATUS.ACTIVE, 0.0);
  createTransactionSelectTypeForm := TCreateTransactionSelectTypeForm.Create(Application, card);
  createTransactionSelectTypeForm.ShowModal;
  createTransactionSelectTypeForm.Release;
end;

end.
