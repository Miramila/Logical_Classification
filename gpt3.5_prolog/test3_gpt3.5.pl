% Define that there is at least one Cantonese who doesn't like chili 
cantonesewhodislikechili(X).
% If a person is Cantonese and dislikes chili, then there is at least one Southern Chinese who dislikes chili 
southernerwhodislikechili(X) :- cantonesewhodislikechili(X).
% Define that there is at least one Cantonese who likes neither peppers nor sweets 
cantonese_neither_peppers_nor_sweets(X) :- cantonesewhodislikechili(X).
% Check if the above statement implies that there is at least one Southern Chinese who dislikes chili 
% (Assuming that liking neither peppers nor sweets implies not liking chili)
guarantee_statement(X) :- cantonese_neither_peppers_nor_sweets(X), southernerwhodislikechili(X).
% Facts (assuming we have someone who meets the criteria for the answer)
cantonesewhodislikechili(sam).
cantonese_neither_peppers_nor_sweets(sam).
