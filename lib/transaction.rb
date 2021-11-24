class Transaction
  attr_reader :dep_amount, :wd_amount, :transaction_date, :new_balance

  def initialize(args)
    @dep_amount = args[:dep]
    @wd_amount = args[:wd]
    @transaction_date = args[:date]
    @new_balance = args[:balance]
  end
end
