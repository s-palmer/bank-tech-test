describe 'Acceptance Criteria' do
  it 'shows a correctly formatted bank statement' do
    account = BankAccount.new
    account.transaction_history << Transaction.new(dep: 1000, date: "10/01/2023", balance: 1000)    
    account.transaction_history << Transaction.new(dep: 2000, date: "13/01/2023", balance: 3000)
    account.transaction_history << Transaction.new(wd: 500, date: "14/01/2023", balance: 2500)
  
    expect { account.print_statement }.to output("date || credit || debit || balance\n14/01/2023 ||  || 500.00 || 2500.00 \n13/01/2023 || 2000.00 ||  || 3000.00 \n10/01/2023 || 1000.00 ||  || 1000.00 \n").to_stdout
  end
end
