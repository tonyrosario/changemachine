require "spec_helper"

describe ChangeMachine do
  describe "#make_change" do
    context "dollars only" do
      it "returns [0,0,0,0] for 0" do
        expect(subject.make_change(0)).to eq([0,0,0,0,0,0,0,0])
      end

      it "returns an array of [0,0,0,1] for 1 dollar" do
        expect(subject.make_change(100)).to eq([0,0,0,1,0,0,0,0])
      end

      it "returns an array of [0,0,0,4] for 4 dollars" do
        expect(subject.make_change(400)).to eq([0,0,0,4,0,0,0,0])
      end

      it "returns an array of [0,0,1,0] for 5 dollars" do
        expect(subject.make_change(500)).to eq([0,0,1,0,0,0,0,0])
      end

      it "returns an array of [0,1,0,0] for 10 dollars" do
        expect(subject.make_change(1000)).to eq([0,1,0,0,0,0,0,0])
      end

      it "returns an array of [1,0,0,0] for 20 dollars" do
        expect(subject.make_change(2000)).to eq([1,0,0,0,0,0,0,0])
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
