=begin

6 kyu - Does my number look big in this?

A Narcissistic Number is a positive number which is the sum of its own digits, each raised to the power of the number of digits in a given base. In this Kata, we will restrict ourselves to decimal (base 10).


Examples:

For example, take 153 (3 digits), which is narcisstic:

    1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153

and 1652 (4 digits), which isn't:

    1^4 + 6^4 + 5^4 + 2^4 = 1 + 1296 + 625 + 16 = 1938

The Challenge:

Your code must return true or false (not 'true' and 'false') depending upon whether the given number is a Narcissistic number in base 10. This may be True and False in your language, e.g. PHP.

Error checking for text strings or other invalid inputs is not required, only valid positive non-zero integers will be passed into the function.

P: Write a method that takes an integer and returns a boolean, depending on whether that number is narcissistic or not. Narcissistic means the sum of each digit in num * num.length is equal to num.

E:

For example, take 153 (3 digits), which is narcisstic:

    1**3 + 5**3 + 3**3 = 1 + 125 + 27 = 153

and 1652 (4 digits), which isn't:

    1**4 + 6**4 + 5**4 + 2**4 = 1 + 1296 + 625 + 16 = 1938

D:

Input: integer
Output: boolean
#**

A:

1. Break the input_int into an array of digits
	- array_of_digits = int.to_s.split('').map(&:to_i)
2. Take each digit, call it |digit|
	 - #map
3. multiply digit by array.size
	 - digit ** array_of_digits.size
4. Save these multiples in a transformed array.
	'array_of_multiples'
5. compare the sum total of the array with the original input_int
	- array_of_multiples.sum == int
6. Return this boolean

C:
=end

def narcissistic?(int)
	array_of_digits = int.to_s.split('').map(&:to_i)
	array_of_multiples = array_of_digits.map do |digit|
		digit ** array_of_digits.size
	end
	array_of_multiples.sum == int
end

p narcissistic?(5) == true
p narcissistic?(153) ==  true
p narcissistic?(1633) == false