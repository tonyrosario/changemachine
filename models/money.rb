class Money
  def initialize(amount=0)
    @amount = amount
  end

  def amount
    @amount / 100.0
  end

  def currency
    "USD"
  end
end
