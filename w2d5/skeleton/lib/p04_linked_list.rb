require "byebug"
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev
  
  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = self.next
    @next.prev = self.prev
  end
end

class LinkedList
  include Enumerable
  
  def initialize
    # debugger
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next unless empty?
  end

  def last
    @tail.prev unless empty?
  end

  def empty?
    return true if @head.next == @tail && @tail.prev == @head
    false
  end

  def get(key)
    self.each {|node| return node.val if key == node.key}
  end

  def include?(key)
    self.each {|node| return true if key == node.key}
    false
  end

  def append(key, val)
    banana = Node.new(key, val)

    banana.next = @tail
    banana.prev = @tail.prev
    @tail.prev.next = banana
    @tail.prev = banana
  end

  def update(key, val)
      self.each {|node| node.val = val if key == node.key}
  end

  def remove(key)
    self.each do |banana|
      if key == banana.key
        banana.prev.next = banana.next
        banana.next.prev = banana.prev
      end
    end
    # banana.next = @tail
    # banana.prev = @tail.prev
    # @tail.prev.next = banana
    # @tail.prev = banana
  end

  def each(&prc)
    current_node = @head.next
    while (current_node.next != nil)
        prc.call(current_node)
       current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
