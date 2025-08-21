def invalid_input:
    # test if there are characters other than digits and whitespaces
    test("[^\\d\\s]+") or test("^\\s*0\\s*$") or (length < 2);

def luhn_algorithm:
    gsub("\\s+";"") / ""
    | map(tonumber)
    | reverse
    | ([.[range(1;length;2)]] | map(.*2 | if . > 9 then .-9 else . end)) as $even
    | ([.[range(0;length;2)]]) as $odd
    | $even + $odd
    | add % 10 == 0;

if invalid_input then
    false
else
    luhn_algorithm
end
