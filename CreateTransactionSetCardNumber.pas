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
    function ValidateData(): boolean;
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

function TCreateTransactionSetCardNumberForm.ValidateData(): boolean;
begin
  if CardNumberTF.Text = '' then
  begin
    ShowMessage('Faltan campos por completar');
    Result := false;
    exit;
  end
  else if not TRegEx.IsMatch(CardNumberTF.Text, '^[0-9]+$') then
  begin
    ShowMessage('Debes introducir datos válidos');
    Result := false;
    exit;
  end
  else if Length(CardNumberTF.Text) <> 16 then
  begin
    ShowMessage('Debes introducir un número de 16 dígitos.');
    Result := false;
    exit;
  end;
  Result := true;
end;

procedure TCreateTransactionSetCardNumberForm.BackButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TCreateTransactionSetCardNumberForm.ContinueButtonClick(
  Sender: TObject);
var
  createTransactionSelectTypeForm: TCreateTransactionSelectTypeForm;
  card: TCard;
begin
  if not ValidateData then
    exit;
  try
    card := TCard.GetByCardNumber(CardNumberTF.Text);
    createTransactionSelectTypeForm := TCreateTransactionSelectTypeForm.Create(Application, card);
    createTransactionSelectTypeForm.ShowModal;
    createTransactionSelectTypeForm.Release;
  except
    on ex: Exception do begin
      ShowMessage(ex.Message);
    end;
  end;

end;

procedure TCreateTransactionSetCardNumberForm.FormCreate(Sender: TObject);
begin
  if TAccount.Current <> nil then
    AccountNameLabel.Caption := AccountNameLabel.Caption + TAccount.Current.Name;
end;

end.
