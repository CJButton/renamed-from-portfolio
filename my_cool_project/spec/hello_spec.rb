require 'rspec'
require 'hello'

descrbie '#hello_world' do
  it "returns 'Hello, World!'" do
    expect(hello_world).to_eq("Hello, World!")
  end
end

# Pending Specs
# We can write out a bunch of descriptions before actually passing them
# any specs.
# We do this by leaving of do...end and it
describe '#valid_move?' do
  it 'should return false for wrong colored pieces'
  it 'should return false for moves that are off the board'
  it 'should return false for moves that put you in check'
end

# Don't use != in RSPEC!!! Instead we can use
#   exepect(actual).to eq expected

# This
expect(my_hash.has_key?(my_key)).to eq(true)

# is the same as this:
expect(my_hash).to have_key(my_key)
