% Prolog rules for the information that the study showed in the context
productive(employee) :- works_in_comfortable_environment(employee).
works_in_comfortable_environment(employee) :- increase_25_percent_productivity(employee).
increase_25_percent_productivity(employee) :- improved_work_environment(employee).
% Prolog rule for the hypothesis
less_productive_employee(employee) :- spends_less_time_in_workplace(employee),
                       not(works_in_comfortable_environment(employee)).
% Assume two employees as facts, where Amy works in a comfortable environment 
% and Bob spends less time in the workplace
improved_work_environment(amy).
spends_less_time_in_workplace(bob).
% To validate the above hypothesis, we can use the following query:
