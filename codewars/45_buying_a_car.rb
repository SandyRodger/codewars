=begin

https://www.codewars.com/kata/554a44516729e4d80b000012/train/ruby

6 kyu - Buying a car

Let us begin with an example:

	A man has a rather old car being worth $2000. He saw a secondhand car being worth $8000. He wants to keep his old car until he can buy the secondhand one.
	
	He thinks he can save $1000 each month but the prices of his old car and of the new one decrease by 1.5 percent per month. Furthermore this percent of loss increases by 0.5 percent at the end of every two months. Our man finds it difficult to make all these calculations.
	
	Can you help him?
	
	How many months will it take him to save up enough money to buy the car he wants, and how much money will he have left over?
	
	Parameters and return of function:
	
	parameter (positive int or float, guaranteed) start_price_old (Old car price)
	parameter (positive int or float, guaranteed) start_price_new (New car price)
	parameter (positive int or float, guaranteed) saving_per_month 
	parameter (positive float or int, guaranteed) percent_loss_by_month
	
	nbMonths(2000, 8000, 1000, 1.5) should return [6, 766]

	Detail of the above example:
	end month 1: percent_loss 1.5 available -4910.0
	end month 2: percent_loss 2.0 available -3791.7999...
	end month 3: percent_loss 2.0 available -2675.964
	end month 4: percent_loss 2.5 available -1534.06489...
	end month 5: percent_loss 2.5 available -395.71327...
	end month 6: percent_loss 3.0 available 766.158120825...
	return [6, 766] or (6, 766)

	where 6 is the number of months at the end of which he can buy the new car and 766 is the nearest integer to 766.158... (rounding 766.158 gives 766).
	
	Note:
	
	Selling, buying and saving are normally done at end of month. Calculations are processed at the end of each considered month but if, by chance from the start, the value of the old car is bigger than the value of the new one or equal there is no saving to be made, no need to wait so he can at the beginning of the month buy the new car:
	
	nbMonths(12000, 8000, 1000, 1.5) should return [0, 4000]
	nbMonths(8000, 8000, 1000, 1.5) should return [0, 0]

	We don't take care of a deposit of savings in a bank:-)

	P: Write a method which takes 4 arguments, indicating 1) the price of a car 2) the price of desired_car 3) The man's income and 4) the rate of depreciation for 1 and 2. the method should calculate 2 things. 1) how long it will take the man to afford the car and 2) how much money he'll have left.

	E:

	nbMonths(2000, 8000, 1000, 1.5) == [6, 766]

	end month 1: percent_loss 1.5 available -4910.0 
		- he sells car for 
	end month 2: percent_loss 2.0 available -3791.7999...
	end month 3: percent_loss 2.0 available -2675.964
	end month 4: percent_loss 2.5 available -1534.06489...
	end month 5: percent_loss 2.5 available -395.71327...
	end month 6: percent_loss 3.0 available 766.158120825...
	return [6, 766] or (6, 766)

	where 6 is the number of months at the end of which he can buy the new car and 766 is the nearest integer to 766.158... (rounding 766.158 gives 766).


	nbMonths(12000, 8000, 1000, 1.5) == [0, 4000]

	D:
	input =  4 integers
	output = an array with 2 integers

	car_1 = 2000
	car_2 = 8000
	car_1 = car_1 - ((car_1.to_f / 100) * 1.5)
	car_2 = car_2 - ((car_2.to_f / 100) * 1.5)
	money = 1000
	p car_2 - (car_1 + money)

	A:

	- initialize LVs for car_1_price, car_2_price, months_past, percent_loss, bank
	- calculate data after 1 month
		- enter a loop
		- if bank is greater than car_2_price, then return months past and the remainder of bank minus car_2 price. 
		-	reassign car_1 price
		- reassign car_2 price
		- if months_past is even reassign percent_loss
		- reassign bank
		- increment months_past by 1

	C:

=end

def nbMonths(c1, c2, income, percentloss)
	return [0, 0] if c1 == c2
	months = 0
	bank = 0
	loop do
		pot_bank = bank + c1
		return [months, (pot_bank - c2).round] if pot_bank > c2
		bank += income 
		c1 -= ((c1.to_f / 100) * percentloss)
		c2 -= ((c2.to_f / 100) * percentloss)
		months += 1
		percentloss += 0.5 if months.odd?	
	end
end

p nbMonths(2000, 8000, 1000, 1.5) == [6, 766]
p nbMonths(12000, 8000, 1000, 1.5) == [0, 4000]
p nbMonths(8000, 8000, 1000, 1.5) == [0, 0]