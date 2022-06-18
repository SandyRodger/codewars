# Instructions: Write a function that takes an integer as input, and returns the number of bits that are equal to one in the binary representation of that number. You can guarantee that input is non-negative.

# Example: The binary representation of 1234 is 10011010010, so the function should return 5 in this case binary_number = ''

# def remove_zeroes(binary_number)
#   binary_as_string = binary_number.to_s
# 	only_ones = binary_as_string.delete"1"
# 	only_ones.length
# end

# def integer_to_binary (an_integer)
#   binary_number = "%b" % an_integer
# end

# def counts_bits(binary_number)
# 	remove_zeroes(binary_number)
# end

# puts "what number would you like to process?"
# user_number = gets.chomp

# binary_number = integer_to_binary(user_number)
# final_output = counts_bits(binary_number)

# puts "your number has #{final_output} zeroes, when written in binary"

# Attempt to make it work in Codewars:

def count_bits(user_number)
  binary_number = "%b" % user_number
  binary_as_string = binary_number.to_s
  only_ones = binary_as_string.delete"0"
  only_ones.length
end

puts counts_bits(493)