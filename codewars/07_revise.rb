=begin

p wave("hello") #== ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
#p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
#p wave("") == []
p wave("two words") #== ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
#p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

P: Write a merhid which takes a string and returns an array containing string.length variations of string. the variations will have one letter capitalized, starting with the first and ending with the last.

E:

p wave("hello") #== ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
# p wave("") == [] => empty str is valid input.
# p wave("two words") #== ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"] => spaces are not counted in the iterations but must be included in the output
# p wave(" gap ") == [" Gap ", " gAp ", " gaP "] => trailing and leading whitespaces must be included in the output

D:

- inut: a string with spaces, but all lowercase.
- output: an array of strings, the number of capitalize-able chars in input string.
- I will use an incrementing counter to capitalize at the index I require.

A:

initialize a range of the lowercase alphabet called ABC
- Break inout string into an array of chars
- initialize a counter as zero
- initialize an empty array as output.
- enter a loop
	- if char_array at the index of counter is included in ABC THEN
		- replace that element with a capitalized version of itself (saving it as modified array)
		- join the modified array
		- shovel it into output array
	- increment counter
	- if the counter is equal to or greater than the size of input string then return output_array
	- end the loop

C:
=end

ABC = "a".."z"

def wave(string)
	chars = string.chars
	idx = 0
	output = []
	loop do	 
		if ABC.include?(chars[idx])
			modified_array = chars[0...idx] + [chars[idx].upcase] + chars[(idx+1)..-1]
			output << modified_array.join
		end
		idx += 1
		return output if idx > chars.size
	end
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]