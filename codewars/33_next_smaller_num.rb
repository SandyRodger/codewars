=begin

4 kyu
Next smaller number with the same digits

Write a function that takes a positive integer and returns the next smaller positive integer containing the same digits.

For example:

next_smaller(21) == 12
next_smaller(531) == 513
next_smaller(2071) == 2017
Return -1 (for Haskell: return Nothing, for Rust: return None), when there is no smaller number that contains the same digits. Also return -1 when the next smaller number with the same digits would require the leading digit to be zero.

next_smaller(9) == -1
next_smaller(135) == -1
next_smaller(1027) == -1  # 0721 is out since we don't write numbers with leading zeros
some tests will include very large numbers.
test data only employs positive integers.

P: Write a method that takes an integer and returns the next smallest possible number which can be created from the same digits.

E:

next_smaller(907) == 790
next_smaller(531) == 513
next_smaller(135) == -1 => Return -1 if no smaller digit is possible
next_smaller(2071) == 2017
next_smaller(414) == 144
next_smaller(123456798) == 123456789
next_smaller(123456789) == -1
next_smaller(1234567908) == 1234567890

D:
Input: int
output: int (of same length)

A:

1. Create a helper method to find all possible configurations of the input_int
2. sort all_configs
3. find index of input_int, minus 1 and save in target_idx
4. return target index of sorted_configs

C:
=end

def find_split_num(array)
	split_num = -3
	loop do
		if array.length + split_num == 0 && array[split_num-1] != 0 
			return split_num
		end 
		if array[split_num] == 0
			split_num -= 1
		else 
			return split_num
		end
	end
end


def next_smaller(n)
	array_of_digits = n.to_s.split('').map(&:to_i)
	split_num = find_split_num(array_of_digits)
	loop do
		array_of_digits = n.to_s.split('').map(&:to_i)
		split_num = find_split_num(array_of_digits)
		last_n_digits = array_of_digits[split_num..-1]
		sorted_configs = last_n_digits.permutation.to_a.map(&:join).map(&:to_i).sort
		original_end_num = last_n_digits.join.to_i
		target_idx = sorted_configs.index(original_end_num) -1
		new_end_num = sorted_configs[target_idx]
		return -1 if target_idx < 0
		array_of_digits[split_num..-1] = new_end_num.to_s.split('').map(&:to_i)
		if array_of_digits.size == n.to_s.split('').size
			return array_of_digits.join.to_i
		else
			split_num -= 1
		end
	end
end

p next_smaller(907) == 790
p next_smaller(531) == 513
p next_smaller(135) == -1
p next_smaller(2071) == 2017
p next_smaller(414) == 144
p next_smaller(123456798) == 123456789
p next_smaller(123456789) == -1
p next_smaller(1234567908) == 1234567890
p next_smaller(56006864025651) == 56006864025615
p next_smaller(721) == 712
p next_smaller(12654114470632) == 12654114470623

# ATTEMPT NUMBER 2, WITHOUT PERMUTATION
=begin
# ALGORITHM:

1. ask if the last digit is greater than the penultimate digit.
2. if it is, move on to the prevous 2 digits.
3. find the pair where the answer is yes.
4. swap them.
5 return that number

=end

# def next_smaller(int)
# 	int_arr = int.to_s.split('').map(&:to_i)
# 	minus_two = -2
# 	minus_one = -1
# loop do
# 		if int_arr[minus_two] > int_arr[minus_one]
# 			last_digit = int_arr[minus_two]
# 			int_arr[minus_two] = int_arr[minus_one]
# 			int_arr[minus_one] = last_digit
# 			return int_arr
# 		else
# 			minus_two -= 1
# 			minus_one -= 1
# 			if int_arr.size + minus_two < 0
# 				return -1
# 			end
# 		end
# 	end
# end

# p next_smaller(907) #== 790
# p next_smaller(531) == 513
# p next_smaller(135) == -1
# p next_smaller(2071) == 2017
# p next_smaller(414) == 144
# p next_smaller(123456798) == 123456789
# p next_smaller(123456789) == -1
# p next_smaller(1234567908) == 1234567890
# p next_smaller(56006864025651) == 56006864025615
# p next_smaller(721)# == -1
# 12654114470632 # => 1265411447632 (deleting one of the zeroes)