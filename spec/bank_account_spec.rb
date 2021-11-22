require 'bank_account'

describe BankAccount do

  describe '#print_balance' do
    it 'returns the current balance' do
      my_account = BankAccount.new
      expect(my_account.print_balance).to eq 0
    end
  end
end
