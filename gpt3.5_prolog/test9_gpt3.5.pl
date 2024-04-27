% Define that there is at least one Cantonese who doesn't like chili 
likes(chili, X) :- cantonese(X), \+ dislike(chili, X).
% Define dislike rule 
dislike(chili, X) :- cantonese(X), dislikes_neither_peppers_nor_sweets(X).
% Define cantonese 
cantonese(sam).
% Define that there is at least one Cantonese who likes neither peppers nor sweets
dislikes_neither_peppers_nor_sweets(X) :- cantonese(X), 
                                        \+ likes(pepper, X), 
                                        \+ likes(sweets, X).
% Fact: Sam does not like peppers or sweets 
\+ likes(pepper, sam).
\+ likes(sweets, sam).
% Query to check if Sam dislikes chili 
