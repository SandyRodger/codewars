=begin

6 kyu
Playing with passphrases

Everyone knows passphrases. One can choose passphrases from poems, songs, movies, names and so on but frequently they can be guessed due to common cultural references. You can get your passphrases stronger by different means. One is the following:

choose a text in capital letters including or not digits and non alphabetic characters,

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

P:	Write a method that takes a string and an int, makes 4 transformations to the string and returns it. 
	T1) shift all alphabetical chars by input_int ahead in the alphabet.
	T2) Replace each digit with 9 - num
	T3) Downcase chars at odd idx, upcase chars at even idx.
	T4) Reverse the string. 

E: 

play_pass("I LOVE YOU!!!", 1) == "!!!vPz fWpM J"
play_pass("MY GRANMA CAME FROM NY ON THE 23RD OF APRIL 2015", 2) == "4897 NkTrC Hq fT67 GjV Pq aP OqTh gOcE CoPcTi aO"
play_pass("BORN IN 2015!", 1) == "!4897 Oj oSpC" => Chars at input will all be caps

D: 

Input: string of capital chars, nums and other.
Output: String of everything. 

A: 

1. Create a constant of the alphabet (range)

2. convert input string into an array

	# split('') 
	input_arr = 

3. transform letters in array to shifted letters

	input_arr.map 
	next if !ALPHABET.include?(char)
		- target_idx = ALPHABET.index(char)
		ALPHABET[target_idx + input_int]

4. transform digits in array to 9 - digit.

	if DIGITS includes char return 9 - char

5. Downcase chars at odd idx, upcase chars at even idx.

		iterate through the array looking at char and idx
		If idx is odd then downcase it
		If idx is even then upcase it
		(Assume this has no effect on non-alphabetical chars)

6. reverse the array
7. join and return the string.

C: 

=end

ALPHABET = ('A'..'Z').to_a
DIGITS = ("0".."9").to_a

def shift_letters_and_digits(array, int)
	array.map do |char|
		if DIGITS.include?(char)
			9 - char.to_i
		elsif ALPHABET.include?(char)
			target_idx = ALPHABET.index(char) + int
			if target_idx >= 25
				target_idx -= 26
			end
			ALPHABET[target_idx]
		else
			char
		end
	end
end

# shift_letters_and_digits(["L", "O", "1", "V", "E"], 2)

def shift_capitals(array)
	array.map.with_index do |char, idx|
		if !ALPHABET.include?(char)
			char
		elsif idx.odd? 
			char.downcase
		else 
			char.upcase
		end
	end
end

def play_pass(str, n)
	array = str.split('')
	shifted_chars_and_ints = shift_letters_and_digits(array, n)
	shifted_caps = shift_capitals(shifted_chars_and_ints)
	reversed_arr = shifted_caps.reverse
	reversed_arr.join('')
end

p play_pass("I LOVE YOU!!!", 1) == "!!!vPz fWpM J"
p play_pass("MY GRANMA CAME FROM NY ON THE 23RD OF APRIL 2015", 2) == "4897 NkTrC Hq fT67 GjV Pq aP OqTh gOcE CoPcTi aO"
p play_pass("BORN IN 2015!", 1) == "!4897 Oj oSpC"
p play_pass("BORN IN 2015! ZZZ", 1) == "AaA !4897 Oj oSpC"