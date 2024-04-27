% Define that some Cantonese don't like chili
dislike_chili(X) :- cantonese(X).
% If a person is Cantonese and dislikes chili, then there are some southerners who don't like chili
southern_chinese(Y) :- cantonese(Y), dislike_chili(Y).
% Define that there is at least one Cantonese who likes neither peppers nor sweets
likes_neither_peppers_nor_sweets(X) :- cantonese(X), not(likes_peppers(X)), not(likes_sweets(X)).
% Check if there is at least one Southern Chinese who dislikes chili
refute_statement(Y) :- dislike_chili(Y), not(southern_chinese(Y)).
% Facts
cantonese(john).
dislike_chili(john).
% Query
