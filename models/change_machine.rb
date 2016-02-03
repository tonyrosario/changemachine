class ChangeMachine
  def make_change(amount=0)
    @amount = amount
    cents = get_cents

    dollars = get_dollars
    result = process_dollars(dollars) + process_coins(cents)

    return result

  end

  def process_coins(amount)
    coins = []
    [25, 10, 5, 1].each do |coin|
      num_of_coins = amount / coin
      amount -= num_of_coins * coin
      coins << num_of_coins
    end
    coins
  end

  def process_dollars(amount)
    bills = []
    [20, 10, 5, 1].each do |bill|
      num_of_bills = amount / bill
      amount -= num_of_bills * bill
      bills << num_of_bills
  end
    bills
  end

  private

  def get_dollars
    if @amount >= 100
      return @amount / 100
    end

    return 0
  end

  def get_cents
      @amount % 100
  end
end
