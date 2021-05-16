unit Enums;

interface

type
  CARD_STATUS = (
    ACTIVE = 0,
    SUSPENDED = 1,
    BLOCKED = 2,
    CANCELED = 3
  );
  CARD_TYPE = (
    DEBIT = 0,
    CREDIT = 1
  );
  TRANSACTION_TYPE = (
    TRANSFER_OF_FUNDS = 0,
    DEPOSIT = 1,
    WITHDRAWAL = 2,
    PAYMENT = 3,
    MONTHLY_PAYMENT = 4,
    SURCHARGE_PAYMENT = 5
  );

implementation

end.
