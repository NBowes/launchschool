def bubble_sort!(arr)
  length = arr.length
  loop do
    swap = false
      1.upto(arr.length - 1) do |num|
        next if arr[num - 1] <= arr[num]
        arr[num - 1], arr[num] = arr[num], arr[num - 1]
        swap = true
    end
    length -= 1
  break unless swap

  end
  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]
