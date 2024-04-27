% Define the criteria for the individuals in the scenario
newly_recruited_researcher(X, 2013) :- 
    introduced_talent(X, deputy_high_title).
newly_recruited_researcher(X, 2013) :- 
    fresh_graduate_phd_student(X, beijing_household_registration).
fresh_graduate_phd_student(X, beijing_household_registration) :- 
    fresher(X), phd_student(X), beijing_registration(X).
introduced_talent(X, deputy_high_title) :- 
    introduced_talent(X), has_deputy_high_title(X).
fresher(sam).
phd_student(sam).
beijing_registration(sam).
has_deputy_high_title(john).
% Define the living arrangement based on the conditions
live_in(X, peony_garden) :- introduced_talent(X, _).
live_in(X, postdoctoral_apartments) :- 
    fresh_graduate_phd_student(X, _).
% Query to check whether the answer is correct
