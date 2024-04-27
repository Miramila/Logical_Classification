% Define that there is a Cantonese who doesn't like chili
cantonese_who_dislikes_chili(X).
% Define that if a person is Cantonese and dislikes chili, then he is a southerner who dislikes chili
southerner_who_dislikes_chili(Y) :- cantonese_who_dislikes_chili(Y).
% Define that there is a Cantonese who likes neither peppers nor sweets
cantonese_likes_neither_peppers_nor_sweets(X).
% Declare if a person is a Cantonese who doesn't like peppers or sweets, then he dislikes chili
dislike_chili(Y) :- cantonese_likes_neither_peppers_nor_sweets(Y).
% Facts (assuming we have some known persons)
cantonese_who_dislikes_chili(someone).
cantonese_likes_neither_peppers_nor_sweets(someone).
southerner_who_dislikes_chili(someone).
