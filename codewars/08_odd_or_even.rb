=begin

Given a list of integers, determine whether the sum of its elements is odd or even.

Give your answer as a string matching "odd" or "even".

If the input array is empty consider it as: [0] (array with a zero).

Examples:
Input: [0]
Output: "even"

Input: [0, 1, 4]
Output: "odd"

Input: [0, -1, -5]
Output: "even"

=end

def odd_or_even(array)
  array.sum.odd? ? "odd" : "even"
end


p odd_or_even([0]) == "even"
p odd_or_even([1]) == "odd"
p odd_or_even([]) == "even"
p odd_or_even([-1023, 1, -2]) == "even"
p odd_or_even([-1023, -1, 3]) == "odd"
