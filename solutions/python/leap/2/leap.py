def leap_year(year):
    if year % 100:
        # if year is not divisible by 100
        return year % 4 == 0
    return year % 400 == 0
