Your provided code looks correct, noting some facts being defined with "not", Prolog might have issues with it, depending on implementation (SWI-Prolog supports these). The defined rules are correctly reflecting the given scenario and the query at the end is suitable for checking the needful. To run the query, you need to load the .pl file in Prolog and execute the asked query.
Here are the defined rules with some updates and a proper query:
%If a person is Cantonese and dislikes chili
dislike_chili(X) :- cantonese(X).
% If a person is Cantonese and dislikes chili, then there is at least one Southern Chinese who dislikes chili 
southern_chinese(Y) :- cantonese(Y), dislike_chili(Y). 
% Define that there is at least one Cantonese who likes neither peppers nor sweets 
likes_neither_peppers_nor_sweets(X) :- cantonese(X), \+ likes_peppers(X), \+ likes_sweets(X). 
% Check if the above statement implies that there is at least one Southern Chinese who dislikes chili 
% (Assuming that liking neither peppers nor sweets implies not liking chili) 
guarantee_statement(Y) :- likes_neither_peppers_nor_sweets(Y), southern_chinese(Y). 
% Facts (assuming we have someone who meets the criteria for the answer) 
cantonese(sam). 
likes_peppers(X) :- X \= sam.
likes_sweets(X) :- X \= sam.
Note: The "\" symbol is the "not" operator in Prolog.
