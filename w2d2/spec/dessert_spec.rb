require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
 Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:brownie) { Dessert.new('quantity', 100)}
  # After creating the object of 'Brownie', we can now access the instance
  # variables in the object

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end
    # As seen here, the brownie.type is accessable to us

    it "sets a quantity"
      expect(brownie.quantity).to eq(100)
    end
    # as is brownie.quantity

    it "starts ingredients as an empty array"
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("chocolate")
      expect(brownie.ingredients).to include("chocolate")
    end
  end
  # We can also call the instance methods associated with the object
  # e.g. brownie.add_ingredient("chocolate")

  describe "#mix!" do
    it "shuffles the ingredient array"
      # we create a list of ingredients to give to test with
      # the user doesn't neccessarily have these exact copies

      ingredients = ["choclate", "flour", "egg", "sugar", "butter"]

      # we then call the object and the instance method and add them
      # much like we would in a normal method
      ingredients.each do |ingredient|
        brownie.add_ingredient(ingredient)
      end

      # notice we have access to the instance variables here @ingredients
      expect(brownie.ingredients).to eq(ingredients)
      brownie.mix!
      # we call the #mix! on the brownie object
      expect(brownie.ingredients).not_to eq(ingredients)
      expect(brownie.ingredients).to eq(ingredients.sort)
    end
  end

  # try giving quantity and amount preset numbers, and then seeing if we can
  describe "#eat" do
    it "subtracts an amount from the quantity"
    # we call the #eat instance methd on the brownie object
    # and if the method runs correctly, there should be only 80 left!
      brownie.eat(20)
      expect(brownie.quantity).to eq(80)
    end

      # same for this one I think
      it "raises an error if the amount is greater than the quantity"
        expect { brownie.eat(120)}.to raise_error("not enough left!")
    end
  end
end
