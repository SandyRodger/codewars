=begin

Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

Examples: 

spin_words( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"  => Standard
spin_words( "This is a test") => returns "This is a test" => output can be the same as input.
spin_words( "This is another test" ) => returns "This is rehtona test"
spin_words("Welcome") ==  "emocleW" => capitalisation must be preserved
spin_words("Stop spinning My Words") == "Stop gninnipS My sdroW"

P: Write a method that takes a string of one or more words and returns a modified version of that string. Modifications must be A) all words greater than/ equal to 5 letters in length will be reversed. 
Note: strings will only consist of letters and spaces  (unlike the problem title)
Note: Spaces will only indicate word-breaks.

E:

spin_words( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"  => Standard
spin_words( "This is a test") => returns "This is a test" => output can be the same as input.
spin_words( "This is another test" ) => returns "This is rehtona test"
spin_words("Welcome") ==  "emocleW" => capitalisation must be preserved
spin_words("Stop spinning My Words") == "Stop gninnipS My sdroW"

D:

Strings
Arrays of strings

A:

1. Break string into array of words
	- #split
2. iterate over this array |word|
	#map
3. If word is longer than 4 letters, reverse it. 
	ternarty operator
	- #reverse
4. rejoin words into a string
	#join(' ')
5. return string
	
C:
=end

def spin_words(string)
	array =  string.split(' ')
	modified_arr = array.map do |word|
		word.length > 4 ? word.reverse : word
	end
	modified_arr.join(' ')
end


p spin_words("Hey fellow warriors" ) == "Hey wollef sroirraw" 
p spin_words("This is a test") == "This is a test" 
p spin_words("This is another test" ) =="This is rehtona test"
p spin_words("Welcome") ==  "emocleW"
p spin_words("Stop Spinning My Words") == "Stop gninnipS My sdroW"
