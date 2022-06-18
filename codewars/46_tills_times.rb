=begin
There is a queue for the self-checkout tills at the supermarket. Your task is write a function to calculate the total time required for all the customers to check out!

input
customers: an array of positive integers representing the queue. Each integer represents a customer, and its value is the amount of time they require to check out.
n: a positive integer, the number of checkout tills.

output
The function should return an integer, the total time required.

queue_time([5,3,4], 1)
# should return 12
# because when n=1, the total time is just the sum of the times

queue_time([10,2,3,3], 2)
# should return 10
# because here n=2 and the 2nd, 3rd, and 4th people in the 
# queue finish before the 1st person has finished.

p queue_time([2,2,3,3,4,4], 2) == 9 

till_1: 2, 3, 4 ==9
till_1: 2, 3, 4 ==9

queue_time([10,2,3,3], 2) == 10

till_1 = 10
till_2 = 2, 3, 3 



- figure out how long each till will take and return the longest till.
- 

C:
=end



def queue_time(customers, till_count)
  #hash= Hash.new(0)
  tills = Array.new(till_count,0) # tills = [0, 0] tills = [0, 0, 0]
  customers.each { |service_time| tills[tills.index(tills.min)] += service_time }
  tills.max
end

p queue_time([], 1) == 0
p queue_time([5], 1) == 5
p queue_time([2], 5) ==  2
p queue_time([1,2,3,4,5], 1) == 15
p queue_time([1,2,3,4,5], 100) ==  5
p queue_time([2,2,3,3,4,4], 2) == 9