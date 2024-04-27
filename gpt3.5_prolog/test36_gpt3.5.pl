\% Define the departments and their respective floors
floor(finance, 2).
floor(planning, 3).
floor(administration, 5).
floor(human_resources, 4).
floor(research_development, 6).
floor(sales, 1).
\% Define the constraints based on the context
adjacent(finance, planning).
above(administration, planning).
below(administration, human_resources).
not_adjacent(human_resources, sales).
\% Define the order of departments from bottom to top
order([floor(sales, _), floor(finance, _), floor(planning, _), floor(administration, _), floor(human_resources, _), floor(research_development, _)]).
\% Query to check the correctness of the answer
