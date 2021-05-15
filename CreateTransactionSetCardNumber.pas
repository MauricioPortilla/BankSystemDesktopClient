unit CreateTransactionSetCardNumber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, RegularExpressions, CreateTransactionSelectType,
  Account, Cards, Enums, HttpRest, System.JSON;

type
  TCreateTransactionSetCardNumberForm = class(TForm)
    CardNumberTF: TEdit;
    CardNumberLabel: TLabel;
    ContinueButton: TButton;
    BackButton: TButton;
    BankSystemPanel: TPanel;
    Label2: TLabel;
    AccountNameLabel: TLabel;
    procedure ContinueButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreateTransactionSetCardNumberForm: TCreateTransactionSetCardNumberForm;

implementation

{$R *.dfm}

procedure TCreateTransactionSetCardNumberForm.BackButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TCreateTransactionSetCardNumberForm.ContinueButtonClick(
  Sender: TObject);
var
  createTransactionSelectTypeForm: TCreateTransactionSelectTypeForm;
  card: TCard;
  result: THttpResponse;
  format: TFormatSettings;
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
  end
  else if Length(CardNumberTF.Text) <> 16 then
  begin
    ShowMessage('Debes introducir un número de 16 dígitos.');
    exit;
  end;
  result := THttpRest.SendGet('/card/' + CardNumberTF.Text + '/get');
  if not result.Success then
  begin
    ShowMessage(result.Message);
    exit;
  end;
  format := TFormatSettings.Create;
  format.ShortDateFormat := 'yyyy-mm-dd';
  format.DateSeparator := '-';
  if result.Data.FindValue('type').Value.ToInteger = 1 then
    card := TCreditCard.Create(
      result.Data.FindValue('cardId').Value.ToInteger,
      result.Data.FindValue('cardNumber').Value,
      0,
      StrToDateTime(result.Data.FindValue('expirationDate').Value, format),
      0,
      StrToDateTime(result.Data.FindValue('createdAt').Value, format),
      CARD_STATUS(result.Data.FindValue('status').Value.ToInteger),
      result.Data.FindValue('credit').Value.ToDouble,
      result.Data.FindValue('payday').Value.ToInteger,
      result.Data.FindValue('positiveBalance').Value.ToDouble,
      TCreditCardType.Create('type', 0.015, 8000)
    )
  else
    card := TDebitCard.Create(
      result.Data.FindValue('cardId').Value.ToInteger,
      result.Data.FindValue('cardNumber').Value,
      0,
      StrToDateTime(result.Data.FindValue('expirationDate').Value, format),
      0,
      StrToDateTime(result.Data.FindValue('createdAt').Value, format),
      CARD_STATUS(result.Data.FindValue('status').Value.ToInteger),
      result.Data.FindValue('balance').Value.ToDouble
    );
  createTransactionSelectTypeForm := TCreateTransactionSelectTypeForm.Create(Application, card);
  createTransactionSelectTypeForm.ShowModal;
  createTransactionSelectTypeForm.Release;
end;

procedure TCreateTransactionSetCardNumberForm.FormCreate(Sender: TObject);
begin
  if TAccount.Current <> nil then
    AccountNameLabel.Caption := AccountNameLabel.Caption + TAccount.Current.Name;
end;

end.
