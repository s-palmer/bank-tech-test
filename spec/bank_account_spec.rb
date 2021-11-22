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

  describe "#add_money" do
    it "should add money to the account" do
      @my_account.add_money(10)
      expect(@my_account.print_balance).to eq 10
    end

    it "should add a new transaction to the transaction history" do
      Timecop.freeze(Date.new(2021, 11, 22))
      @my_account.add_money(10)
      expect(@my_account.transaction_history).to include ({ deposit: 10, withdraw: 0, date: "22/11/2021", new_balance: 10 })
    end
  end

  describe "#deduct_money" do
    it "should remove money from the account" do
      @my_account.add_money(20)
      @my_account.deduct_money(10)
      expect(@my_account.print_balance).to eq 10
    end

    it "should add a new transaction to the transaction history"
  end
end
