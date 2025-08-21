def is_triangle(sides):
    try:
        a, b, c, *rest = sides
    except ValueError:
        return False
    if rest:
        return False

    if any([a + b < c, a + c < b, b + c < a, min(a, b, c) <= 0]):
        return False
    return True


def equilateral(sides):
    return is_triangle(sides) and len(set(sides)) == 1


def isosceles(sides):
    return is_triangle(sides) and len(set(sides)) < 3


def scalene(sides):
    return is_triangle(sides) and len(set(sides)) == len(sides)
