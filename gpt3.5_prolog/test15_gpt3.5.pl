% Prolog Code
% Financing context
financing_project(Project, bank, FundsUsed, Completed) :-
    FundUsed, 
    not(Completed), 
    bank_approves_loan(Project).
further_financing_project(Project, bank, FurtherFundsUsed, StillNotCompleted, ProjectRuinedWithoutLoans) :-
    FurtherFundsUsed,
    not(StillNotCompleted),
    ProjectRuinedWithoutLoans,
    bank_refuses_further_loan(Project).
finance_other_projects(Project, bank, OtherProjects, FasterRecovery) :-
    bank_identifies_projects(bank, OtherProjects),
    FasterRecovery,
    bank_approves_loans_for_other_projects(Project, OtherProjects).
% Our big construction project context
construction(big_project).
financing_project(big_project, bank, used_up, not_completed).
further_financing_project(big_project, bank, used_up_again, still_not_completed, would_be_ruined).
% Fact: Bank identified several other projects
bank_identifies_projects(bank, other_projects).
% Query: Is the bank financing other projects assuming faster recovery?
% Banks would lend money to another project which could lead to faster recovery
