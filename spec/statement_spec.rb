require "statement"

describe Statement do
  let(:deposit) { 5 }
  let(:balance) { 5 }
  let(:date) { "23/11/2021" }
  let(:withdrawal) { 0 }
  let(:transaction_history_double) { double(:transaction_history, deposit_amount: deposit, new_balance: balance, transaction_date: date, withdrawal_amount: withdrawal) }
  
  it "outputs a formatted statement from a transaction history" do
    expect(transaction_history_double).to receive(:deposit_amount).and_return(5)
    expect(transaction_history_double).to receive(:new_balance).and_return(5)
    expect(transaction_history_double).to receive(:transaction_date).and_return("23/11/2021")
    expect(transaction_history_double).to receive(:withdrawal_amount).and_return(0)

    # expect { Statement.new(transaction_history_double) }.to output().to_stdout  
  end
end
