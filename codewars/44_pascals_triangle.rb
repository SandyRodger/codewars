=begin
6 kyu
Pascal's Triangle #2

Here you will create the classic Pascal's triangle.
Your function will be passed the depth of the triangle and your code has to return the corresponding Pascal's triangle up to that depth.

The triangle should be returned as a nested array. For example:

pascal(5) -> [ [1], [1,1], [1,2,1], [1,3,3,1], [1,4,6,4,1] ]

To build the triangle, start with a single 1 at the top, for each number in the next row you just take the two numbers above it and add them together, except for the edges, which are all 1. e.g.:

	      1
	    1   1
	  1   2   1
	1   3   3   1
1   4   6   4   1

pascal(1) == [[1]]
pascal(5) == [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

P: Write a method which takes an integer and returns a nested array of integers representing a triangle. The input_int will mark the number of levels in the output_triagle (ie the number of subarrays). Each layer has one more element than the layer preceding it. The last and first integers in these subarrays will be 1. The other integers will be the (layer_number-1)

E:

pascal(1) == [[1]] => just the top level
pascal(5) -> [ [1], [1,1], [1,2,1], [1,3,3,1], [1,4,6,4,1] ] => 
pascal(4) -> [ [1], [1,1], [1,2,1], [1,3,3,1]]
	      1
	    1   1
	  1   2   1
	1   3   3   1
1   4   6   4   1

D:

Input: an integer
output: an array of subarrays containing integers

A: pascal(4) -> [ [1], [1,1], [1,2,1], [1,3,3,1]]

- initialize an output_arr as an array of 1 ([[1]])         [[1]]
- from 2 up to n do this block: |level_num|               2, 3, 4
- initialize 'subarray' as an empty array               subarray = []
- level_num times shovel a number into subarray           2
	- if the subarray is empty then shovel in 1
	- if the subarray has one less element than level_num then
			- shovel in a 1
			- save this subarray as previous array
			- go to the next iteration.
	- shovel in previous_level at this index-1 and this index
		- establish the index i'm trying to fill
		- shovel in previous level at this index -1 added to previous level at this index.
- return output_arr when it's size is equal to n.

C:
=end


def pascal(n)
	output_arr = [[1]]
	previous_array = []
	(2..n).each do |level_num|
		subarray = []
		level_num.times do
			if subarray.empty?
				subarray << 1
			elsif subarray.size+1 >= level_num
				subarray << 1
				previous_array = subarray
				next
			else
				next_idx = subarray.size
				next_num = (previous_array[next_idx-1] + previous_array[next_idx])
			end
		end
		output_arr << subarray
	end
	output_arr
end

p pascal(4) #== [ [1], [1,1], [1,2,1], [1,3,3,1]]
# pascal(1) == [[1]]
# pascal(5) == [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]