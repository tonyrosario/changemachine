require "spec_helper"

describe Money do
  describe "#amount"  do
    it "returns 0.00 when not initialized with a value" do
      money = Money.new
      expect(money.amount).to eq(0.00)
    end

    context "less than a dollar" do
      it "returns 1 cent" do
        money = Money.new(1)
        expect(money.amount).to eq(0.01)
      end

      it "returns 10 cents" do
        money = Money.new(10)
        expect(money.amount).to eq(0.10)
      end

      it "returns 99 cents" do
        money = Money.new(99)
        expect(money.amount).to eq(0.99)
      end
    end

    context "equal to one dollar" do
      it "returns 1.00" do
        money = Money.new(100)
        expect(money.amount).to eq(1.00)
      end
    end

    context "more than a dollar" do
      it "displays dollars and cents" do
        money = Money.new(1337)
        expect(money.amount).to eq(13.37)
      end
    end
  end

  describe "#currency" do
    it "returns USD as default" do
      money = Money.new
      expect(money.currency).to eq("USD")
    end
  end
end
