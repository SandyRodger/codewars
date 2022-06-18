=begin

https://www.codewars.com/kata/57f4ccf0ab9a91c3d5000054/train/ruby

6 kyu
chmod calculator in octal.

A lot of junior developers can be stuck when they need to change the access permission to a file or a directory in a Unix-like operating system.

To do this they can use the chmod command and with some magic trick they can change the permissions of a file or a directory. For more information about the chmod command you can take a look at the wikipedia page.

chmod provides two types of syntax that can be used for changing permissions. An absolute form using octal to denote which permissions bits are set e.g: 766. Your goal in this kata is to define the octal you need to use in order to set your permissions correctly.

Here is the list of the permissions you can set with the octal representation of this one.

User
read (4)
write (2)
execute (1)

Group
read (4)
write (2)
execute (1)

Other
read (4)
write (2)
execute (1)

The method will take a hash in argument and can have a maximum of 3 keys (owner,group,other). Each key will have a 3 chars string to represent the permission, for example the string rw- say that the user want the permission read, write without the execute. If a key is missing set the permission to ---

Note: chmod allow you to set some special flags too (setuid, setgid, sticky bit) but to keep some simplicity for this kata we will ignore this one.

P: Write a method which takes a hash of up to 3 keys where the values are 3 char strings, and returns an integer. The output_int will represent the information in the input_hash. The hash's keys can be 'user', 'group' and 'other'. each key's 3 digits indicate 'read', 'write' and 'execute'. Each permission has a numerical value. This number is the sum of that key's permissions, which is concatenated to form a 3 digit output int. 

E:

User
read (4)
write (2)
execute (1)

Group
read (4)
write (2)
execute (1)

Other
read (4)
write (2)
execute (1)      => 777

chmod_calculator({user: 'rwx', group: 'r-x', other: 'r-x'})  == "755"
chmod_calculator({user: 'rwx', group: 'r--', other: 'r--'}) == "744"
chmod_calculator({user: 'r-x', group: 'r-x', other: 'r-x'}) == "555"
chmod_calculator({group: 'rwx'}) == "070"

D:
Input: hash where the keys are symbols and the values are strings
Output: a 3 digit int.
Iterating through the hash while incrementing counters and storing them in a string.

A:

HELPER METHOD: calculate int total of hash value: (calc_permission_value) argument (string) eg. 'rxw'
	- break string into chars, iterate over chars with an int called output ( equal to 0)
	- if char is r then add 4 to output
	- if char is w then add 2 to output
	- if char is x then add 1 to output
- return output

MAIN METHOD
- initialize an output array containing 3 zeroes (output_arr)
- iterate over the hash looking at key and value (k, v)
- if key is ':user' then add up the int value and reassign it to output_arr at index 0
- otherwise the if key is ':group' then add up the int value and reassign it to output_arr at index 1
- otherwise the if key is ':other' then add up the int value and reassign it to output_arr at index 2
- return output_arr joined into a string.
C:
=end

def calc_permission_value(str)
	output = 0
	str.chars.each do |char|
		if char == 'r'
			output += 4
		elsif char == 'w'
			output += 2
		elsif char == 'x'
			output += 1
		end
	end
	output
end

def chmod_calculator(perm)
  output_arr = Array.new(3, 0)
	perm.each do |k, v|
		if k == :user
			output_arr[0] = calc_permission_value(v)
		elsif k == :group
			output_arr[1] = calc_permission_value(v)
		elsif k == :other
			output_arr[2] = calc_permission_value(v)
		end
	end
	output_arr.join
end

p chmod_calculator({user: 'rwx', group: 'r-x', other: 'r-x'}) == "755"
p chmod_calculator({user: 'rwx', group: 'r--', other: 'r--'}) == "744"
p chmod_calculator({user: 'r-x', group: 'r-x', other: 'r-x'}) == "555"
p chmod_calculator({group: 'rwx'}) == "070"
