require 'bigdecimal/util'
class Statement
  def initialize(transaction_history)
    transaction_history.each do |transaction|
      print transaction.transaction_date
      dividers
      print to_decimal(transaction.deposit_amount) unless transaction.deposit_amount == ""
      dividers
      print to_decimal(transaction.withdrawal_amount) unless transaction.withdrawal_amount == ""
      dividers
      print to_decimal(transaction.new_balance)
      puts
    end
  end

  private

  def dividers
    print " || "
  end

  def to_decimal(x, n = 2)
    "%.#{n}f" % x.to_d.truncate(n)
  end
end
