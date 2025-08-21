def collatz_step:
    if . % 2 == 0 then ./2 else .*3 + 1 end;

def steps:
    if . < 1 then "Only positive integers are allowed" | halt_error 
    else [while(. != 1; . | collatz_step)] | length end;
    