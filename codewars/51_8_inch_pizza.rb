=begin

https://www.codewars.com/kata/599bb194b7a047b04d000077/train/ruby

6 kyu
8 inch pizza equivalence

How much bigger is a 16-inch pizza compared to an 8-inch pizza? A more pragmatic question is: How many 8-inch pizzas "fit" in a 16-incher?

The answer, as it turns out, is exactly four 8-inch pizzas. For sizes that don't correspond to a round number of 8-inchers, you must round the number of slices (one 8-inch pizza = 8 slices), e.g.:

how_many_pizzas(16) -> "pizzas: 4, slices: 0"
how_many_pizzas(12) -> "pizzas: 2, slices: 2"
how_many_pizzas(8) -> "pizzas: 1, slices: 0"
how_many_pizzas(6) -> "pizzas: 0, slices: 5"
how_many_pizzas(0) -> "pizzas: 0, slices: 0"

P: Write a method which takes am int representing the width of a pizza. THe method should calculate the area of this pizza (area). It should then calculate how many times area fits into the area of an 8 inch pizza (eight_area). For the remainder the method should determine how many slices could be formed, where a slice is an eighth of eight_area.

E: 

how_many_pizzas(16) -> "pizzas: 4, slices: 0" 
how_many_pizzas(12) -> "pizzas: 2, slices: 2" => are these slices rounded up or down, or to the nearest integer?
how_many_pizzas(8) -> "pizzas: 1, slices: 0"
how_many_pizzas(6) -> "pizzas: 0, slices: 5"
how_many_pizzas(0) -> "pizzas: 0, slices: 0"

D: 
Input: int
output: and int
Helper method - find area of a circle from n

A: 

- Write Find area of circle helper method
- initialize CONSTANT area of 8 inch pizza (eight_area)
- initialize CONSTANT 1/8 of 8 inch pizza (eight_slice)
MAIN METHOD
- initiliaze area of n inch pizza (n_area)
- divide n_area by EIGHT_SLICE. save as 'n_slices'
- Divide n_slices by 8 to find n_pizzas
- Find the remainder of n_slices divided by 8 to find slices.

C: 
=end
#how_many_pizzas(16) #-> "pizzas: 4, slices: 0"

EIGHT_INCH_SLICE = 6.283185307179586

def area_of_a_circle(n)
	radius = n/2
	pi = Math::PI
 	area = pi * (radius**2)
end	

def how_many_pizzas(n)
	n_area = area_of_a_circle(n)
	n_slices = n_area / EIGHT_INCH_SLICE 
	total_pizzas = (n_slices / 8).to_i
	total_slices = (n_slices % 8).round 
	"pizzas: #{total_pizzas}, slices: #{total_slices}"
end

p how_many_pizzas(16) == "pizzas: 4, slices: 0"
p how_many_pizzas(12) == "pizzas: 2, slices: 2"
p how_many_pizzas(8) == "pizzas: 1, slices: 0"
p how_many_pizzas(6) == "pizzas: 0, slices: 5"
p how_many_pizzas(0) == "pizzas: 0, slices: 0"
