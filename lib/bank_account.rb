class BankAccount

  def initialize
    @balance = 0
  end

  def print_balance
    @balance
  end

  def add_money(amount)
    @balance += amount
  end

  def deduct_money(amount)
    @balance -= amount
  end
end
