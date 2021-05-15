unit Cards;

interface

uses
  Enums;

type
  TCard = class abstract
    protected
      _cardId: integer;
      _cardNumber: string;
      _cvv: integer;
      _expirationDate: TDate;
      _pin: integer;
      _createdAt: TDateTime;
      _status: CARD_STATUS;
    public
      property CardId: integer read _cardId write _cardId;
      function GetCardNumber(): string;
  end;

  TDebitCard = class(TCard)
    private
      _balance: double;
    public
      constructor Create(
        const cardId: integer;
        const cardNumber: string;
        const cvv: integer;
        const expDate: TDate;
        const pin: integer;
        const createdAt: TDateTime;
        const status: CARD_STATUS;
        const balance: double
      );
  end;

  TCreditCardType = class
    private
      _fundingLevel: string;
      _interestRate: double;
      _credit: double;
    public
      constructor Create(
        const fundingLevel: string;
        const interestRate: double;
        const credit: double
      );
      property InterestRate: double read _interestRate;
  end;
  
  TCreditCard = class(TCard)
    private
      _credit: double;
      _payday: integer;
      _positiveBalance: double;
      _creditCardType: TCreditCardType;
    public
      constructor Create(
        const cardId: integer;
        const cardNumber: string;
        const cvv: integer;
        const expDate: TDate;
        const pin: integer;
        const createdAt: TDateTime;
        const status: CARD_STATUS;
        const credit: double;
        const payday: integer;
        const positiveBalance: double;
        const creditCardType: TCreditCardType
      );
      property CreditCardType: TCreditCardType read _creditCardType;
  end;

implementation

constructor TDebitCard.Create(
  const cardId: integer;
  const cardNumber: string;
  const cvv: integer;
  const expDate: TDate;
  const pin: integer;
  const createdAt: TDateTime;
  const status: CARD_STATUS;
  const balance: double
);
begin
  _cardId := cardId;
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
  const cardId: integer;
  const cardNumber: string;
  const cvv: integer;
  const expDate: TDate;
  const pin: integer;
  const createdAt: TDateTime;
  const status: CARD_STATUS;
  const credit: double;
  const payday: integer;
  const positiveBalance: double;
  const creditCardType: TCreditCardType
);
begin
  _cardId := cardId;
  _cardNumber := cardNumber;
  _cvv := cvv;
  _expirationDate := expDate;
  _pin := pin;
  _createdAt := createdAt;
  _status := status;
  _credit := credit;
  _payday := payday;
  _positiveBalance := positiveBalance;
  _creditCardType := creditCardType;
end;

constructor TCreditCardType.Create(
  const fundingLevel: string;
  const interestRate: double;
  const credit: double
);
begin
  _fundingLevel := fundingLevel;
  _interestRate := interestRate;
  _credit := credit;
end;

end.
