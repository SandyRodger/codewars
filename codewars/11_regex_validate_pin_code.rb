=begin
7 kyu
Regex validate PIN code

ATM machines allow 4 or 6 digit PIN codes and PIN codes cannot contain anything but exactly 4 digits or exactly 6 digits.

If the function is passed a valid PIN string, return true, else return false.

test cases:

describe "Solution" do
  it "Fixed tests" do
    Test.assert_equals(validate_pin(""),false)
    Test.assert_equals(validate_pin("1"),false)
    Test.assert_equals(validate_pin("1111"),true)
    Test.assert_equals(validate_pin("123456"),true)
    Test.assert_equals(validate_pin("1234567890"),false)
    Test.assert_equals(validate_pin("12"),false)
  end
end

P: Write a method which determines if the input is a 4 digit integer or a 6 digit integer and returns a boolean expressing this.

E:

"1234"   -->  true => Standard
"12345"  -->  false => 5 digits is not valid
"a234"   -->  false => non-integers are not valid.

D:

Regex
strings

A:

1. establish a constant called NUMS 0-9
	- nums = 0..9
2. ask if string includes anything not in nums -  return false if yes.
	string.chars do |char|
		return false if !nums.include?(char)
		end
3. return false if string.size is not 4 or 6.
C:

=end

NUMS = "0".."9"

def validate_pin(pin)
	return false if pin.size != 4 && pin.size != 6
	pin.chars do |char|
		return false if !NUMS.include?(char)
	end
	true
end

p validate_pin("") == false
p validate_pin("1") == false
p validate_pin("1111") == true
p validate_pin("123456") == true
p validate_pin("1234567890") == false
p validate_pin("12") == false