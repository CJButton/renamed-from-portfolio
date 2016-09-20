class Board
  attr_accessor :cups

  # lets try to upload to git again
  # let's try onece more
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    cups.each_with_index do |cup, i|
      4.times do |stone|
        cup << :stone unless i == 6 || i == 13
      end
    end

    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos == 15 || start_pos == 0
  end

  def make_move(start_pos, current_player_name)
    total = cups[start_pos].length
    cups[start_pos] = []

    # currently player two is going
    #p current_player_name #home cup is 13
    #p @name2
    # @name1 home cup is 6
    all_cups = (start_pos + 1..(total + start_pos)).to_a
    rounded = all_cups.map {|el| el % 13}

    rounded.each do |cup_i|
      cups[cup_i] << :stone
    end
    make_move(rounded.last, current_player_name) if cups[rounded.last].empty?
    #render
    next_turn(rounded.last)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
  end

  def winner
  end
end
