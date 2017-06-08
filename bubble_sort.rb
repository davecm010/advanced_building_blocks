def bubble_sort(array)
  for i in 0..array.length-1
    for i in 0..array.length-1
      unless i == array.length-1
        if array[i] > array[i+1]
          array[i],array[i+1] = array[i+1], array[i]
        else
          next
        end
      end
    end
  end
  array
end


def bubble_sort_by(array)
  for i in 0..(array.length-1)
    for i in 0..(array.length-1)
      unless i == array.length-1
        if yield(array[i], array[i+1]) > 0
          array[i],array[i+1] = array[i+1], array[i]
        else
          next
        end
      end
    end
  end
  array
end

p "[4, 3, 78, 2, 0, 2] sorted: #{bubble_sort([4,3,78,2,0,2])}"

p bubble_sort_by(["hi", "how's it going?", "hello", "hey",]) {|left, right| left.length - right.length}
p bubble_sort_by([4,3,78,2,0,2]) {|left, right| left - right}
