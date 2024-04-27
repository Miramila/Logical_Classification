% Define the departments and their positions
department(finances).
department(planning).
department(administration).
department(sales).
department(human_resources).
department(research_development).
floor(1).
floor(2).
floor(3).
floor(4).
floor(5).
floor(6).
adjacent(1,2).
adjacent(2,1).
adjacent(2,3).
adjacent(3,2).
adjacent(4,5).
adjacent(5,4).
adjacent(5,6).
adjacent(6,5).
% Define the relations between departments
occupies(finances, 2).
occupies(planning, 3).
occupies(administration, 5).
occupies(sales, _),
occupies(human_resources, _),
occupies(research_development, _).
next_to(D1, D2) :- occupies(D1, F1), occupies(D2, F2), adjacent(F1, F2).
above(D1, D2) :- occupies(D1, F1), occupies(D2, F2), F1 > F2.
below(D1, D2) :- above(D2, D1).
% Define the constraints
constraint1 :- not(next_to(sales, human_resources)).
constraint2 :- next_to(finances, planning).
constraint3 :- above(administration, planning), below(administration, human_resources).
% Query to check the possible departments on the first and second floors
