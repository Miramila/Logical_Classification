% Define that there is at least one person who occasionally consumes beef jerky
occasional_consumer(X) :- consumes_beef_jerky(X).
% Define that most brands of beef jerky additives do not cause arterial hardening
no_arterial_hardening_due_to_additives.
% Define that meat contains substances harmful to the human body
contains_harmful_substances(meat).
% Check if the statement that meat contains substances harmful to the human body weakens the argument
weaken_argument :- contains_harmful_substances(meat).
% Query to check if the statement weakens the argument
