# Create a new score board with an initial entry.
#   input: none.
#   output: a score board object with a default player and score.
def create_score_board:
    {"The Best Ever": 1000000};
# Add a player to a score board.
#   input: a score board object.
#   output: the score board with the new player added.
def add_player(player;score):
    .[(player | tostring)] = score;
#   input: a score board object.
#   output: the score board with the player removed, if they exist.
def remove_player(player):
    (player|tostring) as $p
        | if has($p) then
            del(.[($p)])
        else
            .
        end;

# Increase a player's score by the given amount.
#   input: a score board object.
#   output: the score board with the player's score increased, if they exist.
def update_score(player; points):
    (player|tostring) as $p
    | if has($p) then
        .[($p)] += points
    else
        .
    end;
# Apply 100 bonus points to all players on the board.
#   input: a score board object.
#   output: the score board with each player's score increased.
def apply_monday_bonus:
    map_values(. + 100);

# Calculate the total score of all players.
#   input: a score board object.
#   output: the sum of all scores, or zero for an empty board.
def total_score:
  to_entries
  | if length == 0 then
        0
    else
        [.[].value]
        | add
    end;
