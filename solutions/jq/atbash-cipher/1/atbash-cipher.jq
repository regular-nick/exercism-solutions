# Approach: we know that ascii codes for a-z span across numbers 97-122.
# Knowing that, we will explode given string to get number codes.
# Then, we will map reversing to all the numbers in the range 97-122, after which we will implode them back to letters.
# Formula for reversing numbers is: n = -n+(97+122)
# In addition to that, we will need to:
# 1. remove everything except lowercase letters and numbers (range 48-57)
# 2. convert all letters to lowercase
# Before outputting the result we need to add space after every 5th letter
# We will do that by getting the length of final string and create a string with slices like [0:5], [5:10] ... [5n:length] with whitespace in between
def is_numeric:
	if (. >= 48) and (. <= 57) then 
		true 
	else
		false
	end;

def is_alphabetic:
	if (. >= 65) and (. <= 122) then
    		true
	else
    		false
    	end;

def is_alphanum:
    	if (is_numeric) or (is_alphabetic) then
    		true
    	else
		false
	end;

def downcase_alphanum:
    	ascii_downcase
    	| explode
    	| map(select(is_alphanum))
	| implode;

def atbash_switch:
    	explode
    	| map(if is_alphabetic then .*(-1) + (97+122) else . end)
    	| implode;

def split_by_length(msg_l;segment_l):
	[
		range(0;msg_l;segment_l) as $i
		| .[$i:$i+segment_l]
	]
	| join(" ");


if .property == "encode" then
	.input.phrase
	| downcase_alphanum
	| atbash_switch
	| split_by_length(length;5)
elif .property == "decode" then
	.input.phrase
	| downcase_alphanum
	| atbash_switch
else
	"invalid function" | halt_error
end
