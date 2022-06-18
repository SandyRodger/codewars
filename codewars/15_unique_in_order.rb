=begin

6 kyu

Unique In Order

Implement the function unique_in_order which takes as argument a sequence and returns a list of items without any elements with the same value next to each other and preserving the original order of elements.

For example:

unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
unique_in_order([1,2,2,3,3])       == [1,2,3]

def unique_in_order(iterable)
  #your code here
end

P: Write a method which takes either a string or an array (containing integers) and returns an array containing only the ints/chars which were not followed by a duplicate of themselves. 

Note: capital letters are different from lowercase letters here.

E:

unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B'] => standard example.
unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D'] => lowercase letters are seen as different to uppcase letters.
unique_in_order([1,2,2,3,3])       == [1,2,3] => numbers can be valid input if presented in an array.

Edge-cases: 
	 - unique_in_order('12233') == [1,2,3] (?)
		- unique_in_order(['A','A','A']) == ['A']
		- unique_in_order([]) == []

		Assumptions:

Input is valid input. (no nils, or booleans etc.)

D:
Input: an array/string containing ints or chars
Output: array of ints/chars

A:

Helper method: Convert to array(input)

1. If input == input.to_s
		return input.split('')
	if input == input.to_a
		return input.map(&:to_s)

initialize output_array = []
0. Convert the input into an array of elements.
 for stings #split
	for ints int.to_s.split
1. I want to consider each element in the collection and its prescedent.
	- each_with_index
	if idx = 0
		next
	end
	-arr.each_with_index do |char, idx|
		prescedent = arr[idx-1]
	2. If the element is preceeded by a duplicate of itself then do nothing	
	3. Otherwise put the element into an output array.
		if prescedent != char
		# shovel char into the output array
	end
C:
=end

def convert_to_arr(input)
	if input == input.to_s
	return input.split('')
	elsif input == input.to_a
	return input.map(&:to_s)
	end
end

# p convert_to_arr([1,2,2,3,3])

def unique_in_order(input)
	array = convert_to_arr(input)
	output_array = [array[0]]
	array.each_with_index do |char, idx|
		if idx == 0
			next
		end
		prescedent = array[idx-1]
		if prescedent != char
			output_array << char
		end
	end
	if input[0].to_i == input[0]
		output_array = output_array.map(&:to_i)
	end
	output_array
end

p unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']# => standard example.
p unique_in_order('ABBCcAD')    == ['A', 'B', 'C', 'c', 'A', 'D'] 
p unique_in_order([1,2,2,3,3])     == [1,2,3] 
p unique_in_order('12233') #== [1,2,3]
p unique_in_order(['A','A','A']) == ['A']
p unique_in_order([]) == []