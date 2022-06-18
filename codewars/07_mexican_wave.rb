def wave(string)
  idx_counter = 0
  chars_array = string.chars
  modified_array = chars_array.each_with_object([]) do |char, array|
    if char == ' '
      array << char
    else
     array << array[0...array.index(char)]
    #  target_char = 
    #  second_half = 
    #  array << first_half
    #  idx_counter += 1
	end
  end
end

p wave("hello") #== ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
#p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
#p wave("") == []
p wave("two words") #== ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
#p wave(" gap ") == [" Gap ", " gAp ", " gaP "]