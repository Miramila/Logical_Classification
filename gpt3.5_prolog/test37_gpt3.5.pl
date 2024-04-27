% Define the 6 floors of the office building
floor(1). floor(2). floor(3). floor(4). floor(5). floor(6).
% Define the departments on each floor
department(finances, 2).
department(planning, 1).
department(administration, 4).
department(sales, 5).
department(human_resources, 3).
department(research_development, 6).
% Define rules based on the given information
% The two floors of the human resources department and the sales department are not adjacent
not_adjacent(HR, Sales) :- department(human_resources, HR), department(sales, Sales), Diff is HR - Sales, abs(Diff) > 1.
% The finance department is on the next floor of the planning department
next_to_planning(Planning, Finance) :- department(planning, Planning), department(finances, Finance), Finance is Planning + 1.
% The floor of the administrative department is above the planning department, but below the Human Resources Department
above_planning(Administration, Planning) :- department(administration, Administration), department(planning, Planning), Administration > Planning.
below_HR(Administration) :- department(administration, Administration), department(human_resources, HR), Administration < HR.
% Check if the given condition leads to the correct answer
possible_answer(B) :- not_adjacent(HR_floor, Sales_floor), next_to_planning(Planning_floor, Finance_floor), above_planning(Admin_floor, Planning_floor), below_HR(Admin_floor), B = 'The sales department is one level above the administrative department'.
% The answer is B
