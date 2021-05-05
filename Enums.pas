unit Enums;

interface

type
  CARD_STATUS = (
    ACTIVE = 0,
    SUSPENDED = 1,
    BLOCKED = 2,
    CANCELED = 3
  );
  TRANSACTION_TYPE = (
    TRANSFER_OF_FUNDS = 0,
    DEPOSIT = 1,
    WITHDRAWAL = 2,
    PAYMENT = 3,
    MONTHLY_PAYMENT = 4,
    SURCHARGE_PAYMENT = 5
  );
  {$SCOPEDENUMS ON}
  TRANSACTION_STATUS = (
    PENDING = 0,
    PAID = 1,
    CANCELED = 2
  );
  {$SCOPEDENUMS OFF}

implementation

end.
