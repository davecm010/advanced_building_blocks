module Enumerable

  def my_each
    for i in 0..self.length-1
      yield(self[i])
    end
  end

  def my_each_with_index
    for i in 0..self.length-1
      yield(self[i], i)
    end
  end

  def my_select
    array = []
    for i in 0..self.length-1
      if yield(self[i])
        array.push(self[i])
      end
    end
    array
  end

  def my_all?
    for i in 0..self.length-1
      if yield(self[i]) == false
        return false
      end
    end
    return true
  end

  def my_any?
    for i in 0..self.length-1
      if yield(self[i]) == true
        return true
      end
    end
    return false
  end

  def my_none?
    for i in 0..self.length-1
      if yield(self[i]) == true
        return false
      end
    end
    return true
  end

  def my_count(x = nil)
    count = 0
    if self.is_a? String
      arr = self.split("")
    else
      arr = self
    end
    if x
      for i in 0..arr.length-1
        if arr[i] == x
          count += 1
        end
      end
    elsif block_given?
      for i in 0..arr.length-1
        if yield(arr[i])
          count += 1
        end
      end
    end
    count
  end

  def my_map(&proc)
    result = []
    for i in 0..self.length-1
      if proc
        result << proc.call(self[i])
      else
        result << yield(self[i])
      end
    end
    result
  end

  def my_inject(x = nil)
    if x
      result = x
    else
      result = 0
    end
    if self.is_a? Range
      arr = self.to_a
    else
      arr = self
    end
    for i in 0..arr.length-1
      result = yield(result, arr[i])
    end
    result
  end

end

[1,2,3,4,5].my_each {|x| puts x}

[1,'a',3,'b',5].my_each_with_index {|x,y| puts "#{x}:#{y}"}

[1,2,3,4,5].my_select {|x| x % 2 == 0}

puts [1,'a',3,'b',5].my_all? {|x| x.is_a? Integer}
puts [1,2,3,4,5].my_all? {|x| x.is_a? Integer}

puts [1,'a',3,'b',5].my_any? {|x| x.is_a? Integer}
puts ['a','b','c'].my_any? {|x| x.is_a? Integer}

puts [1,'a',3,'b',5].my_none? {|x| x.is_a? Integer}
puts ['a','b','c'].my_none? {|x| x.is_a? Integer}

puts [1,'a',3,'b',5, 1, 'a'].my_count('a')
puts [1,2,3,4,5,6,7,8].my_count {|x| x > 3}

cole_proc = Proc.new {|x| "#{x * 3} Cole!"}

puts ['Hollywood', 'J.', 'Jermaine'].my_map(&cole_proc)
puts ['Hollywood', 'J.', 'Jermaine'].my_map {|x| "#{x} Cole!"}

puts [5,6,7,8,9,10].my_inject { |sum, n| sum + n}
puts (5..10).my_inject(1) { |product, n| product * n}
