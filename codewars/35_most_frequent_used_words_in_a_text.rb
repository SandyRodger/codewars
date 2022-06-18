=begin

https://www.codewars.com/kata/51e056fe544cf36c410000fb/ruby

4 kyu
Most frequently used words in a text

Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

Assumptions:
A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII.
Apostrophes can appear at the start, middle or end of a word ('abc, abc', 'abc', ab'c are all valid)
Any other characters (e.g. #, \, / , . ...) are not part of a word and should be treated as whitespace.
Matches should be case-insensitive, and the words in the result should be lowercased.
Ties may be broken arbitrarily.
If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.

Examples:
top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]

top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]

top_3_words("  //wont won't won't")
# => ["won't", "wont"]

Bonus points (not really, but just for fun):
Avoid creating an array whose memory footprint is roughly as big as the input text.
Avoid sorting the entire array of unique words.

P: Write a method whoch takes a text and finds the three words that occur the most, returning them in an array.

E:

top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"] => length of word is irrelevant

top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"] =. output will all be downcase.

top_3_words("  //wont won't won't")
# => ["won't", "wont"] => output  arr can have less than 3 elements.

top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"] +  words are seperated by whitespace
top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"] => input is considered with case ignored
top_3_words("  //wont won't won't ") == ["won't", "wont"]
top_3_words("  , e   .. ") == ["e"] => punctuation other than apostrophes are not considered.
top_3_words("  ...  ") == []
top_3_words("  '  ") == []
top_3_words("  '''  ") == []
top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]

D:
Input: a text of all chars including punctuation.
output: an array of between 0 and 3 strings, all downcased, no punctuation apart from apostrophes included.

A:

- create output_arr as empty
- Make a hash (freq_hash) where the keys are number of occurence and the values are arrays containing words of that frequency.
	- make string into an array of words
	- iterate over each word, if it's count is in the freq_hash then shovel the word to that key's value (which is an array)
	 - if 
	- if it isn't then initialize that kv pair.
- shovel the three from the highest value into output_arr
- if there aren't 3, move on to other kv pair.


C:
=end

def freq_hsh_mkr(text)
	text_arr = text.downcase.split(' ').map{|word|word.gsub(/[^'\w]/,"")} 
	text_arr.each_with_object({}) do |word, freq_hash|
		count = text_arr.count(word)
		if !freq_hash.has_key?(count)
			freq_hash [count] = [word]
		elsif !freq_hash[count].include?(word)
			freq_hash [count] << word
		end
	end
end

def top_3_words(text)
	freq_hash = freq_hsh_mkr(text)
	freq_hash.sort.reverse.each_with_object([]) do |sub_arr, array|
		element = sub_arr[1][0]
		next if element.empty? || element.gsub("'", "").empty?
		array << sub_arr[1][0]
		return array if array.size == 3
	end
end

p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.") == ["a", "of", "on"]
