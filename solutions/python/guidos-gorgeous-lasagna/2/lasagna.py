"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""
EXPECTED_BAKE_TIME = 40


def bake_time_remaining(time_elapsed: int) -> int:
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    if time_elapsed > EXPECTED_BAKE_TIME:
        # Great, you burnt your lasagna
        return None
    return EXPECTED_BAKE_TIME - time_elapsed


def preparation_time_in_minutes(layers: int, time_per_layer: int = 2) -> int:
    """Calculate lasagna preparation time based on amount of layers. We assume that with each layer preparation time increases by time_per_layer.
    
    :param layers: int - number of layers in the lasagna
    :param time_per_layer: int - time of cooking per layer (default 0)

    :return: int - total preparation time of lasagna
    """

    return layers * time_per_layer
    

#TODO: define the 'elapsed_time_in_minutes()' function below.
# Remember to add a docstring (you can copy and then alter the one from bake_time_remaining.)
def elapsed_time_in_minutes(layers: int, time_elapsed: int) -> int:
    """Calculate the elapsed cooking time.
    
    :param layers: int - number of layers in the lasagna
    :param time_elapsed: int - elapsed cooking time
    :return: int - total time elapsed (in minutes) preparing and cooking.
    """
    return preparation_time_in_minutes(layers) + time_elapsed
