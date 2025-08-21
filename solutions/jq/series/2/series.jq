# .sliceLength as $len
# | [.series[range(0;$len):]]
# | map(
#    match("\\d{\($len)}";"g") 
#    | .string
#    ) 
# Invalid solution, doesn't get series in order of appearance
def check_input(string_len; slice_len):
    if string_len == 0 then
        "series cannot be empty"
        | halt_error
    elif slice_len == 0 then
        "slice length cannot be zero"
        | halt_error
    elif slice_len < 0 then
        "slice length cannot be negative"
        | halt_error
    elif slice_len > string_len then
        "slice length cannot be greater than series length"
        | halt_error 
    else
        .
    end;

.sliceLength as $slice_len
| (.series | length) as $string_len
| check_input($string_len; $slice_len)
| [.series]
| map(
    (range(0;$string_len-$slice_len+1)) as $start
    | .[$start:$start+$slice_len]
    )
