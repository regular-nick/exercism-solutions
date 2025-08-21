def square(number: int):
    if not 0 < number < 65:
        raise ValueError("square must be between 1 and 64")

    return 2**(number-1)


def total():
    return sum([square(n) for n in range(1,65)])
