=begin

6 kyu
Delete occurrences of an element if it occurs more than n times

Enough is enough!
Alice and Bob were on a holiday. Both of them took many pictures of the places they've been, and now they want to show Charlie their entire collection. However, Charlie doesn't like these sessions, since the motif usually repeats. He isn't fond of seeing the Eiffel tower 40 times.
He tells them that he will only sit for the session if they show the same motif at most N times. Luckily, Alice and Bob are able to encode the motif as a number. Can you help them to remove numbers such that their list contains each number only up to N times, without changing the order?

Task
Given a list and a number, create a new list that contains each number of list at most N times, without reordering.
For example if the input number is 2, and the input list is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2], drop the next [1,2] since this would lead to 1 and 2 being in the result 3 times, and then take 3, which leads to [1,2,3,1,2,3].
With list [20,37,20,21] and number 1, the result would be [20,37,21].

P: Write a method that takes an array of ints (order) and an int (max_e) and deletes ints which have already occured max_e times.

E:
D:
A:


1. Iterate over the array with another array as an object
2. If a number has not occured in output_arr counter times, then shovel it into output_arr
3. Otherwise skip it
4 return output arr

C:
=end

def delete_nth(order,max_e)
	order.each_with_object([]) do |int, array|
		if array.count(int) < max_e
			array << int
		end
	end
end

p delete_nth([20,37,20,21], 1) == [20,37,21]                          # "From array [20,37,20,21],1 you get")
p delete_nth([1,1,3,3,7,2,2,2,2], 3) == [1, 1, 3, 3, 7, 2, 2, 2]      # "From array [1,1,3,3,7,2,2,2,2],3 you get")
