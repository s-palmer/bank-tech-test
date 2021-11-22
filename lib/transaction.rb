class Transaction
  attr_reader :deposit_amount, :withdrawal_amount, :transaction_date, :new_balance

  def initialize(dep, wd, date, bal)
    @deposit_amount = dep
    @withdrawal_amount = wd
    @transaction_date = date
    @new_balance = bal
  end
end
