% Define that there is at least one Cantonese who doesn't like chili
dislike_chili(X).
% If a person is Cantonese and dislikes chili, then there is at least one Southern Chinese who dislikes chili
cantonese(Y).
% Define that there is at least one Cantonese who likes neither peppers nor sweets
likes_neither_peppers_nor_sweets(X).
% Check if the above statement implies that there is at least one Southern Chinese who dislikes chili
% (Assuming that liking neither peppers nor sweets implies not liking chili)
guarantee_statement(Y).
% Facts (assuming we have someone who meets the criteria for the answer)
cantonese(sam).
not(likes_peppers(sam)).
not(likes_sweets(sam)).
