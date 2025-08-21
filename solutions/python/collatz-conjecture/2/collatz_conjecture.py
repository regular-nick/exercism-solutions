def steps(number):
    if number < 1:
        raise ValueError("Only positive integers are allowed")

    steps = 0
    while number != 1:
        steps +=1
        number = 3 * number + 1 if number % 2 else number >> 1

    return steps
