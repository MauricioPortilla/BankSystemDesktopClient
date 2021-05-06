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
  card: TCreditCard;
begin
  if CardNumberTF.Text = '' then
  begin
    ShowMessage('Faltan campos por completar');
    exit;
  end
  else if not TRegEx.IsMatch(CardNumberTF.Text, '[0-9]+') then
  begin
    ShowMessage('Debes introducir datos v�lidos');
    exit;
  end;
  // TODO: SEND REQUEST TO CHECK CARD NUMBER AND GET CARD DEPENDING OF CARD TYPE. CREDIT CARD TYPE SHOULD BE RETRIEVED TOO.
  card := TCreditCard.Create(
    CardNumberTF.Text,
    0,
    EncodeDate(2000, 2, 9),
    0,
    EncodeDate(2000, 2, 9),
    CARD_STATUS.ACTIVE,
    0.0,
    15,
    0,
    TCreditCardType.Create('type', 0.015, 8000)
  );
  createTransactionSelectTypeForm := TCreateTransactionSelectTypeForm.Create(Application, card);
  createTransactionSelectTypeForm.ShowModal;
  createTransactionSelectTypeForm.Release;
end;

end.
