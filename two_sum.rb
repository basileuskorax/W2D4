require 'byebug'

def two_sum?(arr, tgt)
  (0...arr.length-2).each do |i|
    (i+1..arr.length-1).each do |j|
      return true if (arr[i] + arr[j]) == tgt
    end
  end
  return false
end

def okay_two_sum?(arr, tgt)
  sorted = arr.sort


  sorted.each_with_index do |x, i|
    debugger
    bsearched = sorted.bsearch_index {|y| y + x == tgt}
    return true unless bsearched == i || bsearched.nil?
  end

  return false
end
