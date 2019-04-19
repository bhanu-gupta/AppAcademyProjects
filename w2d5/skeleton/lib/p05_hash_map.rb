require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    list = bucket(key)
    list.include?(key)
  end

  def set(key, val)
    list = bucket(key)
    if list.include?(key)
      list.update(key, val)
    else
      list.append(key, val)
      @count += 1
      n = @count
      k = @store.length
      if n==k
        resize!
      end
    end
  end

  def get(key)
    list = bucket(key)
    if list.include?(key)
      list.get(key)
    end
  end

  def delete(key)
    list = bucket(key)
    if list.include?(key)
      list.remove(key)
      @count -= 1
    end
  end

  def each(&prc)
    @store.each do |linked_list|
      linked_list.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

   def resize!
      new_num_bucket = 2*num_buckets
      new_arr = Array.new(new_num_bucket){LinkedList.new}
      @store.each do |linkedlist|
        linkedlist.each do |node|
          new_arr[node.key.hash % new_num_bucket].append(node.key, node.val)
        end
      end
      @store = new_arr
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  #   @store[num.hash % num_buckets]
  # end
end
