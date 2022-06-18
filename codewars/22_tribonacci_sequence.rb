=begin

6 kyu
Tribonacci Sequence

Well met with Fibonacci bigger brother, AKA Tribonacci.

As the name may already reveal, it works basically like a Fibonacci, but summing the last 3 (instead of 2) numbers of the sequence to generate the next. And, worse part of it, regrettably I won't get to hear non-native Italian speakers trying to pronounce it :(

So, if we are to start our Tribonacci sequence with [1, 1, 1] as a starting input (AKA signature), we have this sequence:

[1, 1 ,1, 3, 5, 9, 17, 31, ...]
But what if we started with [0, 0, 1] as a signature? As starting with [0, 1] instead of [1, 1] basically shifts the common Fibonacci sequence by once place, you may be tempted to think that we would get the same sequence shifted by 2 places, but that is not the case and we would get:

[0, 0, 1, 1, 2, 4, 7, 13, 24, ...]
Well, you may have guessed it by now, but to be clear: you need to create a fibonacci function that given a signature array/list, returns the first n elements - signature included of the so seeded sequence.

Signature will always contain 3 numbers; n will always be a non-negative number; if n == 0, then return an empty array (except in C return NULL) and be ready for anything else which is not clearly specified ;)

If you enjoyed this kata more advanced and generalized version of it can be found in the Xbonacci kata

[Personal thanks to Professor Jim Fowler on Coursera for his awesome classes that I really recommend to any math enthusiast and for showing me this mathematical curiosity too with his usual contagious passion :)]

P: Write a method that takes 2 arguments, an array of 3 ints (signature) and an int (n). It then adds numbers on to the signature until the size is n. The numbers added are the sum of the previous 3 ints.

E:

p tribonacci([1,1,1],10) #== [1,1,1,3,5,9,17,31,57,105] => standard
tribonacci([0,0,1],10) == [0,0,1,1,2,4,7,13,24,44]
tribonacci([0,1,1],10) == [0,1,1,2,4,7,13,24,44,81]
tribonacci([1,0,0],10) == [1,0,0,1,1,2,4,7,13,24]
tribonacci([0,0,0],10) == [0,0,0,0,0,0,0,0,0,0] => if signatrure is all 0s, output will be all 0s.
tribonacci([1,2,3],10) == [1,2,3,6,11,20,37,68,125,230]
tribonacci([3,2,1],10) == [3,2,1,6,9,16,31,56,103,190]
tribonacci([1,1,1],1) == [1] => output can be shorter than signature
tribonacci([300,200,100],0) == [] => if n is 0, output is []
tribonacci([0.5,0.5,0.5],30) == [0.5,0.5,0.5,1.5,2.5,4.5,8.5,15.5,28.5,52.5,96.5,177.5,326.5,600.5,1104.5,2031.5,3736.5,6872.5,12640.5,23249.5,42762.5,78652.5,144664.5,266079.5,489396.5,900140.5,1655616.5,3045153.5,5600910.5,10301680.5] => signature can be floats.

D:
Input: array of ints + int
output = array of ints

A:

1. case statement for n less than or equal to 3. 
2. otherwise signature << signature[-3..-1].sum
3. return signature if signature count is num

C:

=end

def tribonacci(signature,n)
	return [] if n == 0
	return signature[0...n] if n <= 3
	loop do
		signature << signature[-3..-1].sum
		return signature if signature.size == n
	end
end

p tribonacci([1,1,1],10) == [1,1,1,3,5,9,17,31,57,105]
p tribonacci([0,0,1],10) == [0,0,1,1,2,4,7,13,24,44]
p tribonacci([0,1,1],10) == [0,1,1,2,4,7,13,24,44,81]
p tribonacci([1,0,0],10) == [1,0,0,1,1,2,4,7,13,24]
p tribonacci([0,0,0],10) == [0,0,0,0,0,0,0,0,0,0]
p tribonacci([1,2,3],10) == [1,2,3,6,11,20,37,68,125,230]
p tribonacci([3,2,1],10) == [3,2,1,6,9,16,31,56,103,190]
p tribonacci([1,1,1],1) == [1]
p tribonacci([300,200,100],0) == []
p tribonacci([0.5,0.5,0.5],30) == [0.5,0.5,0.5,1.5,2.5,4.5,8.5,15.5,28.5,52.5,96.5,177.5,326.5,600.5,1104.5,2031.5,3736.5,6872.5,12640.5,23249.5,42762.5,78652.5,144664.5,266079.5,489396.5,900140.5,1655616.5,3045153.5,5600910.5,10301680.5]