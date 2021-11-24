require_relative "./transaction"
require 'bigdecimal/util'

class BankAccount
  attr_reader :transaction_history, :balance

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def print_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
    @transaction_history << Transaction.new(dep: amount, date: current_date, balance: @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_history << Transaction.new(wd: amount, date: current_date, balance: @balance)
  end

  def print_statement
    headers
    transactions
  end

  private

  def transactions
    output = ""
    @transaction_history.each do |transaction|
      if transaction.dep_amount.nil?
        output += "#{transaction.transaction_date} ||  || #{to_decimal(transaction.wd_amount)} || #{to_decimal(transaction.new_balance)} \n"
      elsif transaction.wd_amount.nil?
        output += "#{transaction.transaction_date} || #{to_decimal(transaction.dep_amount)} ||  || #{to_decimal(transaction.new_balance)} \n"
      end
    end
    puts output
  end

  def current_date
    date = Time.now.strftime("%d/%m/%Y")
  end

  def headers
    puts "date || credit || debit || balance"
  end

  def to_decimal(x, n = 2)
    "%.#{n}f" % x.to_d.truncate(n)
  end
end
