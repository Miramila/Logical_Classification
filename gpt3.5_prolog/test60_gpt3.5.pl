% Define that the owners of private cars in the city are generally wealthy
wealthy_car_owners.
% Define that the car owners do not care about fines for violations
no_care_about_fines_violations.
% Question the decision of the city government
question_decision :- wealthy_car_owners, no_care_about_fines_violations.
% Run the query to check if the questioning is valid
