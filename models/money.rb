class Money
  def initialize(amount=0, currency="USD")
    initialize_amount(amount)

    @currency = currency
  end

  def amount
    @amount / 100.0
  end

  def currency
    @currency
  end

  private

  def initialize_amount(amount)
    if amount.is_a? Integer
      @amount = amount
    else
      @amount = 0
    end
  end
end
