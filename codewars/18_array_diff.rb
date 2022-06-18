=begin

6 kyu
Array.diff

Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.

It should remove all values from list a, which are present in list b keeping their order.

array_diff([1,2],[1]) == [2]

If a value is present in b, all of its occurrences must be removed from the other:

P: Write a method which takes two arrays as arguments, each containing integers. Remove all ints from arr_1 which occurs in arr_2. Both arrs can be empty.

E:

array_diff([1,2], [1]) == [2], # "a was [1,2], b was [1], expected [2]")
array_diff([1,2,2], [1]) == [2,2],#  "a was [1,2,2], b was [1], expected [2,2]")
array_diff([1,2,2], [2]) == [1], # "a was [1,2,2], b was [2], expected [1]")
array_diff([1,2,2], []) == [1,2,2], # "a was [1,2,2], b was [], expected [1,2,2]")
array_diff([], [1,2]), [] == # "a was [], b was [1,2], expected []")
array_diff([1,2,3], [1,2]) == [3], # "a was [1,2,3], b was [1, 2], expected [3]")

D: 

Input: array of ints *2
Ouput = array of ints * 1

A:

1. Iterate over each int in arr_1
2. If that it is not included in int_2, shovel it into a new array

=end

def array_diff(arr_1, arr_2)
	arr_1.each_with_object([]) do |int, array|
		if !arr_2.include?(int)
			array << int
		end
	end
end
 
p array_diff([1,2], [1]) == [2]       # "a was [1,2], b was [1], expected [2]")
p array_diff([1,2,2], [1]) == [2,2]        #  "a was [1,2,2], b was [1], expected [2,2]")
p array_diff([1,2,2], [2]) == [1]          # "a was [1,2,2], b was [2], expected [1]")
p array_diff([1,2,2], []) == [1,2,2]        # "a was [1,2,2], b was [], expected [1,2,2]")
p array_diff([], [1,2]) == []          # "a was [], b was [1,2], expected []")
p array_diff([1,2,3], [1,2]) == [3]          # "a was [1,2,3], b was [1, 2], expected [3]")
