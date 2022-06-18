=begin

P:

Given a lowercase string that has alphabetical characters only and no spaces, return the length of the longest vowel substring. 
Vowels are any of aeiou.

Edge cases

string is only vowels ('aaaaaaaa')
string has no vowels ('ttttttt')

E:

The vowel substrings in the word "codewarriors" are o,e,a,io. The longest of these has a length of 2. 
solve("codewarriors") == 2
solve("suoidea") == 3
solve("iuuvgheaae") == 4
solve("ultrarevolutionariees") == 3
solve("strengthlessnesses") == 1
solve("cuboideonavicuare") == 2
solve("chrononhotonthuooaos") == 5
solve("iiihoovaeaaaoougjyaw") == 8

P: Write a method which takes a string and returns the length of the longest vowel substring.

E:

The vowel substrings in the word "codewarriors" are o,e,a,io. The longest of these has a length of 2. 
solve("codewarriors") == 2
solve("suoidea") == 3
solve("iuuvgheaae") == 4
solve("ultrarevolutionariees") == 3
solve("strengthlessnesses") == 1
solve("cuboideonavicuare") == 2
solve("chrononhotonthuooaos") == 5
solve("iiihoovaeaaaoougjyaw") == 8 => all inout is lowercase

D:

- input: string of lowercase chars
- output: an integer
- iterate through array of chars incrementing a counter

A:
iuuvgheaae
- initialize a constant of the vowels
- initialize 'current' as zero
- break input_str into an array of chars
- iterate through array_of_chars with 'longest' as zero
- if char is a vowel then increment current.
- if char is not a vowel AND current counter is not 0 AND current is greater than longest then reassign longest to current AND reassign current to 0
- if char is not a vowel AND current counter is not 0 BUT current is not greater than longest then reassign current to 0.


C:
=end

VOWELS = ["a", "e", "i", "o", "u"]

def solve(string)
	current = 0
	longest = 0
	string.chars do |char|
		if !VOWELS.include?(char) && current != 0 && current > longest
			longest = current
			current = 0
		elsif !VOWELS.include?(char) && current != 0 && current <= longest
			current = 0
		elsif VOWELS.include?(char) 
				current += 1
				if current > longest
					longest = current
				end
		end
	end
	longest
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8