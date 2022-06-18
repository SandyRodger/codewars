=begin

6 kyu

#Find the missing letter

Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

You will always get a valid array. And it will be always have exactly one letter be missing. The length of the array will always be at least 2.
The array will always contain letters in only one case.

Example:

['a','b','c','d','f'] -> 'e' ['O','Q','R','S'] -> 'P'

["a","b","c","d","f"] -> "e"
["O","Q","R","S"] -> "P"
(Use the English alphabet with 26 letters!)

P: Write a method that takes an array of single chars. The chars represent a section of the alphabet (upper or lowercase) with one char missing. Return the missing char in the corresponding case.

E:

['a','b','c','d','f'] -> 'e' => standard
 ['O','Q','R','S'] -> 'P' => caps must be consistent
["a","b","c","d","f"] -> "e"
["O","Q","R","S"] -> "P"

D:
Input: array of single char strings
Output: single char string

A:
1. create a constant for uppercase alphabet
2. same for lowercase 
3. if first element is included in uppercase abc assign it to LV alphabet, otherwise assign it to lowercase abc

4. save the index of the first char of the array when found in alphabet, as 'previous_idx'
4. iterate over input_arr.
5. for each char (starting with 2nd char) look at the index of that char in alphabet.
6. If char is not previous index plus 1 then return char.

C:
Time: 35 mins
=end
UPPER_ABC = ('A'..'Z').to_a
LOWER_ABC = ('a'..'z').to_a


def find_missing_letter(arr)
  if UPPER_ABC.include?(arr[0])
		alphabet = UPPER_ABC
	else
		alphabet = LOWER_ABC
	end
	prev_idx = alphabet.index(arr[0])
	arr.each do |char|
		if char == arr[0]
			next
		elsif prev_idx == alphabet.index(char)-1
			prev_idx += 1
		else
			return alphabet[prev_idx+1]
		end
	end
end

# COdewars super solution:

# def find_missing_letter(arr)
#   ((arr.first..arr.last).to_a - arr).first
# end

p find_missing_letter(["a","b","c","d","f"])  == "e"
p find_missing_letter(["O","Q","R","S"]) == "P"
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"

