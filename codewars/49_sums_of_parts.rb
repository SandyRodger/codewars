=begin

https://www.codewars.com/kata/5ce399e0047a45001c853c2b

6 kyu
Sums of Parts

Let us consider this example (array written in general format):

ls = [0, 1, 3, 6, 10]

Its following parts:

ls = [0, 1, 3, 6, 10]
ls = [1, 3, 6, 10]
ls = [3, 6, 10]
ls = [6, 10]
ls = [10]
ls = []
The corresponding sums are (put together in a list): [20, 20, 19, 16, 10, 0]

The function parts_sums (or its variants in other languages) will take as parameter a list ls and return a list of the sums of its parts as defined above.

Other Examples:
ls = [1, 2, 3, 4, 5, 6] 
parts_sums(ls) -> [21, 20, 18, 15, 11, 6, 0]

ls = [744125, 935, 407, 454, 430, 90, 144, 6710213, 889, 810, 2579358]
parts_sums(ls) -> [10037855, 9293730, 9292795, 9292388, 9291934, 9291504, 9291414, 9291270, 2581057, 2580168, 2579358, 0]

Notes
Take a look at performance: some lists have thousands of elements.
Please ask before translating.

P: Write a method which takes an array of integers. The array calculates the sum of its elements, then removes the element at index 1 and repeats. These sums are stored in an output array, which is then returned.

E:

ls = [0, 1, 3, 6, 10]

ls = [0, 1, 3, 6, 10]  => zero can be aprt of the array
ls = [1, 3, 6, 10]
ls = [3, 6, 10]
ls = [6, 10]
ls = [10]
ls = []                => the empty array is always considered at the end. so the last element will always be zero.

The corresponding sums are (put together in a list): [20, 20, 19, 16, 10, 0]

ls = [1, 2, 3, 4, 5, 6] 
parts_sums(ls) -> [21, 20, 18, 15, 11, 6, 0]

ls = [744125, 935, 407, 454, 430, 90, 144, 6710213, 889, 810, 2579358]
parts_sums(ls) -> [10037855, 9293730, 9292795, 9292388, 9291934, 9291504, 9291414, 9291270, 2581057, 2580168, 2579358, 0]

parts_sums([]) == [0]

D: 
input: Array of integers
Output: array of diminishing integers

A:

- if list is empty retrun [0].
- save sum of list as 'total' in an array ('output_arr')
- iterate through list
- for each int, subtract it from total and put it in output_arr
- return output arr

C:

=end

def parts_sums(list)
	return [0] if list.empty?
	list.each_with_object([list.sum]) do |int, output|
		output << output[-1] - int
	end
end

p parts_sums([]) == [0]
p parts_sums([0, 1, 3, 6, 10]) == [20, 20, 19, 16, 10, 0]
p parts_sums([1, 2, 3, 4, 5, 6]) == [21, 20, 18, 15, 11, 6, 0]
p parts_sums([744125, 935, 407, 454, 430, 90, 144, 6710213, 889, 810, 2579358]) == [10037855, 9293730, 9292795, 9292388, 9291934, 9291504, 9291414, 9291270, 2581057, 2580168, 2579358, 0]
		