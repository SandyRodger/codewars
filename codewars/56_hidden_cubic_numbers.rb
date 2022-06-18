=begin

https://www.codewars.com/kata/55031bba8cba40ada90011c4/train/ruby

6 kyu
Hidden "Cubic" numbers

We search non-negative integer numbers, with at most 3 digits, such as the sum of the cubes of their digits is the number itself; we will call them "cubic" numbers.

153 is such a "cubic" number : 1^3 + 5^3 + 3^3 = 153
These "cubic" numbers of at most 3 digits are easy to find, even by hand, so they are "hidden" with other numbers and characters in a string.

The task is to find, or not, the "cubic" numbers in the string and then to make the sum of these "cubic" numbers found in the string, if any, and to return a string such as:

"number1 number2 (and so on if necessary) sumOfCubicNumbers Lucky" 
if "cubic" numbers number1, number2, ... were found.

The numbers in the output are to be in the order in which they are encountered in the input string.

If no cubic numbers are found return the string: `"Unlucky"``.

Examples:
 - s = "aqdf&0#1xyz!22[153(777.777" 
   the groups of at most 3 digits are 0 and 1 (one digit), 22 (two digits), 153, 777, 777 (3 digits)
   Only 0, 1, 153 are cubic and their sum is 154
   Return: "0 1 153 154 Lucky"

- s = "QK29a45[&erui9026315"
  the groups are 29, 45, 902, 631, 5. None is cubic.
  Return: "Unlucky"
Notes
In the string "001234" where 3 digits or more follow each other the first group to examine is "001" and the following is "234". If a packet of at most three digits has been taken, whether or not "cubic", it's over for that packet.

When a continuous string of digits exceeds 3, the string is split into groups of 3 from the left. The last grouping could have 3, 2 or 1 digits.

e.g "24172410" becomes 3 strings comprising "241", "724" and "10"

e.g "0785" becomes 2 strings comprising "078" and "5".

P: Write a method which takes a string of chars. The method must find groups of integers. Here groups means between 1 and 3 digits, digits cannot be used in multiple groups, digits must be adjacent. These integers are then assessed to be cubic or not. If they are cubic they are included in an output_string. At the end of the series of valid cubic numbers the numbers are summed and added to output_string and then the word "Lucky" is added. If there are no cubic numbers then return a string containing only the ord "Unlucky"
  
E:

 - s = "aqdf&0#1xyz!22[153(777.777" 
   the groups of at most 3 digits are 0 and 1 (one digit), 22 (two digits), 153, 777, 777 (3 digits)
   Only 0, 1, 153 are cubic and their sum is 154
   Return: "0 1 153 154 Lucky"

- s = "QK29a45[&erui9026315"
  the groups are 29, 45, 902, 631, 5. None is cubic.
  Return: "Unlucky"

D:
Input: a string including digits, punctuation, whitespace and chars.
Output a string built with string interpolation.
extract number groups from input_str (Helper method)
write a is_cubic helper method

A:

- isolate the numbers in their groupings
	HELPER METHOD: 'isolate_nums' takes string
		- break input_str into an array of chars (chars_arr)
		- initialize a local variable called 'current_str'
		- iterate through chars_arr with an array object (char, array) (save the return value of this as 'num_groups')
			- if char is a digit then add it to current_str
				- if current_str has a size of 3 then...
					- add current_str to array
					- reassign current_str to an empty string
			- if char is not a digit and current string is not empty then 
				- add current_str to array
				- reassign current_str to an empty string
		- transform num_groups to integers.

- Assess whether the numbers are cubic.
	HELPER METHOD: 'is_cubic?' takes an array of nums
	- iterate over array_of_nums with an array object (num, valid_cubes)
	- break num into an array of digits ('digits')
		- initialize a LV called 'total' as 0
		- iterate over digits (digit)
		- cube digit and add it to total
		- if total equals num then put it in 'valid_cubes'

	
- if there are no cubic numbers then return "Unlucky"
- initialize a LV called 'sum_of_cubics'
- format the correct output.
		- string interpolation



C:
=end
NUMS = (0..9).to_a.map(&:to_s)

def isolate_nums(str)
	chars_arr = str.chars
	current_str = ''
	num_groups = chars_arr.each_with_object([]) do |char, array|
		if NUMS.include?(char)
			current_str << char
			if current_str.size == 3
				array << current_str
				current_str = ''
			end
		elsif !NUMS.include?(char) && !current_str.empty?
			array << current_str
			current_str = ''
		end
	end
	num_groups.map(&:to_i)
end

def is_cubic?(int)
	valid_cubes = []
	total = 0
	int.to_s.chars.map(&:to_i).each do |digit|
		total += (digit ** 3)
	end
	total == int ? total : false
end

def isSumOfCubes(str)
	nums = isolate_nums(str)
	cubics = nums.select{|num|is_cubic?(num)}
	return "Unlucky" if cubics.empty?
	cubic_strings = cubics.map(&:to_s)
	"#{cubics.join(" ")} #{cubics.sum} Lucky"
end

p isSumOfCubes("0 9026315 -827&()") == "0 0 Lucky"
p isSumOfCubes("Once upon a midnight dreary, while100 I pondered, 9026315weak and weary -827&()") == "Unlucky"
p isSumOfCubes("371 407 153 1 932") == "371 407 153 1 932 Lucky"