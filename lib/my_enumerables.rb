module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    for item in self
      yield item, i
      i += 1
    end
  end

  def my_select
    result = []
    my_each { |e| result << e if yield e }
    result
  end

  def my_all?
    my_each { |e| return false unless yield e }
    true
  end

  def my_any?
    my_each { |e| return true if yield e}
    false
  end

  def my_none?
    my_each { |e| return false if yield e }
    true
  end

  def my_count
    return length unless block_given?
    result = []
    my_each { |e| result << e if yield e }
    result.length
  end

  def my_map
    result = []
    my_lambda = block_given? ? lambda { |e| yield(e) } : lambda { |e| block.call(e) }
    my_each { |e| result << my_lambda.call(e) }
    result
  end

  def my_inject(initial_value)
    my_each { |e| initial_value = yield(initial_value, e) }
    initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield item
    end
  end
end
