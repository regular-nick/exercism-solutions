def is_triangle(f):
    def inner(sides):
        try:
            a, b, c, *rest = sides
        except ValueError:
            return False
        if rest:
            return False
        if any([max(a, b, c) * 2 > a + b + c, min(a, b, c) <= 0]):
            return False

        return f(sides)

    return inner


@is_triangle
def equilateral(sides):
    return len(set(sides)) == 1


@is_triangle
def isosceles(sides):
    return len(set(sides)) < 3


@is_triangle
def scalene(sides):
    return len(set(sides)) == 3
