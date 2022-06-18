# Jaden Smith, the son of Will Smith, is the star of films such as The Karate Kid (2010) and After Earth (2013). Jaden is also known for some of his philosophy that he delivers via Twitter. When writing on Twitter, he is known for almost always capitalizing every word. For simplicity, you'll have to capitalize each word, check out how contractions are expected to be in the example below.

# Your task is to convert strings to how they would be written by Jaden Smith. The strings are actual quotes from Jaden Smith, but they are not capitalized in the same way he originally typed them.

# Example:

# Not Jaden-Cased: "How can mirrors be real if our eyes aren't real"
# Jaden-Cased:     "How Can Mirrors Be Real If Our Eyes Aren't Real"


#   def toJadenCase(a_sentence)
#    each_word = a_sentence.split
# 	 capitalized_array = each_word.each {|n|n.capitalize!}
#    puts capitalized_array.join(" ")
#   end

# toJadenCase("I hope this works")

# Tryng to get it to work in Codecademy

str = "How can mirrors be real if our eyes aren't real"

class String
  def toJadenCase(a_sentence)
   a_sentence.split = each_word
	 capitalized_array = each_word.each{|n| n.capitalize!}
   puts capitalized_array.join(" ")
  end
end

JadenCase = String.new()
JadenCase.first = "How can mirrors be real if our eyes aren't real"

puts JadenCase.first