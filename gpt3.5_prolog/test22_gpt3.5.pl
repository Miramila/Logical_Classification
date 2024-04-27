Your provided Prolog code is almost correct, but with one slight fallacy. The predicate not is used incorrectly. Instead of that, the predicate \+ should be used. The correct Prolog statements including the sample data (Facts) and query are:
% Define that there is at least one Cantonese who doesn't like chili
cantonese(X) :- dislike_chili(X).
% If a person is Cantonese and dislikes chili, then there is at least one Southern Chinese who dislikes chili
southern_chinese(Y) :- cantonese(Y), dislike_chili(Y).
% Define that there is at least one Cantonese who likes neither peppers nor sweets
likes_neither_peppers_nor_sweets(X) :- cantonese(X), \+ likes_peppers(X), \+ likes_sweets(X).
% Check if the above statement implies that there is at least one Southern Chinese who dislikes chili
% (Assuming that liking neither peppers nor sweets implies not liking chili)
guarantee_statement(Y) :- likes_neither_peppers_nor_sweets(Y), dislike_chili(Y).
% Facts (assuming we have someone who meets the criteria for the answer)
dislike_chili(sam).
% sam does not like peppers
\+ likes_peppers(sam).
% sam does not like sweets
\+ likes_sweets(sam).
And the query is:
?- guarantee_statement(Who).
