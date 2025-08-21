# I retry since it seems that recursive solution was intended
def steps:
    # base cases
    if . < 1 then 
        "Only positive integers are allowed" | halt_error
    elif . == 1 then 
        0 
    # recursive cases
    elif . % 2 == 0 then # even number
        1 + (./2 | steps)
    else # odd number
        1 + (.*3 + 1 | steps) 
    end;