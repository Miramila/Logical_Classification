% Define that there is at least one college teacher with an overseas doctorate
college_teacher(X) :- overseas_doctorate(X).
% If a person is a college teacher with an overseas doctorate, then there is at least one overseas doctor with a high level
overseas_doctor(Y) :- college_teacher(Y), overseas_doctorate(Y).
% Define that all college teachers have a very high level
very_high_level(X) :- college_teacher(X).
% Check if the above statement implies that there is an overseas doctor with a high level
% (Assuming that all college teachers having a very high level guarantees this)
guarantee_statement(Y) :- very_high_level(Y), overseas_doctor(Y).
% Facts (assuming we have someone who meets the criteria for the answer)
college_teacher(john).
overseas_doctor(john).
