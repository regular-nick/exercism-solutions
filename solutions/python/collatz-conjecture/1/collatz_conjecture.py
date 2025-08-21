def steps(number):
    if number < 1:
        raise ValueError("Only positive integers are allowed")

    steps = 0
    while number != 1:
        if number % 2:
            # odd number
            steps += 1
            number = 3 * number + 1
        else:
            steps += 1
            number = number >> 1

    return steps
