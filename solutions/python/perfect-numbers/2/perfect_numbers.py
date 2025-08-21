def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number < 1:
        # if a number to be classified is less than 1.
        raise ValueError("Classification is only possible for positive integers.")

    aliquote_sum = sum(i for i in range(1, number // 2 + 1) if not number % i)

    if aliquote_sum > number:
        return "abundant"
    elif aliquote_sum < number:
        return "deficient"
    return "perfect"
