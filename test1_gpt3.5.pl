cantonese(X) :- dislike_chili(X).
southern_chinese(Y) :- cantonese(Y), dislike_chili(Y).
likes_neither_peppers_nor_sweets(X) :- cantonese(X), \+ likes_peppers(X), \+ likes_sweets(X).
guarantee_statement(Y) :- likes_neither_peppers_nor_sweets(Y), dislike_chili(Y).

cantonese(sam).
\+ likes_peppers(sam).
\+ likes_sweets(sam).

