=begin

6 kyu
Playing with passphrases

Everyone knows passphrases. One can choose passphrases from poems, songs, movies, names and so on but frequently they can be guessed due to common cultural references. You can get your passphrases stronger by different means. One is the following:

choose a text in capital letters including or not digits and non-alphabetic characters,

shift each letter by a given number but the transformed letter must be a letter (circular shift),
replace each digit by its complement to 9,
keep such as non alphabetic and non digit characters,
downcase each letter in odd position, upcase each letter in even position (the first character is in position 0),
reverse the whole result.

Example:

your text: "BORN IN 2015!", shift 1

1 + 2 + 3 -> "CPSO JO 7984!"

4 "CpSo jO 7984!"

5 "!4897 Oj oSpC"

With longer passphrases it's better to have a small and easy program. Would you write it?

https://en.wikipedia.org/wiki/Passphrase

P: Write a method which takes a string modifies the string in 3 stages and return the modified string
St1: rep[lace each alphabetical string with the letter of the alphabet idx places forward.
St2: replace each digit with 9 minus digit
St3: leave non letter, non int chars untouched.
St4: capitalise even index chars, downcase odd index chars
St5: reveerse the result.

E:

play_pass("I LOVE YOU!!!", 1) == "!!!vPz fWpM J"
play_pass("MY GRANMA CAME FROM NY ON THE 23RD OF APRIL 2015", 2) == "4897 NkTrC Hq fT67 GjV Pq aP OqTh gOcE CoPcTi aO"
play_pass("BORN IN 2015!", 1) == "!4897 Oj oSpC" => Chars at input can/will all be caps

D:
- input str
- output str
- break this down into 3 helper methods

A:

St1: replace each alphabetical string with the letter of the alphabet idx places forward.
St2: replace each digit with 9 minus digit
St3: leave non letter, non int chars untouched.
St4: capitalise even index chars, downcase odd index chars
St5: reveerse the result.

- initialise a constant of the alphabet, twice repeated (to catch indexes that exceed 25) - as an array
- initialize a constant called NUMS containing 0-9 as an array

- HELPER METHOD: replace_letters(str, int)
	- break str into an array of chars (chars)
	- iterate through chars (char) with an empty array called 'output_arr'
		- if char is in the alphabet then find its index, add int to it and save ABC at the new index
		- shovel new_char into output_arr
		- OTHERWISE simply shovel char into output_arr
	- join and return output_arr

- HELPER METHOD: replace_nums(str)
	- break str into an array of chars (chars)
	- iterate through chars (char)
		- if char is in the NUMS constant
			subtract char(as an int) from num, save this as new_num
			-shovel new_num as a string into output_arr
	- join and return output_arr

- initialize an index counter (idx) equal to 0
- iterate through modified chars and return a transformed array (save as 'stage_four')
			- if idx is even and char responds to :upcase then upcase
			- if idx is odd and char responds to :downcase then downcase
-return reversed array, joined together

C:
=end

ABC = ("a".."z").to_a+("a".."z").to_a
NUMS = ("0".."9").to_a

def replace_letters(str, int)
 chars = str.chars
 chars.each_with_object([]) do |char, output_arr|
   if ABC.include?(char.downcase)
		index = ABC.index(char.downcase)	
		new_index = index + int
		output_arr << ABC[new_index]
	 else
		output_arr << char
	 end
 end
end

# p replace_letters("BORN IN 2015!", 1) #=> ["c", "p", "s", "o", " ", "j", "o", " ", "2", "0", "1", "5", "!"]

def replace_nums(arr)
	arr.each_with_object([]) do |char, output_arr|
		if NUMS.include?(char)
			new_num = 9 - char.to_i
			output_arr << new_num
		else
			output_arr << char
		end
	end
end

#p replace_nums(["c", "p", "s", "o", " ", "j", "o", " ", "2", "0", "1", "5", "!"])


def play_pass(str, int)
	stage_1 = replace_letters(str, int)
	stage_2 = replace_nums(stage_1)
	idx = -1
	stage_4 = stage_2.map do |char|
		idx += 1
		if idx.even? && char.respond_to?(:upcase)
			char.upcase
		elsif  idx.odd? && char.respond_to?(:downcase)
			char.downcase
		else
			char
		end
	end
	stage_4.reverse.join
end


p play_pass("I LOVE YOU!!!", 1) == "!!!vPz fWpM J"
p play_pass("MY GRANMA CAME FROM NY ON THE 23RD OF APRIL 2015", 2) == "4897 NkTrC Hq fT67 GjV Pq aP OqTh gOcE CoPcTi aO"
p play_pass("BORN IN 2015!", 1) == "!4897 Oj oSpC" 

