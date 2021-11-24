require "bank_account"
require "timecop"

describe BankAccount do
  before :each do
    @my_account = BankAccount.new
  end

  describe "#print_balance" do
    it "returns the current balance" do
      expect(@my_account.print_balance).to eq 0
    end
  end

  describe "#deposit" do
    it "should add money to the account" do
      @my_account.deposit(10)
      expect(@my_account.print_balance).to eq 10
    end

    it "should add a new transaction to the transaction history" do
      Timecop.freeze(Date.new(2021, 11, 22))
      @my_account.deposit(10)
      expect(@my_account.txn_history.first.dep_amount).to eq 10
      expect(@my_account.txn_history.first.txn_date).to eq "22/11/2021"
      expect(@my_account.txn_history.first.new_balance).to eq 10
    end
  end

  describe "#withdraw" do
    it "should remove money from the account" do
      @my_account.deposit(20)
      @my_account.withdraw(10)
      expect(@my_account.print_balance).to eq 10
    end

    it "should add a new withdrawal transaction to the transaction history" do
      Timecop.freeze(Date.new(2021, 11, 22))
      @my_account.deposit(10)
      @my_account.withdraw(10)
      expect(@my_account.txn_history.last.wd_amount).to eq 10
      expect(@my_account.txn_history.last.txn_date).to eq "22/11/2021"
      expect(@my_account.txn_history.last.new_balance).to eq 0
    end
  end

  describe "#print_statement" do
    it "should print out a nicely formatted statement" do
      Timecop.freeze(Date.new(2021, 11, 22))
      @my_account.deposit(10)
      expect { @my_account.print_statement }.to output("date || credit || debit || balance\n22/11/2021 || 10.00 ||  || 10.00 \n").to_stdout
    end
  end
end
