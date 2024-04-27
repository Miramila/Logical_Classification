cantonese(X) :- dislike_chili(X). 
southern_chinese(Y) :- cantonese(Y), dislike_chili(Y). 
likes_neither_peppers_nor_sweets(X) :- cantonese(X), not(likes_peppers(X)), not(likes_sweets(X)). 
% Check if the above statement implies that there is at least one Southern Chinese who dislikes chili 
guarantee_statement(Y) :- likes_neither_peppers_nor_sweets(Y), dislike_chili(Y). 
% Facts 
cantonese(sam). 
not(likes_peppers(sam)). 
not(likes_sweets(sam)).
