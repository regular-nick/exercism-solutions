def leap_year(year):
    return any((
                   divisible_by(year, 4) and not divisible_by(year, 100),
                   divisible_by(year, 100) and divisible_by(year, 400)
               ))
    
def divisible_by(number, divisor):
    return not number % divisor
