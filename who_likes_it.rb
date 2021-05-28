# 1 Attempt 1

# names = ["Alex", "Jacob", "Tim", "Elizabeth"]

# def random_items(array)
#   array.sample(0 + rand(array.count))
# end


# def likes(an_array)
# 		input = random_items(an_array)
# 	if input.length == 0
# 	   puts "No one likes this"
# 	elsif input.length == 1
# 		puts "#{input[0]} likes it"
#   else
#     new_i = input.length - 1 
# 		loop do
# 			puts "#{input[new_i]} likes this"
# 			new_i -= 1
# 			break if new_i == 0
# 		end
# 	end
# end

# likes(names)

# Attempt 2 (with Olly)

names = ["Alex", "Jacob", "Tim", "Elizabeth"]

def random_items(array)
  array.sample(0 + rand(array.count))
end

likers = random_items(names)
no_one = []
one_person = ["Mohammed"]
two_people = ["John", "Mary"]

def likes(likers)
  if likers.length == 0
     "no one likes this"
  elsif likers.length == 1
    "#{likers[0]} likes this"
  else 
    all_but_last_name = likers[0..-2]
    all_but_last_names_string = ''
    all_but_last_name.each do |name|
      all_but_last_names_string << "#{name}, "
    end
    all_but_last_names_string = all_but_last_name.join(', ')
    last_name_string = likers[-1]
    "#{all_but_last_names_string} and #{last_name_string} like this"
  end
end

puts likes(likers)
