Your definition of Prolog predicates seems correct. However, in Prolog logic, you usually define predicates using facts (statements that are always true). In this case, to prove that the statement is valid, you should use a person X who dislikes both sweets and peppers and is also a Cantonese. 
Here's how to place your facts and query in Prolog:
% Definitions
dislike_chili(X) :- cantonese(X), not(likes_peppers(X)), not(likes_sweets(X)).
cantonese(sam).
not(likes_peppers(sam)).
not(likes_sweets(sam)).
% Query
?- dislike_chili(X).
If "Sam" is indeed the person who dislikes both peppers and sweets and is a Cantonese, Prolog should return X = sam. This means the definition dislike_chili is correct and the guarantee statement is true.
Additionally, the original statement about purchasing power can be modeled in Prolog like so:
% Definitions
spend_more_on_houses(X) :- rural_resident(X), not(city_resident(X)).
rural_resident(john).
not(city_resident(john)).
% Query
?- spend_more_on_houses(X).
