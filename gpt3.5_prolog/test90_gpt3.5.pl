cantonese(sam). 
dislike_chili(sam).
not(likes_peppers(sam)). 
not(likes_sweets(sam)). 
likes_neither_peppers_nor_sweets(X) :- cantonese(X), not(likes_peppers(X)), not(likes_sweets(X)). 
