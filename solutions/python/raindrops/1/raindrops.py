def convert(number):
    div_string_pairs = {"Pling": 3, "Plang": 5, "Plong": 7}
    s = ""
    for string, divisor in div_string_pairs.items():
        if number % divisor == 0:
            s += string
    if s:
        return s
    return str(number)
