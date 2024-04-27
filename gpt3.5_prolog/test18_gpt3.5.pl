% Define the concept of being a Cantonese who dislikes chili.
dislikes_chili(X) :- cantonese(X).
% State that if someone is Cantonese and dislikes chili, they are southern chinese who dislike chili.
southernChinese(X) :- cantonese(X), dislikes_chili(X).
% Define the concept of a Cantonese who likes neither peppers nor sweets.
likes_neither_peppers_nor_sweets(X) :- cantonese(X), not(likes_peppers(X)), not(likes_sweets(X)).
% Guarantee statement that any Cantonese who likes neither peppers nor sweets is a southern Chinese who dislikes chili.
guarantee_statement(X) :- likes_neither_peppers_nor_sweets(X), southernChinese(X).
% Example for the situation: 
% Define 'Sam' who is a Cantonese and likes neither peppers nor sweets.
cantonese(sam).
not(likes_peppers(sam)).
not(likes_sweets(sam)).
% Validate the guarantee statement. Who is the Cantonese that likes neither peppers nor sweets and dislikes chili?
