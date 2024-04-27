% The person Watt, who invented the steam engine is not American."
inventor(watt, steam_engine).
not(american(watt)).
% Some inventors are American
american_inventor(X) :- inventor(X, _), american(X).
% Fact: Watt invented steam engine and not American
inventor(watt, steam_engine).
not(american(watt)).
