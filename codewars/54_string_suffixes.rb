=begin

https://www.codewars.com/kata/559d34cb2e65e765b90000f0/train/ruby

Let's say take 2 strings, A and B, and define the similarity of the strings to be the length of the longest prefix common to both strings. For example, the similarity of strings abc and abd is 2, while the similarity of strings aaa and aaab is 3.

write a function that calculates the sum of similarities of a string S with each of it's suffixes.

Examples (input -> output):
'ababaa' -> 11
'abc' -> 3
Explanation:

In the first case, the suffixes of the string are ababaa, babaa, abaa, baa, aa and a. The similarities of each of these strings with the string ababaa are 6,0,3,0,1,1 respectively. Thus the answer is 6 + 0 + 3 + 0 + 1 + 1 = 11.

For the second case, the answer is simply 3 + 0 + 0 = 3.

Note : Each string will have at least one character - no need to check for empty strings :)

P: Write a method which takes a string and returns an integer. The integer is the result of a series of calculations They are as follows. #1 find substrings # Compare each substring to the original string # If there is a prefix with the same letter(s) then count the length of that prefix and add it to the output integer.

E:

string_suffix('aa') #== 3 +> when they write 'suffix', they must mean substring.
# string_suffix('abc') == 3
# string_suffix('ababaa') == 11

D:
Input: a string of lowercase chars. (never empty)
output: an integer
- find all substrings

A:

HELPER METHOD 1: find_all_substrings
- write find_all substrings helper method
- iterate from 0 to one below string size to get first index
- iterate from 0 to first index to get second index
- collect the strings from first index to second index.

HELPER METHOD 2: count_prefix (original_str, substring)
- find shorter word
- initialize results array
- iterate through the shorter word with an index (char, idx)
- if both strings at that index are the same then collect it's size in results_array
- return results array.size

- iterate through all_substrings comparing them to input_string
- add the result of this comparision to an output_int

C:

Time: 37 mins

=end

def find_substrings(str)
	(0...str.size).each_with_object([]) do |idx1, arr|
		arr << str[idx1...str.size]
	end
end

def count_prefix(og_str, substr)
	shorter = [og_str, substr].min
	prefix_size = 0
	shorter.chars.each_index do |idx|
		if og_str[idx] == substr[idx]
			prefix_size +=1
		elsif og_str[idx] != substr[idx]
			return prefix_size
		end
	end
	prefix_size
end


def string_suffix(str)
  all_substrings = find_substrings(str)
	count = 0
	all_substrings.each do |substr|
		count += count_prefix(str, substr)
	end
	count
end

p string_suffix('aa') == 3
p string_suffix('abc') == 3
p string_suffix('ababaa') == 11