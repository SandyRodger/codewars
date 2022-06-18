=begin

https://www.codewars.com/kata/525caa5c1bf619d28c000335/ruby

5 kyu
Tic-Tac-Toe Checker


If we were to set up a Tic-Tac-Toe game, we would want to know whether the board's current state is solved, wouldn't we? Our goal is to create a function that will check that for us!

Assume that the board comes in the form of a 3x3 array, where the value is 0 if a spot is empty, 1 if it is an "X", or 2 if it is an "O", like so:

[[0, 0, 1],
 [0, 1, 2],
 [2, 1, 0]]
We want our function to return:

-1 if the board is not yet finished AND no one has won yet (there are empty spots),
1 if "X" won,
2 if "O" won,
0 if it's a cat's game (i.e. a draw).
You may assume that the board passed in is valid in the context of a game of Tic-Tac-Toe.

P: Write a method which takes an array of 3 subarrays, each containing 3 single char strings ("X", "O" or "0"). The method should determine which of 4 states the input indicates: 

1. not full + no winner    (output -1) 
2. "X" has won             (output 1) 
3. "O" has won             (output 2) 
4. full + no winner        (output 0).

E: 

is_solved([[2,1,2],[1,1,2],[2,2,1]])  ==  0 => If there are no zeroes then it's full
is_solved([[0,0,1],[0,1,2],[2,1,0]])  == -1 => Unfinished
is_solved([[0,0,1],[2,2,2],[2,1,0]])  ==  2 => Winning board for 2
is_solved([[1,0,1],[0,1,2],[2,1,1]])  ==  1 => winning board for 1

D: 
Input: array of 3 subarrays each containing single-char strings.
Output: an integer: -1, 0, 1, 2

A: 

- Create a constant of WINNING_boardS
- Make a LV for full_board, x_win and o_win = false
- ask if input contains the three things above
- Depending on the answer, return the right output.

C: 
=end

 def win_finder(board, token)
	case 
		# VERTICAL WINS
	when board[0] == token && board[3] == token && board[6] == token
		true
	when board[1] == token && board[4] == token && board[7] == token
		true
	when board[2] == token && board[5] == token && board[8] == token
		true
		#HORIZONTAL WINS
	when board[0] == token && board[1] == token && board[2] == token
		true
	when board[3] == token && board[4] == token && board[5] == token
		true
	when board[6] == token && board[7] == token && board[8] == token
		true
		# DIAGONAL WINS
	when board[0] == token && board[4] == token && board[8] == token
		true
	when board[6] == token && board[4] == token && board[2] == token
		true
	else
		false
	end
end



def is_solved(array)
	flat_arr = array.flatten
	flat_arr.include?(0) ? full_board = false : full_board = true
	if !win_finder(flat_arr, 1) && !win_finder(flat_arr, 2) 
		full_board ? 0 : -1
	elsif win_finder(flat_arr, 1)
		1
	elsif win_finder(flat_arr, 2)
		2
	end
end

p is_solved([[0,0,1],[0,1,2],[2,1,0]])  == -1
p is_solved([[0,0,1],[2,2,2],[2,1,0]])  ==  2
p is_solved([[1,0,1],[0,1,2],[2,1,1]])  ==  1
p is_solved([[2,1,2],[1,1,2],[2,2,1]])  ==  0
p is_solved([[0,1,1], [2,0,0], [0,1,2]])  ==  -1
p is_solved([[2, 1, 2], [0, 2, 2], [0, 0, 2]]) == 2

#failed:

# Expected: -1, instead got: 1
# Log
# Testing board: [[0, 1, 1], [2, 0, 0], [0, 1, 2]] # works for me!

# Expected: 2, instead got: 1
# Log
# Testing board: [[0, 0, 0], [2, 0, 0], [0, 0, 2]]
# Expected: 2, instead got: -1
# Log
# Testing board: [[2, 2, 0], [2, 1, 2], [1, 0, 2]]
# Expected: -1, instead got: 2
# Log
# Testing board: [[2, 2, 1], [1, 0, 1], [0, 1, 2]]
# Expected: -1, instead got: 1
# Log
# Testing board: [[1, 0, 2], [2, 0, 2], [0, 0, 1]]
# Expected: 2, instead got: -1
# Log
# Testing board: [[1, 0, 0], [2, 2, 2], [2, 1, 1]]
# Expected: -1, instead got: 1
# Log
# Testing board: [[2, 0, 0], [2, 2, 0], [1, 0, 2]]
# Expected: 2, instead got: -1
# Log
# Testing board: [[1, 1, 0], [0, 1, 1], [1, 0, 1]]
# Expected: -1, instead got: 1
# Log
# Testing board: [[2, 0, 2], [1, 2, 1], [2, 0, 0]]
# Expected: 2, instead got: -1
# Log
# Testing board: [[0, 2, 2], [0, 1, 2], [0, 0, 0]]
# Expected: 2, instead got: -1
# Log
# Testing board: [[0, 0, 2], [1, 0, 1], [2, 1, 1]]
# Expected: -1, instead got: 1
# Log
# Testing board: [[1, 0, 2], [0, 0, 0], [2, 0, 0]]