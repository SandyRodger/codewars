=begin 

https://www.codewars.com/kata/5517fcb0236c8826940003c9/train/ruby

6 kyu
Irreducible Sum of Rationals

You will have a list of rationals in the form

list = [ [numer_1, denom_1] , ... , [numer_n, denom_n] ]

where all numbers are positive integers. You have to produce their sum N / D in an irreducible form: this means that N and D have only 1 as a common divisor.

Return the result in the form: [N, D]
If the result is an integer (D evenly divides N) return: an integer 
If the input list is empty, return nil

Example:

[ [1, 2], [1, 3], [1, 4] ]  -->  [13, 12]
1/2  +  1/3  +  1/4     =      13/12

P: write a method which takes some fractions and returns a single fraction representing these fractions added together with the lowest common d

E: 

p sumFracts([[1, 2], [1, 3], [1, 4]]) #== [13, 12]

2 * 6 == 12
3 * 4 == 12
4 * 3 == 12

p sumFracts([[1, 3], [5, 3]]) #== 2

3 * 1 == 3
6/3 == 2/1 == 2

p sumFracts([[1, 2], [1, 3]]) #== [5, 6]

2 * 3 == 6
3 * 2 == 6

p sumFracts([[1, 2], [2, 3], [6, 9]]) # == [11, 6]
2 * 9 = 18
3 * 6 = 18
9 * 2 = 18
9 + 12 + 12 = 33/18 (divided by 3) == 11/6 

D: 

Input: array of subarrays containing 2 integers each
Output = a single array containing 2 integers.

A: 

p sumFracts([[1, 2], [2, 3], [6, 9]]) # == [11, 6]
2 * 9 = 18
3 * 6 = 18
9 * 2 = 18
9 + 12 + 12 = 33/18 (divided by 3) == 11/6 
Algorithm:

HELPER_METHOD_1: 'find common_d'
- method should take only denoms
- Count up from 2, calling the number n
- if n can divide every number in denoms without a remainder then return that number.
if there is no common_denom return false.


HELPER METHOD 2: FIND LOWEST COMMON DIVISOR FOR TOTAL: (33, 18) => [11, 6]
- create an array of nums from 2 to denom (potential_divider)
- select elems in potential_divider which can divide both numer and denom cleanly. (dividers)
- return the highest num in dividers
  
HELPER METHOD 3: Create uniform numers 
  - iterate through numers, returning a transformed array (save as uniform_numers)
  - for each numer divide com_de by numer (save as multiple)
  - multiply numer by multiple

MAIN METHOD:
- Isolate denoms and numers in arrays              # => [2, 3, 9]
- save return value of find_common_d as 'com_de'
- save as 'uni_numers' return value of 'make_uniform_numers'
- Initialise 'total' as an array containing the sum of numers and com_de.
- In 'total', if the numer is divisible by denom with no remainder, then return the result of the division.
- If there is a 'lowest divider' divide both elements in 'total' by 'lowest_divider' and return result
otherwise return total

Code:

=end

def find_common_denom(denoms)
  com_de = denoms.max
  loop do
    return com_de if denoms.all?{|d| com_de % d == 0}
    com_de += 1
  end
end

def find_total_denom(total_fraction)
  potential_divider = (2..total_fraction[1]).to_a
  dividers = potential_divider.select do |elem|
    total_fraction[0] % elem == 0 && total_fraction[1] % elem == 0 
  end
  dividers.max == nil ? false : dividers.max
end

def make_uniform_numers(numers, denoms, com_de)
  idx = 0
  numers.map do |n|
    multiple = com_de/denoms[idx]
    idx += 1
    n * multiple
  end
end

def sumFracts(list)
  denoms = list.map{|frac|frac[1]}
  numers = list.map{|frac|frac[0]}
  com_de = find_common_denom(denoms)
  uni_numers = make_uniform_numers(numers, denoms, com_de)
  total = [uni_numers.sum, com_de]
  return total[0]/total[1] if total[0] % total[1] == 0
  lowest_divisor = find_total_denom(total)
  if lowest_divisor
    return total.map{|i|i/lowest_divisor}
  end
    total
end

# p sumFracts([[1, 2], [1, 3], [1, 4]]) == [13, 12]
# p sumFracts([[1, 3], [5, 3]]) == 2
# p sumFracts([[1, 2], [2, 3], [6, 9]]) == [11, 6]

def sum_rationals(rationals)
  rationals.map do |n, d|
    Rational(n, d)
  end.sum
end

def sumFracts(rationals)                     
  return nil if rationals.empty?
  total = sum_rationals(rationals) 
  n = total.numerator    
  d = total.denominator
  n % d == 0 ? n / d : [n, d]
end

p sumFracts([[1, 2], [1, 3], [1, 4]]) == [13, 12]
p sumFracts([[1, 3], [5, 3]]) == 2
p sumFracts([[1, 2], [2, 3], [6, 9]]) == [11, 6]