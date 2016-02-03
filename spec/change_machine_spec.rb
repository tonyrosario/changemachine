require "spec_helper"

describe ChangeMachine do
  describe "#make_change" do
    context "dollars only" do

      it "returns a Hash of 0 " do
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
      it "returns [0,0,0,0] for 0" do
        expect(subject.make_change(0)).to eq([0,0,0,0,0,0,0,0])
      end

      it "returns an array of [0,0,0,0,0,0,0,1] for 1 cent" do
        expect(subject.make_change(1)).to eq([0,0,0,0,0,0,0,1])
      end

      it "returns an array of [0,0,0,0,0,0,0,4] for 4 cents" do
        expect(subject.make_change(4)).to eq([0,0,0,0,0,0,0,4])
      end

      it "returns an array of [0,0,0,0,0,0,1,0] for 5 cents" do
        expect(subject.make_change(5)).to eq([0,0,0,0,0,0,1,0])
      end

      it "returns an array of [0,0,0,0,2,0,0,0] for 50 cents" do
        expect(subject.make_change(50)).to eq([0,0,0,0,2,0,0,0])
      end
    end

    context "dollars and coins" do
      it "returns 7 dollars and 99 cents for 799" do
        expect(subject.make_change(799)).to eq([0,0,1,2,3,2,0,4])
      end

      it "returns 10 dollars and 99 cents for 799" do
        expect(subject.make_change(1099)).to eq([0,1,0,0,3,2,0,4])
      end
    end
  end
end
