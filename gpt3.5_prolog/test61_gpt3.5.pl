% Define that there is at least one undergraduate who entered Beijing University for a master's degree without a test
undergraduate(X) :- entered_university(X), master_degree(X), not(entrance_test(X)).
% Define that there is at least one person who has obtained the recommended qualifications of their school
recommended_qualifications(Y) :- obtained_qualifications(Y).
% Check if the above statement implies the given answer
% (Assuming that having recommended qualifications does not necessarily guarantee entry)
implies_statement(Z) :- recommended_qualifications(Z), not(entering_masters(Z)).
% Facts (assuming we have someone who meets the criteria for the answer)
obtained_qualifications(john).
