require_relative './transaction' 

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

  private

  def current_date
    current_date = Time.now.strftime("%d/%m/%Y")
  end
end
