#from here: https://github.com/plum-umd/cmsc330-public/tree/master/discussions/week1

# Complete all of the following functions using code blocks, and the data 
# structure specified in the section heading comment

#### Array Functions

# Takes an array of integers and returns a new array containing
# only the even entries in the input array 
# (Note: there are a lot of different ways to do this)
def evens(arr) 

end

=begin

my solution:
//wait nvrmind, needs to return a NEW ARRAY. this one modifies original.
def evens(arr) 
	arr.each do |num|
		if (num % 2 != 0)
			arr.delete(num)
		end
	end
end


my solution 2:
def evens(arr) 
	new_arr = [];
	arr.each do |num|
		if (num % 2 == 0)
			new_arr << num
			#can also do: new_arr.push(num)
		end
	end
	return new_arr
end

=end

# Takes an array and returns an array with all occurences of old
# replaced with rep (Note: there are A LOT of different ways to do this too)
def replace_all(arr, old, rep)

end

=begin

my solution 1:
def replace_all(arr, old, rep)
	arr.each_index do |i|
		arr[i] = rep if arr[i] == old
	end
end

my solution 2:
def replace_all(arr, old, rep)
	# .map! modifies the array itself!
	arr.map! { |element| element == old ? rep : element}
end

=end

# Takes a sorted array and a value and inserts the value in sorted order
def insert_sorted(arr, val)

end

=begin

my solution 1:
def insert_sorted(arr, val)
	arr << val
	arr.sort
end

my solution 2:
def insert_sorted(arr, val)
	arr.each_index do |i|
		if i+1 < arr.length && arr[i] <= val && arr[i+1] >= val
			arr.insert(i+1, val)
			return arr
		end
	end
	arr << val
end

=end

# Takes two arrays and returns an array with elements from the two input 
# arrays alternating. Cuts off any trailing values if the two input arrays
# are of different length
def cut_combine(arr1, arr2)

end

=begin

def cut_combine(arr1, arr2)
	smaller = arr1.length > arr2.length ? arr2.length : arr1.length
	new_arr = []
	#note that for x..y, y is inclusive!
	(0..smaller - 1).each do |i|
		new_arr << arr1[i]
		new_arr << arr2[i]
	end
	return new_arr	
end


=end

#### Hash Functions

# Takes a hash and returns an array containing each key in the hash multiplied 
# by its value
#
# Ex: mult_vals({1=>2,4=>4}) => [2,16]
def mult_vals(hash)

end

=begin

def mult_vals(hash)
	result = []
	a.each_key {|key| result << (key*a[key])}
	return result
end

#given solution
	a = []
	hash.each{ |key, value| a << key*value }
	return a
	
#hash.map also returns an array, so like: hash.map{|key, value| key*value}

=end

# Takes a string and outputs a hash with each unique word
# as a key, and the number of times it occurs as the value
#
# Bonus: modify the skeleton to use regular expressions instead of split
def freq(str)
    arr = str.split(" ")    # splits the string, by spaces, into an array

end

=begin

my solution 1:

def freq(str)
    arr = str.split(" ")    # splits the string, by spaces, into an array
	new_hash = Hash.new(-1) # set default val for non-existent key to -1
	arr.each do |word|
		if new_hash[word] == -1
			new_hash[word] = 1
		else
			new_hash[word] += 1 # no ++ operator in Ruby (and also Python!)
		end
	end
	return new_hash
end

my solution 2:

def freq(str)
	new_hash = Hash.new(-1) # set default val for non-existent key to -1
	# look for strings of non-whitespace chars
	str.scan(/[^\s]+/).each do |word| 
		if new_hash[word] == -1
			new_hash[word] = 1
		else
			new_hash[word] += 1
		end
	end
	return new_hash
end

=end


# Takes an array of integers and returns the x^n, where x is the
# most frequently occuring number in the array and n is the number
# of times it occurs
def freq_power(arr)

end

=begin

my solution: 

def freq_power(arr)
	new_hash = Hash.new(-1)
	arr.each do |num|
		new_hash[num] = new_hash[num] == -1 ? 1 : new_hash[num] + 1
	end
	max_val = new_hash.values.max 
	return new_hash.key(max_val) ** max_val 
end

=end


#### Regular Expressions

# Takes a string and returns true if the string represents a decimal
# and false otherwise
# Valid examples: “+1.0”, “+1”, “-124.124”, “1”, “-1”
# Invalid examples: “1,000.0”, “1.1.1”
def is_decimal(str)

end

=begin

my solution:

# the only problem I can think of with this is if the str is like "0123"
# this program would return true, but it should be false
def is_decimal(str)
	matches = str.scan(/^[-+]?[\d]*[\.]?[\d]+$/)
	if matches.length != 1
		return false
	end
	return true
end

=end

# Takes a string and returns an array of all valid decimal numbers
# in the string
def find_all_decimals(str)

end

=begin

my solution: 

# print find_all_decimals("Valid examples: +1.0,+1,'-124.124','1','-1' Invalid examples: 1,000.0, '1.1.1' blah blah")
# for the above case, it mostly works except for the 1,000.0.

def find_all_decimals(str)

	new_arr = []
	#first find numbers in string
	start_i = -1
	end_i = -1
	i = 0
	while (i < str.length) do
		if (i+1 < str.length) && 
		(str[i] == '+' || str[i] == '-' || !(/[0-9]/.match(str[i])).nil?)
			#start of number
			start_i = i
			#keep going in string until end is found
			# three dots (...) means up to str.length, but not including!
			(start_i+1...str.length).each do |j|
				if !(/[',\s]/).match(str[j]).nil? && str[j] != '.' #!(/[^\d]/).match(str[j]).nil?
					end_i = j - 1
					break
				end
			end
			#start and end are found, get substring and check it
			substring = str[start_i..end_i]
			if is_decimal(substring)
				new_arr << substring
			end
			#move past substring end index
			i = end_i + 1
			next
		end
		i += 1
	end
	return new_arr

end


=end

# Takes a string that is a comma delineated list of names, and returns
# an array with all of the names from the input that are formatted correctly
# Names must start with a capital letter, have all other letters be lowercase,
# and include no extraneous characters.
# Ex: check_names("Damien,aDam,0Daniel,Jake,GREG") => ["Damien","Jake"]
def check_names(str)

end

=begin

my solution: 

def check_names(str)
	arr = str.split(",")
	arr.each_index do |i|
		if arr[i].match(/^[A-Z][a-z]+$/).nil? 
			arr[i] = nil
		end
	end
	#remove nil elements
	return arr.compact
end

=end

#### Challenge Problem

# For the following function, a two element array [x, y] can be
# treated as an graph edge, from x to y. So a graph defined as
# [[1,2],[2,3],[4,3],[4,1]] would look like this:
#
#       4 -> 3
#(down) |    | (up)
#       1 -> 2  
#
# and reachable([[1,2],[2,3],[4,3],[4,1]], 1, 2) would return true
# but reachable([[1,2],[2,3],[4,3],[4,1]], 1, 4) would return false
#
# Takes a list of edges and two vertices, a and b, and returns
# a boolean indicating whether there is a path between a and b.
def reachable(graph, v1, v2)

end
