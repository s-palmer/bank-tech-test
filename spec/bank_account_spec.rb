require "bank_account"

describe BankAccount do
  before :each do
    @my_account = BankAccount.new
    Timecop.freeze(Date.now(2021, 11, 22))
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
      @my_account.add_money(10)
      expect(@my_account.transaction_history).to include ({ deposit: 10, withdraw: 0, date: "2021/11/22", new_balance: 10 })
    end
  end

  describe "#deduct_money" do
    it "should remove money from the account" do
      @my_account.add_money(20)
      @my_account.deduct_money(10)
      expect(@my_account.print_balance).to eq 10
    end
  end
end
