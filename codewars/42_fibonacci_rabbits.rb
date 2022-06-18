=begin

6 kyu
Fibonacci Rabbits

In his publication Liber Abaci Leonardo Bonacci, aka Fibonacci, posed a problem involving a population of idealized rabbits. These rabbits bred at a fixed rate, matured over the course of one month, had unlimited resources, and were immortal.

Create a function that determines the number of pairs of mature rabbits after n months, beginning with one immature pair of these idealized rabbits that produce b pairs of offspring at the end of each month.

To illustrate the problem, consider the following example:

n = 5 months
b = 3 births
-> 19 mature rabbit pairs

Month	Immature pairs	Mature pairs
0	1	0
1	0	1
2	3	1
3	3	4
4	12	7
5	21	19

P: Write a method which takes 2 integers representing number of months and offspring_per_month and outputs number of mature rabbits produced in this time. 

E: 

n = 5 months
b = 3 births
-> 19 mature rabbit pairs

Month	|    Immature pairs|     	Mature pairs
0			|    			1				|     			0
1			|    			0				|     			1
2			|    			3				|     			1
3			|    			3				|     			4
4			|    			12			|     			7
5			|    			21			|     			19

D: 

input:  2 ints
output: 1 int

A: 

- if months is less than 1, return 0
- if months is 1, return 1
- Initialize an array of month, im_pairs, ma_pairs starting at month 2  = [2, offspring_per_month, 1]
	- THE CALCULATION
	- add 1 to month
	- add im_pairs to ma_pairs
	- im_pairs is now ma_pairs * monthly_offspring
- Until the first column equals months, do a calculation, but when it does equal months then return index 2

C: 

=end

def fib_rabbits(months, offspring_per_month)
  return 0 if months < 1
	return 1 if months == 1
	mim= [2, offspring_per_month, 1]
	ma_pairs = 0
	loop do
		return mim[2] if mim[0] == months
		mim[0] += 1
		ma_pairs = mim[2]
		mim[2] += mim[1]
		mim[1] = (ma_pairs * offspring_per_month)
	end
end

p fib_rabbits(5, 3) == 19
p fib_rabbits(0, 4) == 0
p fib_rabbits(1, 4) == 1
p fib_rabbits(4, 0) == 1
p fib_rabbits(6, 3) == 40
p fib_rabbits(8, 12) == 8425
p fib_rabbits(7, 4) == 181