% Define the departments in the building
department(finance).
department(planning).
department(administration).
department(sales).
department(human_resources).
department(research_and_development).
% Define the floors of the building
floor(1).
floor(2).
floor(3).
floor(4).
floor(5).
floor(6).
% Define the relationships between departments and floors
on_floor(finance, Floor) :- Floor = 1.
on_floor(planning, Floor) :- Floor = 2.
on_floor(administration, Floor) :- (Floor > 2, Floor < 6).
on_floor(sales, Floor) :- (Floor \= 1, Floor \= 6).
on_floor(human_resources, Floor) :- (Floor \= 1, Floor \= 6).
on_floor(research_and_development, Floor) :- (Floor > 2, Floor < 6).
% Define the constraints
adjacent_floors(Floor1, Floor2) :- abs(Floor1 - Floor2) =:= 1.
next_to(finance, planning).
above(administration, planning).
below(administration, human_resources).
not_adjacent(sales, human_resources).
% Check if the given answer is correct
possible_answer(Floor, UpperFloor) :- on_floor(finance, 3), on_floor(research_and_development, UpperFloor), on_floor(sales, Floor).
