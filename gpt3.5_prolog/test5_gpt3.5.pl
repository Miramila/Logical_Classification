% Define that there is at least one Cantonese who doesn't like chili 
cantonese_dislikes_chili(X) :- cantonese(X). 
% If a person is Cantonese and dislikes chili, then there is at least one Southern Chinese who dislikes chili 
southern_chinese_dislikes_chili(Y) :- cantonese_dislikes_chili(Y). 
% Define that there is at least one Cantonese who likes neither peppers nor sweets 
cantonese_likes_neither_peppers_nor_sweets(X) :- cantonese_dislikes_chili(X). 
% Check if the above statement implies that there is at least one Southern Chinese who dislikes chili 
% (Assuming that liking neither peppers nor sweets implies not liking chili) 
guarantee_statement(Y) :- canontese_likes_neither_peppers_nor_sweets(Y), southern_chinese_dislikes_chili(Y). 
% Facts (assuming we have someone who meets the criteria for the answer) 
cantonese(sam). 
cantonese_dislikes_chili(sam).
cantonese_likes_neither_peppers_nor_sweets(sam).
