require "byebug"

def my_min1(arr)
  smallest = nil

  arr[0...-1].each_index do |i|
    arr[(i + 1)..-1].each_index do |j|
      current_smallest = arr[i] < arr[j] ? arr[i] : arr[j]
      smallest = current_smallest if smallest.nil? || current_smallest < smallest
    end
  end

  smallest

end

def my_min2(arr)
  smallest = nil
  arr.each do |el|
    smallest = el if smallest.nil? || smallest > el
  end
  smallest
end

def lcs1(arr)
  subarrays = []
  arr[0..-1].each_index do |i|
    arr[0..-1].each_index do |j|
      subarrays << arr[i..j]
    end
  end
  # return subarrays
  sums_array = []
  subarrays.each do |el|
    sums_array << el.reduce(:+) unless el.empty?
  end
  sums_array.max
end

def lcs2(arr)
  largest_sum = 0
  current_sum = arr[0]

  arr.each_index do |i|
    curr = arr[i]
    seq = arr[i + 1]
    last = arr[-1]
    break if curr == last
    current_sum += seq
    if curr + seq > largest_sum
      largest_sum = curr + seq
    elsif seq < 0
      current_sum = 0
    end


  end
  return largest_sum
end

def lcs2(arr)
  return arr.max if arr.all? {|el| el < 0}

  largest_sum = arr[0]
  current_sum = arr[0]
  (1..arr.length-1).each do |i|
    current_sum = 0 if current_sum < 0
    current_el = arr[i]
    current_sum = current_sum + current_el
    largest_sum = current_sum if current_sum > largest_sum
    #break if i == arr.length-2
  end
  largest_sum
end

list = [2, 3, -6, 7, -6, 7]
list2 = [-5, -1, -3]
list3 = [-2, -4, 5, -1, 7, -3, 8]

p lcs2(list)
p lcs2(list2)
p lcs2(list3)
