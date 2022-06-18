=begin

https://www.codewars.com/kata/523a86aa4230ebb5420001e1/ruby

5 kyu Where my anagrams at?

What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

'abba' & 'baab' == true

'abba' & 'bbaa' == true

'abba' & 'abbba' == false

'abba' & 'abca' == false

Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']

anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']

anagrams('laser', ['lazing', 'lazy',  'lacer']) => []

P: Write a method that takes a string and an array of strings and returns which strings from the array are anagrams of the first string.

E:

anagrams("a", ["a","b", "c", "d"]) == ["a"] => single chars are valid input/output
anagrams("ab", ["aa", "bb", "cc", "ac", "bc", "cd","ab", "ba"]) == ["ab", "ba"] 
anagrams("abba", ["aabb", "bbaa", "abab", "baba", "baab", "abcd", "abbba", "baaab", "abbab", "abbaa", "babaa"]) == ["aabb", "bbaa", "abab", "baba", "baab"]
anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa'] => output strings will always have the same number of cahrs as input strings.
anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
anagrams('laser', ['lazing', 'lazy',  'lacer']) == [] => empty arrays are valid output

D:

Input: string and array of strings
output: array of strings (possibly empty)

A:

- Write a helper method to determine if a word is an anagram of another word.
	- method takes two strings.
	- breaks each string into arrays.
	- if char #count is not the same in both words then return false
- iterate over the array feeding in the two words.
- if it is an anagram feed it into an output array.

C:

=end

def is_anagram?(str_1, str_2)
	str_1.chars.sort == str_2.chars.sort
end

def anagrams(word, words)
	words.each_with_object([]) do |word_2, array|
		if is_anagram?(word, word_2)
			array << word_2
		end
	end
end

p anagrams("a", ["a","b", "c", "d"]) == ["a"]
p anagrams("ab", ["aa", "bb", "ab", "ba", "cc", "ac", "bc", "cd"]) == ["ab", "ba"]
p anagrams("abba", ["aabb", "bbaa", "abab", "baba", "baab", "abcd", "abbba", "baaab", "abbab", "abbaa", "babaa"]) == ["aabb", "bbaa", "abab", "baba", "baab"]
p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []
