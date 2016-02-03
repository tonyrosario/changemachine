require "spec_helper"

describe ChangeMachine do
  describe "#make_change" do
    context "dollars only" do

      it "returns all zeros for each bill for 0" do
        expected_change = { twenties: 0, tens: 0, fives: 0, ones: 0, quarters: 0, dimes: 0, nickels: 0, pennies: 0 }
        expect(subject.make_change(0)).to eq(expected_change)
      end

      it "returns a Hash with 1 dollar bill" do
        expected_change = { twenties: 0, tens: 0, fives: 0, ones: 1, quarters: 0, dimes: 0, nickels: 0, pennies: 0 }
        expect(subject.make_change(100)).to eq(expected_change)
      end

      it "returns a Hash with 4 ones" do
        expected_change = { twenties: 0, tens: 0, fives: 0, ones: 4, quarters: 0, dimes: 0, nickels: 0, pennies: 0 }
        expect(subject.make_change(400)).to eq(expected_change)
      end

      it "returns a Hash with 1 five" do
        expected_change = { twenties: 0, tens: 0, fives: 1, ones: 0, quarters: 0, dimes: 0, nickels: 0, pennies: 0 }
        expect(subject.make_change(500)).to eq(expected_change)
      end

      it "returns a Hash with a 10 dollar bill" do
        expected_change = { twenties: 0, tens: 1, fives: 0, ones: 0, quarters: 0, dimes: 0, nickels: 0, pennies: 0 }
        expect(subject.make_change(1000)).to eq(expected_change)
      end

      it "returns a Hash with a 20 dollar bill" do
        expected_change = { twenties: 1, tens: 0, fives: 0, ones: 0, quarters: 0, dimes: 0, nickels: 0, pennies: 0 }
        expect(subject.make_change(2000)).to eq(expected_change)
      end
    end

    context "coins only" do
      it "returns all zeros for each coin for 0" do
        expected_change = { twenties: 0, tens: 0, fives: 0, ones: 0, quarters: 0, dimes: 0, nickels: 0, pennies: 0 }
        expect(subject.make_change(0)).to eq(expected_change)
      end

      it "returns a Hash with 1 penny for 1" do
        expected_change = { twenties: 0, tens: 0, fives: 0, ones: 0, quarters: 0, dimes: 0, nickels: 0, pennies: 1 }
        expect(subject.make_change(1)).to eq(expected_change)
      end

      it "returns a Hash with 4 pennies for 4" do
        expected_change = { twenties: 0, tens: 0, fives: 0, ones: 0, quarters: 0, dimes: 0, nickels: 0, pennies: 4 }
        expect(subject.make_change(4)).to eq(expected_change)
      end

      it "returns a Hash with 1 nickel for 5" do
        expected_change = { twenties: 0, tens: 0, fives: 0, ones: 0, quarters: 0, dimes: 0, nickels: 1, pennies: 0 }
        expect(subject.make_change(5)).to eq(expected_change)
      end

      it "returns a Hash with 2 quarters for 50" do
        expected_change = { twenties: 0, tens: 0, fives: 0, ones: 0, quarters: 2, dimes: 0, nickels: 0, pennies: 0 }
        expect(subject.make_change(50)).to eq(expected_change)
      end
    end

    context "dollars and coins" do
      it "returns 1 five, 2 dollars, 3 quarters, 2 dimes, and 4 pennies for 799" do
        expected_change = { twenties: 0, tens: 0, fives: 1, ones: 2, quarters: 3, dimes: 2, nickels: 0, pennies: 4 }
        expect(subject.make_change(799)).to eq(expected_change)
      end

      it "returns 1 ten, 1 five, 4 dollars, 2 quarters, 1 dimes, 1 nickel, and 4 pennies for 1969" do
        expected_change = { twenties: 0, tens: 1, fives: 1, ones: 4, quarters: 2, dimes: 1, nickels: 1, pennies: 4 }
        expect(subject.make_change(1969)).to eq(expected_change)
      end
    end
  end
end
