=begin

https://www.codewars.com/kata/559a28007caad2ac4e000083

5 kyu
Perimeter of squares in a rectangle

The drawing shows 6 squares the sides of which have a length of 1, 1, 2, 3, 5, 8. It's easy to see that the sum of the perimeters of these squares is : 4 * (1 + 1 + 2 + 3 + 5 + 8) = 4 * 20 = 80

Could you give the sum of the perimeters of all the squares in a rectangle when there are n + 1 squares disposed in the same manner as in the drawing:

alternative text

Hint:
See Fibonacci sequence

Ref:
http://oeis.org/A000045

The function perimeter has for parameter n where n + 1 is the number of squares (they are numbered from 0 to n) and returns the total perimeter of all the squares.

perimeter(5)  should return 80
perimeter(7)  should return 216

P: Write a method which takes an int and returns a larger int. Input_int + 1 is the number of squares to process. Make a fibonacci sequence of that number. Find the sum of it and multiply it by 4.

E:

perimeter(5) == 80
perimeter(7) == 216

=> 8 squares
1, 1, 2, 3, 5, 8, 13, 21 totaled is 54 * 4 = 216

perimeter(20) == 114624
perimeter(30) == 14098308
perimeter(100) == 6002082144827584333104

D:
Input: number of squares - 1 (int)
output: total perimeter length)int)

A:

- Find all the fibonacci numbers at n+1 place.
	- 
- sum that number
- multiply it by 4.

C:

=end

def fibonacci(n)
	(2..n).each_with_object([1, 1]){|_, output| output << output[-2] + output[-1]}
end

def perimeter(n)
	fibonacci(n).sum * 4
end


p perimeter(5) == 80
p perimeter(7) == 216
p perimeter(20) == 114624
p perimeter(30) == 14098308
p perimeter(100) == 6002082144827584333104