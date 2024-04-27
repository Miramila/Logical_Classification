% Define that a person must have a doctorate from a prestigious school
has_doctorate(wang_gang).
from_prestigious_school(wang_gang).
% Define that a person must have more than one year of research experience in a research institution overseas
research_experience(wang_gang, overseas).
more_than_one_year_experience(wang_gang).
% Define the rule that a person with a doctorate from a prestigious school and more than one year of overseas research experience is a university teacher
university_teacher(X) :- has_doctorate(X), from_prestigious_school(X), research_experience(X, overseas), more_than_one_year_experience(X).
% Define the answer statement
cannot_become_university_teachers(X) :- not(phd(X)), not(more_than_one_year_experience(X, overseas)).
