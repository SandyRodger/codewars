=begin

https://www.codewars.com/kata/53f40dff5f9d31b813000774/train/ruby

Recover a secret string from random triplets - 4 kyu

There is a secret string which is unknown to you. Given a collection of random triplets from the string, recover the original string.

A triplet here is defined as a sequence of three letters such that each letter occurs somewhere before the next in the given string. "whi" is a triplet for the string "whatisup".

As a simplification, you may assume that no letter occurs more than once in the secret string.

You can assume nothing about the triplets given to you other than that they are valid triplets and that they contain sufficient information to deduce the original string. In particular, this means that the secret string will never contain letters that do not occur in one of the triplets given to you.

	P: Write a method which takes an array of subarrays. Each subarray contains 3 chars. The method must return a string. The output string should be (without spaces) a message derived from the input chars. The mode of this derivation is for you to discover.

	E:

	secret_1 = "whatisup"

	w,h,a,t,i,s,u,p
	0,1,2,3,4,5,6,7
	 w, h, a, t, i, s, u, p
	-8,-7,-6,-5,-4,-3,-2,-1
	p, u, s, i, t, a, h, w
	0  1  2  3  4  5  6  7 
	
	total = 8
	
triplets_1 = [	     + idx				- idx						only 2					idx			
  ['t','u','p'], => 3,6,7   => [-5,-2,-1]     u, p (last 2)    		0  
  ['w','h','i'], => 0,1,4   => [-8,-7,-4]     w, h  (first 2) 		1
  ['t','s','u'], => 3,5,6   => [-5,-3,-2]     u s  (first 2)			2
  ['a','t','s'], => 2,3,5   => [-6,-5,-3]     a, t (first 2)			3
  ['h','a','p'], => 1,2,7		=> [-7,-6,-1]     h, a (first 2)			4
  ['t','i','s'], => 3,4,5   => [-5,-4,-3]     t i   (last 2)			5
  ['w','h','s']  => 0,1,5   => [-8,-7,-3]     w, h  (first 2)			6
]

recover_secret(triplets_1) == secret_1

	D:
	A:
	C:
=end

def recover_secret triplets
  # TODO
end

secret_1 = "whatisup"
triplets_1 = [
  ['t','u','p'], 
  ['w','h','i'],
  ['t','s','u'],
  ['a','t','s'],
  ['h','a','p'],
  ['t','i','s'],
  ['w','h','s']
]

recover_secret(triplets_1) == secret_1