require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
 Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:brownie) { Dessert.new("brownie", 100) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity"
      expect(quantity).not_to eq(nil)
    end

    it "starts ingredients as an empty array"
      expect(ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
      expect(ingredients).not_to eq([])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
      expect(ingredients).to receive(:shuffle!)
    end
  end

  # try giving quantity and amount preset numbers, and then seeing if we can
  # test like that.
  describe "#eat" do
    it "subtracts an amount from the quantity"


    # same for this one I think
    it "raises an error if the amount is greater than the quantity"
  end
end
