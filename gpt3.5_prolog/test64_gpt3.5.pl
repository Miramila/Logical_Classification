% Define that without increasing costs, health conditions may improve
increase_health_conditions_without_cost :- not(increase_cost_healthcare), improve_health_conditions.
% Facts
increase_cost_healthcare.
% Query to validate the answer
