% Predicates for creation events
created(earth, 1).
created(moon, 2).
created(sun, 3).

% Predicate to represent different understandings of a day
understanding_of_day(god, different).
understanding_of_day(humans, 24_hours).

% Predicate to check if the understanding of "one day" by God matches our own
same_day_understanding(Person1, Person2) :-
    understanding_of_day(Person1, DayLength1),
    understanding_of_day(Person2, DayLength2),
    DayLength1 == DayLength2.
