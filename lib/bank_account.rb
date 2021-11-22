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
    @transaction_history << { deposit: amount, withdraw: 0, date: current_date, new_balance: @balance }
  end

  def deduct_money(amount)
    @balance -= amount
  end

  private

  def current_date
    current_date = Time.now.strftime("%d/%m/%Y")
  end
end
