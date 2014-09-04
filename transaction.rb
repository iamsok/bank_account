class Transaction
  attr_reader :amount, :date, :description

  def initialize(amount, date, description)
    @amount = amount.to_f
    @date = date
    @description = description
  end

  def deposit?
    amount > 0
  end

  def type
    if deposit?
      "DEPOSIT"
    else
      "WITHDRAWAL"
    end
  end

  def summary
    "$#{amount.abs}   #{type}   #{date}  -  #{description}"
  end

end
