=begin

https://www.codewars.com/kata/55aa075506463dac6600010d
5 kyu

Integers: Recreation One

1, 246, 2, 123, 3, 82, 6, 41 are the divisors of number 246. Squaring these divisors we get: 1, 60516, 4, 15129, 9, 6724, 36, 1681. The sum of these squares is 84100 which is 290 * 290.

Task
Find all integers between m and n (m and n integers with 1 <= m <= n) such that the sum of their squared divisors is itself a square.

We will return an array of subarrays or a string. The subarrays will have two elements: first the number the squared divisors of which is a square and then the sum of the squared divisors.

Example:
list_squared(1, 250) --> [[1, 1], [42, 2500], [246, 84100]]
list_squared(42, 250) --> [[42, 2500], [246, 84100]]
The form of the examples may change according to the language, see "Sample Tests".

P: Write a method which takes 2 integers which represent a range. For each number (n) in this range:
1. find all ints (incl 1) which can divide into n leaving no remainder.
2. Square all those numbers
3. sum those squares (square_sum)
4. find out if that sum has a square root which is a square root.
5. then create a subarray containing n and square_sum
6. put those subarrays into an output array and return that.

E: 

list_squared(1, 250) --> [[1, 1], [42, 2500], [246, 84100]]
list_squared(42, 250) --> [[42, 2500], [246, 84100]]
list_squared(250, 500) == [[287, 84100]]

D: 
Input: 2 ints representing a range
Output: array of subarrays, each containing 2 ints

A: 

- establish the range 'range'
- establish array of divisors
- iterate over the range , calling each integer 'n'
	- for input_int_1 to n create another range called 'current range'
	- iterate over this range calling numbers 'current_num'
		- find out if this current_number is a square
			- if it does then put that current_num and that it's square root in an output array
			- if it doesn't then next
	- return that array


C: 
=end

def divisors_of(n)
	(1..n).each_with_object([]) do |div, array|
		n % div == 0 ? array << div : next
	end
end

def square_finder(num)
	(1..num).each_with_object(false){|n, arr| n**2 == num ? (return n) : next}
end

def list_squared(int_1, int_2)
	(int_1..int_2).each_with_object([]) do |n, array|
		divisors = divisors_of(n)
		sq_divisors = divisors.map{|n|n**2}
		sq_sum = sq_divisors.sum
		if sq_sum_sq = square_finder(sq_sum)
			array << [n, sq_sum]
		end
	end
end

p list_squared(42, 250) == [[42, 2500], [246, 84100]]
p list_squared(1, 250) == [[1, 1], [42, 2500], [246, 84100]]
p list_squared(42, 250) == [[42, 2500], [246, 84100]]
p list_squared(250, 500) == [[287, 84100]]











# def squares_to(n)
# 	(1..n).each_with_object([]) do |multiple, array|
# 		array << multiple ** 2
# 	end
# end