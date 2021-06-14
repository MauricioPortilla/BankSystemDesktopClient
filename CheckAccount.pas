unit CheckAccount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Account, RegularExpressions, Cards, Transaction, Enums;

type
  TCheckAccountForm = class(TForm)
    bankSystemPanel: TPanel;
    accountsPanel: TPanel;
    checkAccountStatementButton: TButton;
    AccountsListView: TListView;
    AccountNameLabel: TLabel;
    AccountIdTF: TEdit;
    IdAccountLabel: TLabel;
    GetCardsButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure GetCardsButtonClick (Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  CheckAccountForm: TCheckAccountForm;

implementation

{$R *.dfm}

procedure TCheckAccountForm.FormCreate(Sender: TObject);
begin
  if TAccount.Current <> nil then
    AccountNameLabel.Caption := AccountNameLabel.Caption + TAccount.Current.Name;
end;

procedure TCheckAccountForm.GetCardsButtonClick(Sender: TObject);
var
  Itm: TListItem;
  account: TAccount;
  cards: TCardArray;
  cardAux : TCard;
  debitCardAux: TDebitCard;
  creditCardAux: TCreditcard;
begin
  AccountsListView.Clear;
  if (AccountIdTF.Text = '') then
    begin
      ShowMessage('Faltan campos por completar.');
      exit;
    end
  else
    try
      cards:= account.GetCards(AccountIdTF.Text);
      AccountsListView.Items.BeginUpdate;
      for cardAux in cards do
      if cardAux is TCreditCard then
      begin
        creditCardAux := cardAux as TCreditCard;
        Itm := AccountsListView.Items.Add;
        Itm.Caption := 'Credito';
        Itm.SubItems.Add(creditCardAux.CardNumber);
        Itm.SubItems.Add(creditCardAux.Credit.ToString)
      end
      else
      begin
        debitCardAux := nil;
        debitCardAux := cardAux as TDebitCard;
        Itm := AccountsListView.Items.Add;
        Itm.Caption := 'Débito';
        Itm.SubItems.Add(debitCardAux.CardNumber);
        Itm.SubItems.Add(debitCardAux.Balance.ToString);
      end;
      AccountsListView.Items.EndUpdate;
    except
      on ex: Exception do begin
        ShowMessage(ex.ToString);
      end;
    end;
end;
end.
