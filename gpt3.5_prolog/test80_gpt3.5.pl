% Define that there is at least one Cantonese who doesn't like chili
dislike_chili(X) :- cantonese(X).
% If a person is Cantonese and dislikes chili, then there is at least one Southern Chinese who dislikes chili
southern_chinese(Y) :- cantonese(Y), dislike_chili(Y).
% Define that there is at least one Cantonese who likes neither peppers nor sweets
likes_neither_peppers_nor_sweets(X) :- cantonese(X), not(likes_peppers(X)), not(likes_sweets(X)).
% Check if the above statement implies that there is at least one Southern Chinese who dislikes chili
% (Assuming that liking neither peppers nor sweets implies not liking chili)
guarantee_statement(Y) :- likes_neither_peppers_nor_sweets(Y), dislike_chili(Y).
% Facts (assuming we have someone who meets the criteria for the answer)
cantonese(sam).
not(likes_peppers(sam)).
