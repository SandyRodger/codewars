=begin
2. 6 kyu - Equal Sides Of An Array

You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:

Let's say you are given the array {1,2,3,4,3,2,1}:
Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

Let's look at another one.
You are given the array {1,100,50,-51,1,1}:
Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.

Last one:
You are given the array {20,10,-80,10,10,15,35}
At index 0 the left side is {}
The right side is {10,-80,10,10,15,35}
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

Note: Please remember that in most programming/scripting languages the index of an array starts at 0.

Input:
An integer array of length 0 < arr < 1000. The numbers in the array can be any integer positive or negative.

Output:
The lowest index N where the side to the left of N is equal to the side to the right of N. If you do not find an index that fits these rules, then you will return -1.

Note:
If you are given an array with multiple answers, return the lowest correct index.

Examples:

find_even_index([1,2,3,4,3,2,1]),3)
find_even_index([1,100,50,-51,1,1]),1)
find_even_index([1,2,3,4,5,6]),-1)
find_even_index([20,10,30,10,10,15,35]),3)
find_even_index([20,10,-80,10,10,15,35]),0)
find_even_index([10,-80,10,10,15,35,20]),6)
find_even_index(Array(1..100)),-1)
find_even_index([0,0,0,0,0]),0,"Should pick the first index if more cases are valid")
find_even_index([-1,-2,-3,-4,-3,-2,-1]),3)
find_even_index(Array(-100..-1)),-1)

P: Write a method which takes an array of integers (positve and negative) and return an integer representing an index from the array. The index must be in a position where the sum of the ints to the left of it is the same as the sum of the ints to the right of it. Return the first index that fulfils this, if there is none, return -1.

E:

find_even_index([1,2,3,4,3,2,1]),3) => left_ints == 6, right_ints = 6. Standard
find_even_index([1,100,50,-51,1,1]),1) => l/r == 1 (adds minus and positive ints)
find_even_index([1,2,3,4,5,6]),-1) => no index fulfills criteria
find_even_index([20,10,30,10,10,15,35]),3)  l/r == 60
find_even_index([20,10,-80,10,10,15,35]),0) l/r == 0 (one side can be empty array , which is 0)
find_even_index([10,-80,10,10,15,35,20]),6) Asa above, but here it is the right side of the array which is empty. without the last 20, both sides equal 0.
find_even_index(Array(1..100)),-1) => no index works
find_even_index([0,0,0,0,0]),0, => "Should pick the first index if more cases are valid")
find_even_index([-1,-2,-3,-4,-3,-2,-1]),3) => all minuses - nice
find_even_index(Array(-100..-1)),-1)

D:

Input: array of ints
Output = single int representing idx

A:
find_even_index([1,2,3,4,3,2,1]) == 3

1. Iterate over the array with each_with_index |int, idx|

2. for each int establish the sum of digits to the left and right
	- if [0...idx].sum == [(idx+1)..-1].sum return idx
3. if they';re the same return that index
4. If you get to the end of the interation without havibng returned an index, retun the final value of -1.

C:

Time: 24 mins

=end

def find_even_index(arr)
  arr.each_with_index do |_ , idx|
		if arr[0...idx].sum == arr[(idx+1)..-1].sum
			return idx
		end
	end
	-1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1