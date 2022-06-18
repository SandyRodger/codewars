=begin

https://www.codewars.com/kata/51e04f6b544cf3f6550000c1/train/ruby

kyu 5
Beeramid

Let's pretend your company just hired your friend from college and paid you a referral bonus. Awesome! To celebrate, you're taking your team out to the terrible dive bar next door and using the referral bonus to buy, and build, the largest three-dimensional beer can pyramid you can. And then probably drink those beers, because let's pretend it's Friday too.

A beer can pyramid will square the number of cans in each level - 1 can in the top level, 4 in the second, 9 in the next, 16, 25...

Complete the beeramid function to return the number of complete levels of a beer can pyramid you can make, given the parameters of:

your referral bonus, and

the price of a beer can

For example:

beeramid(1500, 2); // should === 12
beeramid(5000, 3); // should === 16


P: Write a method that takes  2 integers (dollars, beer_price). The method finds num_of_beers by dividing beer_price by dollars (total_beers). Then calculate how many complete levels can be made of total_beers where each level is a squared number. Return that integer.

E:

beeramid(5000, 3); // should === 16 => 1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, ... 16 * 16 == 256

total_beers = 1666
layer_1 = 1*1 == 1   total beers = 1665
layer_2 = 2*2 == 4   total beers = 1661
layer_3 =  3*3 == 9   total beers = 1652
layer_4 =  4*4 == 16    total beers = 1636
layer_5 = 5*5 ==  25  total beers = 1611
layer_6 =  6*6==  36  total beers = 1575
layer_7 = 7*7 ==  49  total beers = 1526
layer_8 = 8*8 == 64   total beers = 1462
layer_9 = 9*9 == 81   total beers = 1381
layer_10 = 10*10 == 100   total beers =  1281
layer_11 = 11*11 == 121   total beers = 1160
layer_12 = 12*12 ==  144  total beers = 1016
layer_13 = 13*13 ==  169  total beers = 847
layer_14 = 14*14 ==  196  total beers = 651
layer_15 = 15*15 ==  225  total beers = 426
layer_16 =  16*16 == 256  total beers = 170
left_overs = 17 * 17 == 289

beeramid(9, 2) ==  1 =? beers are $4, you can make a layer of 1, but not the second layer of 4
beeramid(21, 1.5) ==  3 => price can be a float
beeramid(-1, 4) ==  0 => dollars can be minus, which will always return 0
beeramid(5000, 3) == 16
beeramid(1500, 2) == 12

D:
Input: 2 ints (beer_money, beer_price)
Output: 1 int (possible_layers)

A:

- if beer_money (9) is less than beer_price (2), return 0. 
- Determine total_beers available.
	- beer_money/beer_price. 9/2 = 4
- initialize layer_num as 1
- If layer_num squared subtracted from total_beers is equal to or more than 0, then:
	- subtract layer_num squared from total_beers
	- increment layer_num by 1
	- repeat
- otherwise return layer_num

C:

=end


def beeramid(beer_money, beer_price)
  return 0 if beer_money < beer_price
	layer_num = 1
	total_beers = (beer_money/beer_price)
	loop do
		total_beers -= layer_num ** 2
		layer_num += 1
		if total_beers < (layer_num ** 2)
			return layer_num - 1
		end
	end
end

p beeramid(9, 2) ==  1
p beeramid(21, 1.5) ==  3
p beeramid(-1, 4) ==  0
p beeramid(5000, 3) == 16
p beeramid(1500, 2) == 12