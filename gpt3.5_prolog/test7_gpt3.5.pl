% Define that there is at least one Cantonese who doesn't like chili
dislike_chili(X) :- cantonese(X).
% If a person is Cantonese and dislikes chili, then there is at least one Southern Chinese who dislikes chili
southern_chinese(Y) :- dislike_chili(Y).
% Define a Czech is not a hen
not_a_hen(Czech) :- czech(Czech).
% Define the scenario of a Czech being called by roosters
called_by_roosters(Czech) :- czech(Czech).
% Define the logical fallacy that if a Czech is not a hen, then he is not called by roosters
is_called_by_roosters(X) :- not_a_hen(X), not(called_by_roosters(X)).
% One fact, He is a Czech who is called by roosters but not a hen
czech(john).
called_by_roosters(john).
not_a_hen(john).
?- is_called_by_roosters(Who).
