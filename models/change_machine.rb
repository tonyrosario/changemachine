class ChangeMachine
  def make_change(amount=0)
    @amount = amount
    cents = get_cents

    dollars = get_dollars
    @result = new_result_hash

    process_dollars(dollars)
    process_coins(cents)

    return @result

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
    dollar_values.keys.each do |bill|
      num_of_bills = amount / bill
      amount -= num_of_bills * bill
      @result[dollar_values[bill]] = num_of_bills
    end
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

  def new_result_hash
    Hash[:twenties, 0, :tens, 0, :fives, 0, :ones, 0, :quarters, 0, :dimes, 0, :nickels, 0, :pennies, 0]
  end

  def coin_values
    { 25 => :quarters, 10 => :dimes, 5 => :nickels, 1 => :pennies }
  end

  def dollar_values
    { 20 => :twenties, 10 => :tens, 5 => :fives, 1 => :ones }
  end
end
