% Define that there is at least one car with airbags involved in a car accident
car_accident(X) :- car_with_airbags(X).
% If a car has airbags and is involved in a car accident, there is at least one car without airbags involved in a car accident
car_without_airbags(Y) :- car_accident(Y), not(car_with_airbags(Y)).
% Define that installing an airbag doesn't make the car owner safer
installing_airbag_not_safer :- car_with_airbags(_).
% Check if the above argument can be refuted by pointing out the loophole
% (Assuming any car equipped with airbags may experience a car accident)
loophole_statement :- car_with_airbags(_), car_accident(_).
% Facts
car_with_airbags(car1).
car_accident(car1).
%- Query
