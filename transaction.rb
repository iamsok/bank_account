class Transaction
  attr_accessor :amount, :credit_debit, :date, :source

  def initialize(amount, credit_debit, date, source)
    @amount = amount.to_f
    @credit_debit = credit_debit
    @date = date
    @source = source
  end

  def deposit?
    credit_debit.downcase == 'deposit'
  end

  def summary
    "$#{amount}   #{credit_debit}   #{date}  -  #{source}"
  end

end

trans = Transaction.new(100, "deposit", "1/1/2011", "Launch Academy")
puts trans.summary
