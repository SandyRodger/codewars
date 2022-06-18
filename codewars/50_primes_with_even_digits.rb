=begin

https://www.codewars.com/kata/582dcda401f9ccb4f0000025/train/ruby

5 kyu

Primes with Even Digits

Find the closest prime number under a certain integer n that has the maximum possible amount of even digits.
For n = 1000, the highest prime under 1000 is 887, having two even digits (8 twice)

Naming f(), the function that gives that prime, the above case and others will be like the following below.

f(1000) ---> 887 (even digits: 8, 8)
f(1210) ---> 1201 (even digits: 2, 0)
f(10000) ---> 8887
f(500) ---> 487
f(487) ---> 467

Features of the random tests:

Number of tests = 28
1000 <= n <= 5000000

P: Write  a method which takes an integer(n) and returns the highest number less than n which is prime AND is composed of the most even digits.

E:

f(1000) ---> 887 (even digits: 8, 8) => the maximum possible number of digits will always be n.size-1, because all even digits would be a number divisible by 2.
f(1210) ---> 1201 (even digits: 2, 0) => zero is considered an even number.
f(10000) ---> 8887
f(500) ---> 487
f(487) ---> 467

D: 
Input: Int
Output: Int
loop with a decreeasing counter.

A:

HELPER_METHOD_1: 'has_max_even_digits?'(n, max_even_digits)
	- convert n into a string (n_str)
	- convert n_str into an array, select elements which are even (n_evens)
	- if n_evens has max_even_digits return true, otherwise false

MAIN METHOD
	- require the prime class
	- save n length minus one as max_even_digits
	- enter outer loop
		- enter inner loop
		- subtract 1 from n
		- if n meets all the conditions, return n
			C1: is prime
			C2: has max even digits (HELPER METHOD)
	- If n.length reaches max_even_digs - 1 then max_even_digits - 1 and break from inner loop.


C:
=end

require 'prime'

def has_max_even_digits?(n, max_even_digits)
	n_str = n.to_s
	n_evens = n_str.chars.select{|elem| elem.to_i.even?}
	return true if n_evens.size >= max_even_digits
	false
end

def f(n)
	max_even_digits = n.to_s.length - 1
	loop do
		current_num = n
		loop do
			current_num -= 1
			return current_num if current_num.prime? && has_max_even_digits?(current_num, max_even_digits)
			break if current_num.to_s.length <= max_even_digits
		end
		max_even_digits -= 1
	end
end

p f(1000) == 887
p f(10000) == 8887
p f(500) == 487
p f(487) == 467
p f(1828) == 1823
