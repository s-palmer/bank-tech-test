require 'transaction'

describe Transaction do
  it 'creates a new entry for each transaction' do
    current_date = Timecop.freeze(Date.new(2021, 11, 22))
    new_transaction = Transaction.new(dep: 10, wd: 0, date: current_date.strftime("%d/%m/%Y"), balance: 10)
    expect(new_transaction.dep_amount).to eq 10
    expect(new_transaction.wd_amount).to eq 0
    expect(new_transaction.transaction_date).to eq "22/11/2021"
    expect(new_transaction.new_balance).to eq 10
  end
end
