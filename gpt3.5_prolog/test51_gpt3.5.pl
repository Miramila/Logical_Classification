% Define that a reasonable education system requires everyone to have the right to compulsory education and fair access to higher education
reasonable_education_system :- right_to_compulsory_education_for_all, access_to_higher_education_through_fair_competition.
% Define that an education system that does not allow everyone to enjoy the right to compulsory education is unreasonable
unreasonable_education_system :- not(right_to_compulsory_education_for_all).
% Facts 
right_to_compulsory_education_for_all.
access_to_higher_education_through_fair_competition.
% Check if the above statement implies that an education system that does not allow everyone to enjoy the right to compulsory education is unreasonable
result :- unreasonable_education_system.
% Query to validate the answer
