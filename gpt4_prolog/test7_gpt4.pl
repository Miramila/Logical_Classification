% Predicate definitions
has_children(X) :- dog(X), father(X).
is_your_father(X) :- your_dog(X), father(X).
hitting_your_father(Result) :- is_your_father(dog), hit(dog), Result = 'hitting your father'.

% Facts
dog(spot).
father(spot).
your_dog(spot).

% Checking the fallacious conclusion
?- hitting_your_father(Result).

% Predicate definitions
called_for_hens(X) :- rooster(X).
irrelevant_response(Statement) :- called_for_hens(rooster), not(hen(czech)), Statement = 'irrelevant'.

% Facts
rooster(chick).
hen(henrietta).

% Checking for logical relevance

