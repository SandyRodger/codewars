=begin

Write a function named first_non_repeating_letter that takes a string input, and returns the first character that is not repeated anywhere in the string.

For example, if given the input 'stress', the function should return 't', since the letter t only occurs once in the string, and occurs first in the string.

As an added challenge, upper- and lowercase letters are considered the same character, but the function should return the correct case for the initial letter. For example, the input 'sTreSS' should return 'T'.

If a string contains all repeating characters, it should return an empty string ("") or None -- see sample tests.


first_non_repeating_letter('a') == 'a'
first_non_repeating_letter('stress') == 't'
first_non_repeating_letter('moonmen') == 'e'
first_non_repeating_letter('') == ''


P: Write a method that takes a string (input_str) finds which characters are not repeated (case-insensitive) and returns the earliest occurance of that char (case-sesitive) in the string.

E:

first_non_repeating_letter('a') == 'a' => input_str can be a single char
first_non_repeating_letter('stress') == 't' => standard
first_non_repeating_letter('moonmen') == 'e' => the only char not repeated.
first_non_repeating_letter('') == '' => empty input str is valid
first_non_repeating_letter(''sTreSS'') == 'T' => case sensitive output, but not when evaluating letter occurence.

D:

input: a string
array
output: a single char string

A:

1. make a hash of chars and their occurences 'letter_counts'
2. select the letter counts where the value is 1 'single_letters'
3. return the first value in 'single_letters
 
C:

Time: 26:56

=end

def hsh_mkr(word)
	arr = word.split('').map(&:downcase)
	arr.each_with_object({}) do |char, hsh|
		!hsh.keys.include?(char) ? hsh [char] = arr.count(char) : next
	end
end

# p hsh_mkr('sTreSS')

def first_non_repeating_letter(string)
	return string if string.empty?
	letter_count = hsh_mkr(string)
	single_letters = letter_count.select{|_, v| v==1}
	answer = single_letters.first.first
	string.match(/#{answer}/i).to_s
end


p first_non_repeating_letter('a') == 'a'
p first_non_repeating_letter('stress') == 't'
p first_non_repeating_letter('moonmen') == 'e'
p first_non_repeating_letter('') == ''
p first_non_repeating_letter('sTreSS') == 'T'