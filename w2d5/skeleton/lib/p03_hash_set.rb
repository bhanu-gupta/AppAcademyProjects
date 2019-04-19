class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def insert(key)
    unless self.include?(key)
      self[key] << key
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

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  def include?(key)
    self[key].each do |ele|
      return true if ele == key
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
      new_num_bucket = 2*num_buckets
      new_arr = Array.new(new_num_bucket){[]}
      @store.each do |sub_arr|
        sub_arr.each do |ele|
          new_arr[ele.hash % new_num_bucket] << ele
        end
      end
      @store = new_arr

  end
end
