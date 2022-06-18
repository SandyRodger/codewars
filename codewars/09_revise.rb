=begin

6 kyu - Playing with digits

Some numbers have funny properties. For example:

89 --> 8¹ + 9² = 89 * 1

695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Given a positive integer int_1 written as abcd... (a, b, c, d... being digits) and a positive integer int_2
we want to find a positive integer int_3, if it exists, such that the sum of the digits of int_1 taken to the successive powers of int_2 is equal to int_3 * int_1.

In other words:

Is there an integer int_3 such as : (a ** int_2 + b ** (int_2+1) + c **(int_2+2) + d ** (int_2+3) + ...) = int_1 * int_3
If it is the case we will return int_3, if not return -1.
Note: int_1 and int_2 will always be given as strictly positive integers.

P: Write a method which takes 2 integers. It breaks int_1 into digits and multiplies the first digit to the power of int_2, then the second digit to the power of (int_2 +1) and so on. The results of these multiplications added together is then divided by int_1 and if the result is a whole number, then it is returned, otherwise -1 is returned.

E:

89 --> 8¹ + 9² = 89 * 1 => when int_2 is 1 then the method only needs to calculate the sum of the digits multiplied by the incremented powers.

695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2 => it seems clear that the last step of the method wil be a division.

46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

dig_pow(89, 1) == 1 
dig_pow(92, 1) == -1
dig_pow(695, 2) == 2
dig_pow(46288, 3) == 51

D:
- input: 2 ints
- output: 1 int (positive or -1)
- convert int_1 into a string and break it into chars then convert those back into ints.
- int_2 will be an incrementing counter.

A:

- break int_1 into an array of digits (digits)
- iterate over 'digits' ('digit') with an empty array (results) (save return value of iteration as results)
	- mulitply digit to the power of int_2, save result in 'array'.
	- increment int_2 by one
- save the sum of results (summed_results)
- divide summed_results (as a float) by int_1 (return_float)
- if return float is the same as return_float as an integer, then return return_float as an integer
	- otherwise return -1.
C:

=end

def dig_pow(int_1, int_2)
	digits = int_1.to_s.chars.map(&:to_i)
	results = digits.each_with_object([]) do |digit, array|
		array << digit ** int_2
		int_2 += 1
	end
	summed_results = results.sum
	float_result = summed_results.to_f/int_1
	if float_result == float_result.to_i
		return float_result.to_i
	else
		return -1
	end
end

p dig_pow(89, 1) == 1 
p dig_pow(92, 1) == -1
p dig_pow(695, 2) == 2
p dig_pow(46288, 3) == 51
