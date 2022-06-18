=begin

https://www.codewars.com/kata/592e830e043b99888600002d/train/ruby

7 kyu
Digital cypher

Introduction
Digital Cypher assigns to each letter of the alphabet a unique number. For example:

 a  b  c  d  e  f  g  h  i  j  k  l  m
 1  2  3  4  5  6  7  8  9 10 11 12 13
 n  o  p  q  r  s  t  u  v  w  x  y  z
14 15 16 17 18 19 20 21 22 23 24 25 26
Instead of letters in encrypted word we write the corresponding number, eg. The word scout:

 s  c  o  u  t
19  3 15 21 20
Then we add to each obtained digit consecutive digits from the key. For example. In case of key equal to 1939 :

   s  c  o  u  t
  19  3 15 21 20
 + 1  9  3  9  1
 ---------------
  20 12 18 30 21
  
   m  a  s  t  e  r  p  i  e  c  e
  13  1 19 20  5 18 16  9  5  3  5
+  1  9  3  9  1  9  3  9  1  9  3
  --------------------------------
  14 10 22 29  6 27 19 18  6  12 8

Task
Write a function that accepts str string and key number and returns an array of integers representing encoded str.

Input / Output
The str input string consists of lowercase characters only.
The key input number is a positive integer.

Example
Encode("scout",1939);  ==>  [ 20, 12, 18, 30, 21]
Encode("masterpiece",1939);  ==>  [ 14, 10, 22, 29, 6, 27, 19, 18, 6, 12, 8]

P: Write a method which takes a string and an integer and returns an array of integers. The output is an encoded version of input_str. The encoding follows this set of instructions.
	1. find the char index in alphabet (a = 1, z = 26) (abc_idx)
	2. take consecutive digits from input_int and add it to abc_idx (new_idx)
	3. This new_idx is the output.

E:

encode("scout", 1939)# == [20, 12, 18, 30, 21] 

   s  c  o  u  t
  19  3 15 21 20
 + 1  9  3  9  1
 ---------------
  20 12 18 30 21
  

encode("masterpiece", 1939) == [14, 10, 22, 29, 6, 27, 19, 18, 6, 12, 8]

   m  a  s  t  e  r  p  i  e  c  e
  13  1 19 20  5 18 16  9  5  3  5
+  1  9  3  9  1  9  3  9  1  9  3
  --------------------------------
  14 10 22 29  6 27 19 18  6  12 8

D:
Input: a string, an int
Ouput: an array of ints, the same size as input_str

looping iteration through the index of input_int digits
constant range of the alhpabet.

A: 

- Initialize a range of the lowercase alphabet ('ABC'), convert it to an array
- break input int into an array of digits (int_key)
- initialize key_index as 0
- iterate through the characters of input_str with an output_array. (char, output_arr)
	- for each char calculate its ABC index plus the digit at int_key key_index
	- put that number into output_arr
	- increment key_index by one
	- if key_index is equal to key_index size then reset key index as 0

C:
=end

ABC = ("a".."z").to_a

def encode(message, key)
	int_key = key.to_s.chars.map(&:to_i)
	key_index = 0
	message.chars.each_with_object([]) do |char, output_arr|
		output_arr << (ABC.index(char) + 1) + int_key[key_index]
		key_index += 1
		if key_index == int_key.size
			key_index = 0
		end
	end
end


p encode("scout", 1939) == [20, 12, 18, 30, 21]
p encode("masterpiece", 1939) == [14, 10, 22, 29, 6, 27, 19, 18, 6, 12, 8]


