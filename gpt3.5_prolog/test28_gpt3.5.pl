% Define that there is at least one indigenous person who tests the newborns' fitness 
indigenous_person(X) :- test_fitness_of_newborn(X).
% If a person is an indigenous person and tests the fitness of newborns, then there is at least one newborn who is either sturdy or weak
newborn(Y) :- indigenous_person(Y), test_fitness_of_newborn(Y), (sturdy_baby(Y) ; weak_baby(Y)).
% The decline is due to an inadequate talent pool, i.e., too few sturdies 
decline_due_to_inadequate_talent(X) :- indigenous_person(X), not(enough_sturdy_babies(X)).
% This checks if the above logic is the cause of decline 
% (Assuming that not having enough sturdy babies is the cause of the decline)
cause_of_failure(X) :- decline_due_to_inadequate_talent(X).
% Facts (assuming we have someone who meets the criteria for the answer)
indigenous_person(john).
test_fitness_of_newborn(john).
sturdy_baby(john).
weak_baby(john).
not(enough_sturdy_babies(john)).
