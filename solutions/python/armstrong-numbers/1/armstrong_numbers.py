def is_armstrong_number(number):
    result = 0
    for digit in (digits:=str(number)):
        result += int(digit)**len(digits)

    return result == number
