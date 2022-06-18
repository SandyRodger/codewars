def kebabize(str)
  str = str.gsub(/[\d]/, "")
  str.split(/(?=[A-Z])/).map(&:downcase).join("-")
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'