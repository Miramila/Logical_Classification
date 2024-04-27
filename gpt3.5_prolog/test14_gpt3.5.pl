You provided a context involving Pigeons and executed a logical reasoning pertaining to some context around Cantonese behavior. This disjoint between the two is creating some confusion. 
However, assuming that you'd like a Prolog representation of the Cantonese behavior scenario, it's as shown. 
% Define that there are some Cantonese who don't like chili
cantonese(X) :- dislike_chili(X). 
% Even if some Cantonese don't like chili, it still means that 
% there are some southerners who don't like chili
southerner(X) :- cantonese(X), dislike_chili(X).
% 'sam' is a Cantonese who dislikes both peppers and sweets
cantonese(sam).
dislike_peppers(sam).
dislike_sweets(sam).
% Potential Hamburg Hypothesis: 
% Some Cantonese may dislike both peppers and sweets
We also have an answer that can be converted as a hypothesis:
% 'alex' is a Cantonese who has good eyes and an amazing memory
cantonese(alex).
good_eyes(alex).
amazing_memory(alex).
Then, we can use a query to infer, that if a person is Cantonese and dislikes both sweets and peppers, then can we say any Cantoneses with good eyes and amazing memory exist:
?- cantonese(X), good_eyes(X), amazing_memory(X).
