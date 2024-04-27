cantonese(sam). 
dislike_chili(sam). 
not(likes_peppers(sam)). 
not(likes_sweets(sam)). 
likes_neither_peppers_nor_sweets(X) :- cantonese(X), not(likes_peppers(X)), not(likes_sweets(X)). 
dislike_chili(X) :- cantonese(X). 
guarantee_statement(Y) :- likes_neither_peppers_nor_sweets(Y), dislike_chili(Y). 
