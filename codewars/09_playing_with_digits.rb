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



P: Write a method that takes two ints and returns either an int or -1 for no depending on whether a number exists that fits the condition. The condition is that each digit in int_1 should be ** int_2 (+1 on each iteration) to find an int_3 that can divide into this sum with no remainder. 

E:

dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1 => 1 will be the lowest possible int_3
dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k => if sum > int_1, -1 is returned
dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2 => sum is discarded at the end of the method
dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

D:

Input: two integers
output: -1 or a positive integer.

A:

initialize counter = 0

1. make an array of each digit in int_1 (digits_arr)
2. make an array of ints in digits_arr to the power of (int_2 + counter) (products_arr)
3. find sum of products_arr.
4. for 1 .. products_arr.sum do |i|
	if products_arr.sum % i == 0
		return i
	end

C:

=end

def dig_pow(int_1, int_2)
	products_arr = int_1.to_s.chars.map do |digit|
		digit = digit.to_i
		digit **= int_2
		int_2 += 1
		digit
	end
	counter = 1
	loop do
		if counter * int_1 == products_arr.sum
			return counter
		elsif counter == products_arr.sum
			return -1
		end
		counter += 1
	end
end

p dig_pow(89, 1) == 1 
p dig_pow(92, 1) == -1
p dig_pow(695, 2) == 2
p dig_pow(46288, 3) == 51

=begin
	
def find_sum_of_products(int_1, int_2)
	digits_arr = int_1.to_s.split('').map(&:to_i)
	products_arr = digits_arr.map do |digit|
		digit **= (int_2)
		int_2 += 1
		digit
	end
	products_arr.sum
end

def dig_pow(int_1, int_2)
	products_sum = find_sum_of_products(int_1, int_2)
	for int_3 in 1..products_sum
		if int_3 * int_1 == products_sum
			return int_3 
		end
	end
	-1
end

p dig_pow(89, 1) == 1 
p dig_pow(92, 1) == -1
p dig_pow(695, 2) == 2
p dig_pow(46288, 3) == 51

=end