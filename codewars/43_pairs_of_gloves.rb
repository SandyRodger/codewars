=begin 

Pair of gloves
Winter is coming, you must prepare your ski holidays. The objective of this kata is to determine the number of pairs of gloves you can constitute from the gloves you have in your drawer.

Given an array describing the color of each glove, return the number of pairs you can constitute, assuming that only gloves of the same color can form pairs.

Examples:
input = ["red", "green", "red", "blue", "blue"]
result = 2 (1 red pair + 1 blue pair)

input = ["red", "red", "red", "red", "red", "red"]
result = 3 (3 red pairs)

P: Write a method which takes an array of strings. Each string will be a colour. Return the number of pairs of identical strings in the input_array.

E:

input = ["red", "green", "red", "blue", "blue"]
result = 2 (1 red pair + 1 blue pair)

input = ["red", "red", "red", "red", "red", "red"]
result = 3 (3 red pairs)

number_of_pairs(["red","red"]) == 1
number_of_pairs(["red","green","blue"]) == 0
number_of_pairs(["gray","black","purple","purple","gray","black"]) == 3
number_of_pairs([]) == 0
number_of_pairs(["red","green","blue","blue","red","green","red","red","red"]) == 4

D:
Input: array of stings
output: an int.

A:

- initialize num_of_pairs as 0
- Create a hash containing keys of the colours and values of the number of those strings in the input_arr. (gloves_hash)
- iterate over gloves_hash looking at the values
- if the value is more than 1 then divide that number by 2 and add it to num_of_pairs
- return num_of_pairs

C:
=end

def number_of_pairs(array)
 num_of_pairs = 0
 gloves_hash = array.each_with_object({}) do |glove, hash|
  hash [glove] = array.count(glove) if !hash.include?(glove)
 end
 gloves_hash.each do |_, v|
  if v > 1
    num_of_pairs += v/2
  end
 end
 num_of_pairs
end

p number_of_pairs(["red","red"]) == 1
p number_of_pairs(["red","green","blue"]) == 0
p number_of_pairs(["gray","black","purple","purple","gray","black"]) == 3
p number_of_pairs([]) == 0
p number_of_pairs(["red","green","blue","blue","red","green","red","red","red"]) == 4
