=begin
Problem
Write a function that will return the count of distinct case-insensitive alphabetic characters and chareric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and chareric digits.

Examples
duplicates("abcde") == 0
duplicates("aabbcde") == 2
duplicates("aabBcde") == 2 
duplicates("indivisibility") == 1
duplicates("Indivisibilities") == 2
duplicates("aA11") == 2 
duplicates("ABBA") == 2 

P: Write a method that takes a string and returns an integer. The integer will represent how many chars in input_str occur more than once. (Case insensitive, only chars and chars)

E:

duplicates("abcde") == 0 => 0 is valid output
duplicates("aabbcde") == 2 => standard.
duplicates("aabBcde") == 2  => caps are considered same as lower case
duplicates("indivisibility") == 1 i occurs 5 times, but returns only 1 because only 1 letter is duplicated
duplicates("Indivisibilities") == 2 => s and i occur more than once
duplicates("aA11") == 2  => integers are considered when counting dups
duplicates("ABBA") == 2 => chars needn't be adjacent to be counted as duplicates.

D:

input: string or ints/chars (no punctuation/white space)
output: an integer >= 0

A:

- Initialize a constant for the numbers ( 0 - 9) NUMS
0. initialize a dup_array = []
1. turn the input_str into an Array #chars
1.5. If the char is a included in NUMS then skip the downcase step.
2. put all the letters into a new Array (while downcasing them) - #each_with_object([])
3. if that letter is already in the new_array but is not in the duplicate_array then shovel it into the dup_array
4. return thecount of the dup_array


C:
=end

NUMS = ("0".."9").to_a

def duplicates(str)
  dup_arr = []
  str.chars.each_with_object([]) do |char, array|
    if  NUMS.include?(char)
      if array.include?(char) && !dup_arr.include?(char)
        dup_arr << char
      end
      array << char
    elsif array.include?(char.downcase) && !dup_arr.include?(char.downcase)
      dup_arr << char.downcase
    end
    array << char.downcase
  end
  dup_arr.count
end

p duplicates("abcde") == 0
p duplicates("aabbcde") == 2
p duplicates("aabBcde") == 2 
p duplicates("indivisibility") == 1
p duplicates("Indivisibilities") == 2
p duplicates("aA11") == 2 
p duplicates("ABBA") == 2 