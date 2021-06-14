unit RegisterCardFinish;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Account, Cards;

type
  TRegisterCardFinishForm = class(TForm)
    BankSystemPanel: TPanel;
    Label4: TLabel;
    AccountNameLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    CreationDateLabel: TLabel;
    CardNumberLabel: TLabel;
    CardCVVLabel: TLabel;
    ExpirationDateLabel: TLabel;
    AcceptButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure AcceptButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    _card: TCard;
  public
    constructor Create(AOwner: TComponent; const card: TCard); reintroduce; overload;
  end;

var
  RegisterCardFinishForm: TRegisterCardFinishForm;

implementation

{$R *.dfm}

constructor TRegisterCardFinishForm.Create(AOwner: TComponent; const card: TCard);
begin
  inherited Create(AOwner);
  _card := card;
end;

procedure TRegisterCardFinishForm.AcceptButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TRegisterCardFinishForm.FormCreate(Sender: TObject);
begin
  if TAccount.Current <> nil then
    AccountNameLabel.Caption := AccountNameLabel.Caption + TAccount.Current.Name;
end;

procedure TRegisterCardFinishForm.FormShow(Sender: TObject);
begin
  if _card = nil then
  begin
    Close;
    exit;
  end;
  CreationDateLabel.Caption := DateTimeToStr(_card.CreatedAt);
  CardNumberLabel.Caption := _card.CardNumber;
  CardCVVLabel.Caption := _card.Cvv.ToString;
  ExpirationDateLabel.Caption := DateToStr(_card.ExpirationDate);
end;

end.
