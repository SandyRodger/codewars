
def sum_consecutives(ary)
	count = 1
	output = []
	subarray = []
	ary.each_with_index do |num, i|
    if num == ary[i+1]
      count += 1
    else
      count.times{subarray << num}
			output << subarray
      count = 1
			subarray = []
    end
  end
  ary.slice_when{|num1, num2| num1 != num2}.map(&:sum)
  output
end

p sum_consecutives([1, 4, 4, 4, 0, 3, 3, 1]) == [[1], [4, 4, 4], [0], [3,3], [1]]
p sum_consecutives([1,1,7,7,3])
p sum_consecutives([-5,-5,7,7,12,0])