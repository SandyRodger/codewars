=begin

https://www.codewars.com/kata/53db96041f1a7d32dc0004d2/train/ruby

Write a function done_or_not/DoneOrNot passing a board (list[list_lines]) as parameter. If the board is valid return 'Finished!', otherwise return 'Try again!'

Sudoku rules:

Complete the Sudoku puzzle so that each and every row, column, and region contains the numbers one through nine only once.

Rows:


There are 9 rows in a traditional Sudoku puzzle. Every row must contain the numbers 1, 2, 3, 4, 5, 6, 7, 8, and 9. There may not be any duplicate numbers in any row. In other words, there can not be any rows that are identical.

In the illustration the numbers 5, 3, 1, and 2 are the "givens". They can not be changed. The remaining numbers in black are the numbers that you fill in to complete the row.

Columns:


There are 9 columns in a traditional Sudoku puzzle. Like the Sudoku rule for rows, every column must also contain the numbers 1, 2, 3, 4, 5, 6, 7, 8, and 9. Again, there may not be any duplicate numbers in any column. Each column will be unique as a result.

In the illustration the numbers 7, 2, and 6 are the "givens". They can not be changed. You fill in the remaining numbers as shown in black to complete the column.

Regions

A region is a 3x3 box like the one shown to the left. There are 9 regions in a traditional Sudoku puzzle.

Like the Sudoku requirements for rows and columns, every region must also contain the numbers 1, 2, 3, 4, 5, 6, 7, 8, and 9. Duplicate numbers are not permitted in any region. Each region will differ from the other regions.

In the illustration the numbers 1, 2, and 8 are the "givens". They can not be changed. Fill in the remaining numbers as shown in black to complete the region.

P: 

Write a method that takes a nested array of subarrays containing 9 integers. It should determine whether the subarrays make a correct sudoku or not. i.e. whether the ints of each subarray at the same index make 1-9.

E:

p done_or_not
([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
	[6, 7, 2, 1, 9, 5, 3, 4, 8],
	[1, 9, 8, 3, 4, 2, 5, 6, 7],
	[8, 5, 9, 7, 6, 1, 4, 2, 3],
	[4, 2, 6, 8, 5, 3, 7, 9, 1],
	[7, 1, 3, 9, 2, 4, 8, 5, 6],
	[9, 6, 1, 5, 3, 7, 2, 8, 4],
	[2, 8, 7, 4, 1, 9, 6, 3, 5],
	[3, 4, 5, 2, 8, 6, 1, 7, 9]]) #== 'Finished!'
				 
# done_or_not([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
# 	[6, 7, 2, 1, 9, 0, 3, 4, 9],
# 	[1, 0, 0, 3, 4, 2, 5, 6, 0],
# 	[8, 5, 9, 7, 6, 1, 0, 2, 0],
# 	[4, 2, 6, 8, 5, 3, 7, 9, 1],
# 	[7, 1, 3, 9, 2, 4, 8, 5, 6],
# 	[9, 0, 1, 5, 3, 7, 2, 1, 4],
# 	[2, 8, 7, 4, 1, 9, 6, 3, 5],
# 	[3, 0, 0, 4, 8, 1, 1, 7, 9]] ==  'Try again!'

D:

input: an array of subarrays. subarrays each contain 9 integers between 1 and 9
output: a string message

A:

COLUMNS:
1. iterate over each sub-array, taking the ints from the column.
 - make an array of the column  using #map
2. if that number has already been seen in that index then return fail message
	- sort the array and ask if it is the same as 1-9
3. if not, and you get to index 9 then do the same for index 2, until index 9 is reached
4. If you get to the end of the outer-iteraton then end the method with a pass-message. 

REGION FINDER:

0. Establish where the quadrants are. Iterate through 1-9 with a hash
1. make the key the region_number and the hash the numbers in the region.
1. initialize 3 constant sections: 
	- first = 0..2
	- second = 3..5
	- third = 6..8
2. iterate through rows and columns at the same time with index.
3. if FIRST has row and column...

row = FIRST, column = FIRST = Region 1
row = FIRST, column = SECOnd = Region 2
row = FIRST, column = THIRD= Region 3
row = SECOND, column = FIRST = Region 4
row = SECOND, column = SECOND = Region 5
row = SECOND, column = THIRD = Region 6
row = THIRD, column = FIRST = Region 7
row = THIRD, column = SECOND = Region 8
row = THIRD, column = THIRD = Region 9

C:

=end

FIRST = (0..2).to_a
SECOND = (3..5).to_a
THIRD = (6..8).to_a
FULL_SET = (1..9).to_a
board_1 = [[5, 3, 4, 6, 7, 8, 9, 1, 2], 
[6, 7, 2, 1, 9, 5, 3, 4, 8],
[1, 9, 8, 3, 4, 2, 5, 6, 7],
[8, 5, 9, 7, 6, 1, 4, 2, 3],
[4, 2, 6, 8, 5, 3, 7, 9, 1],
[7, 1, 3, 9, 2, 4, 8, 5, 6],
[9, 6, 1, 5, 3, 7, 2, 8, 4],
[2, 8, 7, 4, 1, 9, 6, 3, 5],
[3, 4, 5, 2, 8, 6, 1, 7, 9]]
board_2 = [[5, 3, 4, 6, 7, 8, 9, 1, 2], 
[6, 7, 2, 1, 9, 0, 3, 4, 9],
[1, 0, 0, 3, 4, 2, 5, 6, 0],
[8, 5, 9, 7, 6, 1, 0, 2, 0],
[4, 2, 6, 8, 5, 3, 7, 9, 1],
[7, 1, 3, 9, 2, 4, 8, 5, 6],
[9, 0, 1, 5, 3, 7, 2, 1, 4],
[2, 8, 7, 4, 1, 9, 6, 3, 5],
[3, 0, 0, 4, 8, 1, 1, 7, 9]]

def make_hash
	hash = (0..8).each_with_object({}) do |quad, hsh|
		hsh [quad] = []
	end
end

def region_finder(board)
	hash =  make_hash
  (0..8).each do |row_idx|
		row = board[row_idx]
		row.each_with_index do |int, column_idx|
			case
			when FIRST.include?(row_idx) && FIRST.include?(column_idx)
				hash [0] << int
			when FIRST.include?(row_idx) && SECOND.include?(column_idx)
				hash [1] << int
			when FIRST.include?(row_idx) && THIRD.include?(column_idx)
				hash [2] << int
			when SECOND.include?(row_idx) && FIRST.include?(column_idx)
				hash [3] << int
			when SECOND.include?(row_idx) && SECOND.include?(column_idx)
				hash [4] << int
			when SECOND.include?(row_idx) && THIRD.include?(column_idx)
				hash [5] << int
			when THIRD.include?(row_idx) && FIRST.include?(column_idx)
				hash [6] << int
			when THIRD.include?(row_idx) && SECOND.include?(column_idx)
				hash [7] << int
			when THIRD.include?(row_idx) && THIRD.include?(column_idx)
				hash [8] << int
			end
		end
	end
	hash
end

# p region_finder(board_1)

def is_invalid?(array)
	array.sort != FULL_SET
end

def done_or_not(board)
	regions = region_finder(board)
	(0..8).each do |idx|
		column = board.map{|subarr| subarr[idx]} 
		if is_invalid?(column) || is_invalid?(board[idx]) || is_invalid?(regions[idx])
			return 'Try again!' 
		end
	end
	'Finished!'
end

p done_or_not(board_1) == 'Finished!'
p done_or_not(board_2) ==  'Try again!'

