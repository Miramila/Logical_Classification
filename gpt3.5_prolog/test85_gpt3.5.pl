% Define that the S Institute may not keep its promises
s_institute_does_not_keep_promises.
% Define that the Peace Foundation decides to suspend funding for S if it believes funding may be used for weapons research
suspend_funding_for_s :-
    s_institute_does_not_keep_promises.
% Define that the S Institute promises not to use all funding for weapon-related research
s_institute_promise_funding_not_used_for_weapons.
% Define that the Peace Foundation withdraws the decision if the S Institute keeps its promises
peace_foundation_withdraws_decision :-
    s_institute_promise_funding_not_used_for_weapons.
% Define that as long as the S Institute kept its promise, Peace Foundation funding won't benefit weapons research
peace_foundation_funding_not_benefit_weapons :-
    s_institute_promise_funding_not_used_for_weapons.
% To summarize the loopholes in the conclusions of the Peace Foundation
% The loophole is if the S Institute does not keep its promises
loophole(A) :-
    s_institute_does_not_keep_promises,
    A = 'Ignore this possibility? S Institute does not keep its promises.'.
