=begin

6 kyu
Which are in?

https://www.codewars.com/kata/550554fd08b86f84fe000a58

Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

Example 1:
a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

Example 2:
a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []

Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
Beware: r must be without duplicates.

P: Write a method that takes two arrays of strings and returns a filtered array of the words in arr_1 that are substrings of a word in arr_2 (without dups)

E:

in_array(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]

Questions: 

do substrings have to retain the order of chars in original string? assume yes

	in_array(["arp", "evil", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "strong"]

Can 2 strings from arr_1 be substrings of the same string from arr_2?  Assume yes

in_array(["arp", "live", "liv", "li", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "liv". "li", "strong"]

do substrings have to bebuild only of chars adjacent in original string? Assume no

in_array(["arp", "lie", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "lie", "strong"]


in_array(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []

D: 

Input : array of strings (all downcase alphabetical chars)
Output: A single array containing substrings of 


A:

1. write a helper method which finds all substrings
2. iterate over arr_1, and for each word iterate over arr_2.
3. if str_1 is a substring of str_2 put it in an output_arr and next
4. Return the output_arr

C:

=end

def find_all_substrings(string)
	(0...string.size).each_with_object([]) do |idx1, array|
		(idx1...string.size).each do |idx2|
			array << string[idx1..idx2]
		end
	end
end

def in_array(array1, array2)
	array1.each_with_object([]) do |word1, array|
		array2.each do |word2|
			substrings2 = find_all_substrings(word2)
			if substrings2.include?(word1) && !array.include?(word1)
				array << word1
			end
		end
	end
end

p in_array(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
p in_array(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []
p in_array(["arp", "evil", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "strong"]
p in_array(["arp", "live", "liv", "li", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "liv", "li" "strong"]
p in_array(["arp", "lie", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "lie", "strong"]

Expected: ["by", "ing", "oes"], instead got: ["by", "oes", "ing"]
