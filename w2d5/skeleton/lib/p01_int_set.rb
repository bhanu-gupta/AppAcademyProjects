require "byebug"
class MaxIntSet
  def initialize(max)
    @store = Array.new(max + 1, false)
  end

  def insert(num)
    if is_valid?(num) && @store[num] == false
      @store[num] = true
    else
      raise "cannot insert"
    end
  end

  def remove(num)
    if is_valid?(num) && @store[num] == true
      @store[num] = false
    else
      raise "cannot remove"
    end
  end

  def include?(num)
    if is_valid?(num) && @store[num] == true
      return true
    end
    false
  end

  private

  def is_valid?(num)
    unless num < @store.length && num >= 0
      raise "Out of bounds"
    end
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    unless self.include?(num)
      self[num] << num
      return true
    else
      false
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].each do |ele|
      return true if ele == num
    end
    false
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self.include?(num)
      self[num] << num
      @count += 1
      n = @count
      k = @store.length
      if n==k
        resize!
      end
      return true
    else
      false
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].each do |ele|
      return true if ele == num
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
      new_num_bucket = 2*num_buckets
      new_arr = Array.new(new_num_bucket){[]}
      @store.each do |sub_arr|
        sub_arr.each do |ele|
          new_arr[ele % new_num_bucket] << ele
        end
      end
      @store = new_arr

  end

end
