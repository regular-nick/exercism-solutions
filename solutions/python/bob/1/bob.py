def response(hey_bob):
    match (hey_bob.strip(), hey_bob.isupper(), hey_bob.strip().endswith("?")):
        case ("", *_):
            return "Fine. Be that way!"
        case (_, True, True):
            return "Calm down, I know what I'm doing!"
        case (_, True, _):
            return "Whoa, chill out!"
        case (_, _, True):
            return "Sure."
    return "Whatever."
