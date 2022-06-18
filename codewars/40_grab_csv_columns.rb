=begin

https://www.codewars.com/kata/5276c0f3f4bfbd5aae0001ad

5 kyu
Grab CSV Columns

Task:
Write a function that takes a CSV (format shown below) and a sequence of indices, which represents the columns of the CSV, and returns a CSV with only the columns specified in the indices sequence.

CSV format:
The CSV passed in will be a string and will have one or more columns, and one or more rows. The CSV will be of size NxM. Each row is separated by a new line character \n. There will be no spaces in the CSV string.

Example format of passed in CSV: "1,2,3\n4,5,6\n7,8,9\n10,11,12"

How it would look:

1,2,3
4,5,6
7,8,9
10,11,12

Indices Array info:
The indices will be zero based, so the first column will be represented as a 0 in the indices sequence. All values in the indices sequence will be integers from 0 and up. All test cases will have an indices sequence of one or more integers. Ignore indices that map to a column that doesn't exist. If all the values in the indices array do NOT map to any existing column, return an empty string "".

The columns of the result must be ordered and not repeated.

Examples:
csvColumns("1,2,3\n4,5,6", [0, 1]) => "1,2\n4,5"
csvColumns("1,2\n3,4\n5,6", [5, 6, 7]) => ""
csvColumns("a,b,c,d,e\n1,2,3,4,5\nf,g,h,i,j", [1, 3, 5, 7]) => "b,d\n2,4\ng,i"

P: Write a method which takes a string (csv) and an array (indices) and returns a modified string (output). The csv will represent rows of chars seperated by '\n' and the indices will mark which columns should be included in the output. indices which do not exist in the csv will be ignored. If no indices corelate to the input an empty string will be returned.

E:

csvColumns("1,2,3\n4,5,6", [0, 1]) => "1,2\n4,5"

1, 2, 3
4, 5, 6      => columns at idx 0 and 1 return "1,2\n4,5"

csvColumns("1,2\n3,4\n5,6", [5, 6, 7]) => ""

1, 2
3, 4
5, 6  => there is no columns 5 - 7, soman empty string is returned

csvColumns("a,b,c,d,e\n1,2,3,4,5\nf,g,h,i,j", [1, 3, 5, 7]) => "b,d\n2,4\ng,i"

a,b,c,d,e
1,2,3,4,5
f,g,h,i,j     => at columns 1 and 3 we have objects "b,d\n2,4\ng,i"
							=> columns 5 and 7 do not exist and so are ignored.

D:

Input: string
output: string
Arrays ?

A:

- make a version of string stripped of everything except the new lines.
- break stripped_str into an array of \ns
- create a rows_arr, with each row separated into a subarray.
-  iterate over rows arr, call each row 'row'
- reverse the row
- in each row, iterate over the indices
		- use minus (idx+1) to account for the reversal
		- if the char at that index of row is not nil, then prepend it to n_block at that idx with a ","
- transfor the n_block array by getting rid of the penultimate char, which is a comma.
- flatten this array and join it into a string, which is returned.

C:
=end

def output_formatter(n_blocks, char_blocks, indices)
row_idx = 0
n_blocks.each do |n_block|
	row = char_blocks[row_idx]
		indices.each_with_index do |idx, idx2|
			char = row[idx]
			if idx2 == 0
				n_block.unshift(char)
			else
			  n_block.unshift("#{char},")
			end
		end
		row_idx += 1
		next
	end
		last_chunk = char_blocks[-1]
	indices.each do |idx|
		n_blocks << "#{last_chunk[idx]},"
	end
	output = n_blocks.flatten.join[0...-1]
	if output.gsub(/\n/,"") == ""
		return ""
	end
	output
end

p output_formatter([["\n"]], ["123", "456"], [0, 1]) #== "1,2\n4,5"

def csv_columns(csv, indices)
	n_blocks = csv.gsub(/[^(\n)]+/,"").chars.map{|char|[char]}              # => [["\n"], ["\n"]]
	char_blocks = csv.split("\n").map{|subarr|subarr.gsub(",","")}            # => ["123", "456"]
	limited_indices = indices.select{|idx|idx < char_blocks[0].size}  			# => [0, 1]
	output_formatter(n_blocks, char_blocks, limited_indices)
end

# p csv_columns( "1,2\n3,4\n5,6", [5, 6, 7]) == ""
# p csv_columns( "1,2,3\n4,5,6" , [0, 1] ) == "1,2\n4,5"
# p csv_columns( "a,b,c,d,e\n1,2,3,4,5\nf,g,h,i,j" , [1, 3, 5, 7] ) == "b,d\n2,4\ng,i"
# p csv_columns( "1\n2\n3\n4\n5" , [0, 1] ) == "1\n2\n3\n4\n5"
# p csv_columns( "1\n2\n3\n4\n5" , [1] ) == ""