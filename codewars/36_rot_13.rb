=begin 

https://www.codewars.com/kata/530e15517bc88ac656000716/train/ruby

5 kyu
Rot13

ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after it in the alphabet. ROT13 is an example of the Caesar cipher.

Create a function that takes a string and returns the string ciphered with Rot13. If there are numbers or special characters included in the string, they should be returned as they are. Only letters from the latin/english alphabet should be shifted, like in the original Rot13 "implementation".

=end
ALPHABET = (("a".."z").to_a)*2

def rot13(string)
  string.chars.map do |char|
		old_idx = ALPHABET.index(char.downcase)
		if char == " " || !ALPHABET.include?(char.downcase)
			char
		elsif char.upcase == char
			ALPHABET[old_idx + 13].upcase
		else
			ALPHABET[old_idx + 13]
		end
	end.join
end

p rot13("test") == "grfg"
p rot13("Test") == "Grfg" 
p rot13("Ruby is cool!") == "Ehol vf pbby!"