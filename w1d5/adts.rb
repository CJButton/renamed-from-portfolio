

# ADTS


class Stack
  attr_reader :stack
  def initialize
    @stack = []
  end

  def add(el)
    stack << el
  end

  def remove
    stack.shift
  end

  def show
    @stack
  end

end

class Queue
  attr_reader :queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    queue << el
  end

  def dequeue
    queue.pop
  end

  def show
    @queue
  end
end

class Map
  attr_accessor :map
  def initialize
    @map = [["k1", "v1"], ["k2", "v2"]]
  end

  # works
  def has_key?(key)
    map.each do |subarray|
      return true if subarray.include?(key)
    end
    false
  end

  def assign(key, value)
    if has_key?(key)
      pos = lookup(key)
      map[pos][1] = value
    else
      map << [key, value]
    end
  end

  # works
  def lookup(key)
    map.each_with_index do |subarray, i|
      return i if subarray.include?(key)
    end
  end

  def remove(key)
    pos = lookup(key)
    map.delete_at(pos)
  end

  def show
    @map
  end

end
