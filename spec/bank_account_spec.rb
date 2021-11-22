require "bank_account"

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

    describe "#deduct_money" do
      it "should remove money from the account" do
        @my_account.add_money(20)
        @my_account.deduct_money(10)
        expect(@my_account.print_balance).to eq 10
      end
    end
  end
end
