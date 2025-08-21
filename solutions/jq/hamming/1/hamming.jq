# Function to calculate humming distance
# Error message: strands must be of equal length
if (.strand1 | length) != (.strand2 | length) then
"strands must be of equal length" else
[.strand1, .strand2 | explode]
| transpose
| map(select(.[0] != .[1]))
| length
end
