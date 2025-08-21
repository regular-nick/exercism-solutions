# We will need to use the following formula of the circle:
# x^2 + y^2 = R^2
# We have 3 circles, outer, middle and inner, with following radiuses
# Outer		- 10 	(R^2 is 100)
# Middle	- 5 	(R^2 is 25)
# Inner		- 1	(R^2 is 1)
# Approach to the solution is 
# 1. To take x and y (real numbers) as inputs
# 2. Calculate x^2 + y^2
# 3. Compare this value with 1(c1), 25(c2) and 100(c3).
# c1. return 10
# c2. return 5
# c3. return 1
# c4 (value is more than 100) return 0

def squares_sum(x;y):
    [x, y] 
    | map(pow(.;2)) 
    | add;
def score:
    if . <= 1 then
    	10
    elif . <= 25 then
    	5
    elif . <= 100 then
    	1
    else
    	0
    end;

squares_sum(.x;.y) | score
