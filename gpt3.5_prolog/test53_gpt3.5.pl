% Define that there is at least one person who is Southern Chinese and dislikes chili
southern_chinese(X) :- dislike_chili(X).
% Define that there is at least one Cantonese who likes neither peppers nor sweets
likes_neither_peppers_nor_sweets(X) :- cantonese(X), not(likes_peppers(X)), not(likes_sweets(X)).
% Check if the above statement implies that there is at least one Southern Chinese who dislikes chili
% (Assuming that liking neither peppers nor sweets implies not liking chili)
guarantee_statement(Y) :- likes_neither_peppers_nor_sweets(Y), dislike_chili(Y).
% Facts (assuming we have someone who meets the criteria for the answer)
cantonese(sam).
not(likes_peppers(sam)).
not(likes_sweets(sam)).
