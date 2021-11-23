require_relative "./transaction"
require 'bigdecimal/util'

class BankAccount
  attr_reader :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def print_balance
    @balance
  end

  def add_money(amount)
    @balance += amount
    @transaction_history << Transaction.new(amount, 0, current_date, @balance)
  end

  def deduct_money(amount)
    @balance -= amount
    @transaction_history << Transaction.new(0, amount, current_date, @balance)
  end

  def print_statement
    headers
    transactions
  end

  private

  def current_date
    current_date = Time.now.strftime("%d/%m/%Y")
  end

  def headers
    puts "date || credit || debit || balance"
  end

  def dividers
    print " || "
  end

  def transactions
    @transaction_history.each do |transaction|
      print transaction.transaction_date
      dividers
      print to_decimal(transaction.deposit_amount)
      dividers
      print to_decimal(transaction.withdrawal_amount)
      dividers
      print to_decimal(transaction.new_balance)
      puts
    end
  end

  def to_decimal(x, n = 2)
    "%.#{n}f" % x.to_d.truncate(n)
  end
  
end
