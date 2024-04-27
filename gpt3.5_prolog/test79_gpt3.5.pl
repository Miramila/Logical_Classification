% Define that there are only two secondary schools in a township
secondary_school(nankou_1).
secondary_school(nankou_2).
% Define that the results of the first secondary school are generally better than the second
better_results(nankou_1, nankou_2).
% Define that Li Ming from Nankou Township has the best grades in the first year of college
best_grades(li_ming, nankou_1).
% Define the rule that if a student has the best grades in the first year of college, they must have graduated from the first secondary school
graduated_from(li_ming, School) :- best_grades(li_ming, School).
% Query to check if the argument is similar to the given scenario
