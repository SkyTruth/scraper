#baseballtest

import random


inning_results = {0:0, 1:0, 2:0, 3:0, 4:0}
game_results = {}

max_strikes = 3
max_outs = 3
max_hits = 4
max_innings = 9
max_games = 1000

def play_inning (deck):
    random.shuffle (deck)
    outs = 0 
    i = 0
    hits = 0
    strikes = 0
    
    while outs < max_outs and hits < max_hits:
        
        if deck[i] > hits:
            hits += 1
            strikes = 0
        else:
            strikes += 1
            if strikes == max_strikes:
                strikes = 0
                outs += 1
        i += 1   
    return {'hits':hits, 'outs':outs}

def play_game ():
    deck = [1, 1, 2, 2, 3, 3, 4, 4]
    for c in range (len(deck), 52):
        deck.append (0)
        
    for inning in range (1, max_innings + 1):
        if inning in (3, 5, 7, 9):
            deck.append (4)
        result = play_inning(deck)
        inning_results[result['hits']] += 1
        if result['hits'] == 4:
            return inning
    return 0


for i in range (0, max_innings + 1):
    game_results[i] = 0
    
for game in range (max_games):
    game_results[play_game ()] += 1
        
    
print inning_results
print game_results