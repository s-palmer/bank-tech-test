require_relative "./transaction"
require 'bigdecimal/util'

class BankAccount
  attr_reader :txn_history, :balance

  def initialize
    @balance = 0
    @txn_history = []
  end

  def print_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
    @txn_history << Transaction.new(dep: amount, date: current_date, balance: @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @txn_history << Transaction.new(wd: amount, date: current_date, balance: @balance)
  end

  def print_statement
    headers
    transactions
  end

  private

  def transactions
    output = ""
    @txn_history.each do |txn|
      if txn.dep_amount.nil?
        output += "#{txn.txn_date} ||  || #{to_decimal(txn.wd_amount)} || #{to_decimal(txn.new_balance)} \n"
      elsif txn.wd_amount.nil?
        output += "#{txn.txn_date} || #{to_decimal(txn.dep_amount)} ||  || #{to_decimal(txn.new_balance)} \n"
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
