% Define the teams
team(liaoning).
team(shandong).
team(hebei).
% Define the states for the medal: 1 for gold, 2 for silver, 3 for bronze, 4 for no medal
medal(1).
medal(2).
medal(3).
medal(4).
% Define the positions for the teams in the competition
pos(liaoning, Medal1) :- medal(Medal1).
pos(shandong, Medal2) :- medal(Medal2).
pos(hebei, Medal3) :- medal(Medal3).
% Define the statements of A, B, C, D
statement(a) :- pos(liaoning, Medal), Medal =< 3.
statement(b) :- pos(liaoning, Medal), Medal > 1.
statement(c) :- (pos(shandong, Medal); pos(hebei, Medal)), Medal =< 3.
statement(d) :- \+ pos(liaoning, 1), pos(shandong, 1).
% Define the rule which says only one of the statements is true
only_one_true :- 
    findall(Person, statement(Person), [Onlyone]),!.
% Facts
