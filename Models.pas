unit Models;

interface

type
  Card = class abstract
    protected
      _cardNumber: string;
      _cvv: integer;
      _expirationDate: TDate;
      _pin: integer;
      _createdAt: TDateTime;
    public
      function GetCardNumber(): string;
  end;
  DebitCard = class(Card)
    private
      _balance: double;
    public
      constructor Create(
        const cardNumber: string;
        const cvv: integer;
        const expDate: TDate;
        const pin: integer;
        const createdAt: TDateTime;
        const balance: double
      );
  end;
  CreditCard = class(Card)
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
        const credit: double;
        const payday: integer;
        const positiveBalance: double
      );
  end;

implementation

constructor DebitCard.Create(
  const cardNumber: string;
  const cvv: integer;
  const expDate: TDate;
  const pin: integer;
  const createdAt: TDateTime;
  const balance: double
);
begin
  _cardNumber := cardNumber;
  _cvv := cvv;
  _expirationDate := expDate;
  _pin := pin;
  _createdAt := createdAt;
  _balance := balance;
end;

function Card.GetCardNumber;
begin
  Result := _cardNumber;
end;

constructor CreditCard.Create(
  const cardNumber: string;
  const cvv: integer;
  const expDate: TDate;
  const pin: integer;
  const createdAt: TDateTime;
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
  _credit := credit;
  _payday := payday;
  _positiveBalance := positiveBalance;
end;

end.
