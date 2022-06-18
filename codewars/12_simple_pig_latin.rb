# ALPHABET = "a".."z"

# def pig_it(text)
#   modified_sentence = text.split(' ').map do |word|
# 		if !ALPHABET.include?(word[0].downcase)
# 			next word
# 		end
# 		word[1..-1] + word[0] + 'ay'
# 	end
# 	modified_sentence.join(" ")
# end

# Codewars solution:

def pig_it text
  text.split.map{|word| word =~ /\w/ ? "#{word[1..-1]}#{word[0]}ay" : word}.join(" ")
end

p pig_it('Pig latin is cool') == "igPay atinlay siay oolcay"
p pig_it('Hello world !') ==  "elloHay orldway !"
p pig_it('Cucullus non facit monachum') ==  "ucullusCay onnay acitfay onachummay" # => "ucullusCay onay acitfay onachumay"
p pig_it('O tempora o mores !') ==  "Oay emporatay oay oresmay !" # => "O emporatay o oresmay !"
p pig_it('O -emp-ora o mores !') ==  "Oay emp-ora-ay oay oresmay !" # => "O emporatay o oresmay !"

