% Define the possible employers
employer(tianshu).
employer(tianji).
employer(tianxuan).
% Define the people
person(zhang).
person(wang).
person(li).
person(zhao).
person(liu).
% Define the hiring relation
hired_by(li, tianshu).
not(hired_by(li, tianji)), not(hired_by(li, tianxuan)).
hired_by(liu, Z) :- hired_by(zhao, Z).
hired_by(zhang, tianxuan) -> hired_by(wang, tianshu).
% Query to check the correct employer of Liu
