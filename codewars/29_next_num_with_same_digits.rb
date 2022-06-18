=begin

https://www.codewars.com/kata/55983863da40caa2c900004e/train/ruby

4 kyu

Next bigger number with the same digits

Create a function that takes a positive integer and returns the next bigger number that can be formed by rearranging its digits. For example:

12 ==> 21
513 ==> 531
2017 ==> 2071
nextBigger(num: 12)   // returns 21
nextBigger(num: 513)  // returns 531
nextBigger(num: 2017) // returns 2071
If the digits can't be rearranged to form a bigger number, return -1:

9 ==> -1
111 ==> -1
531 ==> -1
nextBigger(num: 9)   // returns nil
nextBigger(num: 111) // returns nil
nextBigger(num: 531) // returns nil

P: Write a method that takes an int and returns the next biggest int which can be formed from those digits.

E:

9 ==> -1
111 ==> -1
531 ==> -1
12 ==> 21
513 ==> 531
2017 ==> 2071
12 ==>  21
513 ==>  531
2017 ==> 2071
414 ==> 441
144 ==> 414

D:
Input int
Output int

A:

1. turn int into an array of chars
2. find all substrings
3. turn sibstrings back to ints
4. sort ints
5. return number after input_int
6. if int is the last number, return -1

C:

=end

def find_all_substrings(int)
	substrings = int.to_s.chars.permutation.to_a
	substrings.map(&:join).map(&:to_i)
end

def next_bigger(n)
  substrings = find_all_substrings(n)
	sorted_substrings = substrings.sort.uniq
	target_idx = sorted_substrings.index(n) + 1
	sorted_substrings = sorted_substrings.uniq
	sorted_substrings[target_idx]
end

p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(414) == 441
p next_bigger(144) == 414