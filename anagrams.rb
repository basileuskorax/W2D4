require 'byebug'

def first_anagram?(word1, word2)
  # anagrams = []
  arr = word1.chars
  anagr = arr.permutation(arr.length).to_a
  result = anagr.map {|el| el.join}
  result.any? {|el| el == word2}
end

def second_anagram?(word1, word2)
  arr1 = word1.chars
  arr2 = word2.chars
  until arr1.none? {|el| arr2.include?(el)}
    arr1.each_with_index do |x, i|
      arr2.each_with_index do |y, j|
        if x == y
          arr1.delete_at(i)
          arr2.delete_at(j)
        end
      end
    end
  end
  arr1.empty? && arr2.empty?
end

def third_anagram?(word1, word2)
  arr1 = word1.chars
  arr2 = word2.chars
  arr1.sort == arr2.sort
end

def fourth_anagram?(word1, word2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  word1.each_char do |char|
    hash1[char] += 1
  end
  word2.each_char do |char|
    hash2[char] += 1
  end
  hash1.keys.each do |char|
    return false if hash1[char] != hash2[char]
  end
  return true
end
