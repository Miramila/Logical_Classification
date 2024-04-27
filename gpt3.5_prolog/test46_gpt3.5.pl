% Define that there is at least one Cantonese who doesn't like chili 
dislike_chili(sam).
% If a person is Cantonese and dislikes chili, then there is at least one Southern Chinese who dislikes chili 
southern_chinese(X) :- dislike_chili(X).
% Define that there is at least one Cantonese who likes neither peppers nor sweets 
likes_neither_peppers_nor_sweets(sam).
% Check if the above statement implies that there is at least one Southern Chinese who dislikes chili 
% (Assuming that liking neither peppers nor sweets implies not liking chili) 
guarantee_statement(X) :- likes_neither_peppers_nor_sweets(X), dislike_chili(X).
% Query to check if the statement holds true
