require 'pry'
require 'csv'
require_relative 'transaction'


class Account
  attr_reader :name, :balance_data, :transactions_data

  def initialize(name, balance_data, transactions_data)
    @name = name
    @balance_data = balance_data
    @transactions_data = transactions_data
  end

  def starting_balance
    balance = 0
    CSV.foreach(balance_data, headers: true, header_converters: :symbol) do |row|
      if row[:account] == name
        balance = row[:balance]
      end
    end
    balance.to_f
  end

  def transaction
    transaction = []
    CSV.foreach(transactions_data, headers: true, header_converters: :symbol) do |row|
      if row[:account] == name
        transaction << Transaction.new(row[:amount], row[:date], row[:description])
      end
    end
    transaction
  end

  def current_balance
    balance = starting_balance
    transaction.each do |transactions|
      balance += transactions.amount
    end
    balance
  end

  def summary
    summaries = []
    transaction.each do |transaction|
      summaries << transaction.summary
    end
    summaries
  end
end

acct = Account.new("Business Checking", 'balances.csv', 'bank_data.csv')

# ==== Purchasing Account ====
# Starting Balance: $201.94
# Ending Balance:   $637.09

####################DONE########################
# $29.99   WITHDRAWAL  09/12/2013 - Amazon.com
# $500.33  DEPOSIT     09/14/2013 - Sales Deposit
# $35.19   WITHDRAWAL  09/15/2013 - Staples.com
################## ======== ####################

# ==== Business Checking ====
# Starting Balance: $594.19
# Ending Balance:   $923.94

# $60.19   WITHDRAWAL  09/12/2013 - Pizza Pizza
# $400.20  WITHDRAWAL  09/14/2013 - Payroll
# $790.14  DEPOSIT     09/15/2013 - Sales Deposit
# ========
