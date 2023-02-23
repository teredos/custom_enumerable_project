module Enumerable
  def my_each_with_index
    length.times { |i| yield(self[i], i) }
    self
  end

  def my_select
    new_arr = []
    length.times { |i| new_arr << self[i] if yield(self[i]) }
    new_arr
  end

  def my_all?
    true_arr = []
    length.times { |i| true_arr << self[i] if yield(self[i]) }
    true_arr.length == length
  end

  def my_any?
    true_arr = []
    length.times { |i| true_arr << self[i] if yield(self[i]) }
    true_arr.length.positive?
  end

  def my_none?
    true_arr = []
    length.times { |i| true_arr << self[i] if yield(self[i]) }
    true_arr.empty?
  end

  def my_count
    return length unless block_given?

    new_arr = []
    length.times { |i| new_arr << self[i] if yield(self[i]) }
    new_arr.length
  end

  def my_map
    new_arr = []
    length.times { |i| new_arr << yield(self[i]) }
    new_arr
  end

  def my_inject(*args)
    if args[0].is_a?(Symbol)
      sum = self[0]
      (length - 1).times { |i| sum = sum.send(args[0], self[i + 1]) }
      sum
    elsif args[1].is_a?(Symbol)
      sum = args[0]
      length.times { |i| sum = sum.send(args[1], self[i]) }
      sum
    elsif args[0].is_a?(Integer)
      sum = args[0]
      length.times { |i| sum = yield(sum, self[i]) }
      sum
    elsif args.empty?
      sum = self[0]
      (length - 1).times { |i| sum = yield(sum, self[i + 1]) }
      sum
    end
  end
end

class Array
  def my_each
    length.times { |i| yield(self[i]) }
    self
  end
end
