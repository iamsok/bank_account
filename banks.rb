require_relative 'account'
require_relative 'transaction'

def accounts
  accounts = []
  CSV.foreach('balances.csv', headers: true, header_converters: :symbol) do |row|
    accounts << row[:account]
  end
  accounts
end

accounts.each do |name|
  account = Account.new(name, 'balances.csv', 'bank_data.csv')
  puts "==== Purchasing Account ===="
  puts "Starting Balance: $#{account.starting_balance}"
  puts "Ending Balance: $#{account.current_balance}"
  puts

  account.summary.each do |transaction|
    puts transaction
  end
  puts "========"
  puts
end
