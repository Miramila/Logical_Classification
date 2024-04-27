% Define that there is at least one person who is Cantonese and dislikes chili
dislike_chili(cantonese).
% If a person is Cantonese and dislikes chili, then there is at least one person from the South who dislikes chili
dislike_chili(southern_chinese) :- dislike_chili(cantonese).
% Define that there is at least one person who likes neither peppers nor sweets
neither_peppers_nor_sweets(X) :- dislike_chili(X), not(likes_peppers(X)), not(likes_sweets(X)).
% Check if the above statement implies that there is at least one Southern Chinese who dislikes chili
% (Assuming that liking neither peppers nor sweets implies not liking chili)
guarantee_statement(Y) :- neither_peppers_nor_sweets(Y), dislike_chili(Y).
% Facts
dislike_chili(cantonese).
dislike_chili(sam).
likes_peppers(sam).
