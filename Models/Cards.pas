unit Cards;

interface

uses
  Enums;

type
  TCard = class abstract
    protected
      _cardNumber: string;
      _cvv: integer;
      _expirationDate: TDate;
      _pin: integer;
      _createdAt: TDateTime;
      _status: CARD_STATUS;
    public
      function GetCardNumber(): string;
  end;

  TDebitCard = class(TCard)
    private
      _balance: double;
    public
      constructor Create(
        const cardNumber: string;
        const cvv: integer;
        const expDate: TDate;
        const pin: integer;
        const createdAt: TDateTime;
        const status: CARD_STATUS;
        const balance: double
      );
  end;
  
  TCreditCard = class(TCard)
    private
      _credit: double;
      _payday: integer;
      _positiveBalance: double;
    public
      constructor Create(
        const cardNumber: string;
        const cvv: integer;
        const expDate: TDate;
        const pin: integer;
        const createdAt: TDateTime;
        const status: CARD_STATUS;
        const credit: double;
        const payday: integer;
        const positiveBalance: double
      );
  end;

implementation

constructor TDebitCard.Create(
  const cardNumber: string;
  const cvv: integer;
  const expDate: TDate;
  const pin: integer;
  const createdAt: TDateTime;
  const status: CARD_STATUS;
  const balance: double
);
begin
  _cardNumber := cardNumber;
  _cvv := cvv;
  _expirationDate := expDate;
  _pin := pin;
  _createdAt := createdAt;
  _status := status;
  _balance := balance;
end;

function TCard.GetCardNumber;
begin
  Result := _cardNumber;
end;

constructor TCreditCard.Create(
  const cardNumber: string;
  const cvv: integer;
  const expDate: TDate;
  const pin: integer;
  const createdAt: TDateTime;
  const status: CARD_STATUS;
  const credit: double;
  const payday: integer;
  const positiveBalance: double
);
begin
  _cardNumber := cardNumber;
  _cvv := cvv;
  _expirationDate := expDate;
  _pin := pin;
  _createdAt := createdAt;
  _status := status;
  _credit := credit;
  _payday := payday;
  _positiveBalance := positiveBalance;
end;

end.
