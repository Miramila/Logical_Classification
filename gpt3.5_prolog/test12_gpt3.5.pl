% Define that Li Lin is a civil servant 
civil_servant(li_lin). 
% Define that Li Lin is not a college graduate 
not(college_graduate(li_lin)). 
% If a person is a civil servant and not a college graduate, then not all civil servants are college graduates
not_all_college_graduates(X) :- civil_servant(X), not(college_graduate(X)). 
% Facts (assuming Li Lin is a civil servant, but not a college graduate) 
civil_servant(li_lin). 
not(college_graduate(li_lin)). 
