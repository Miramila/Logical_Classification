% Define that there is at least one hamster with heart disease who benefits from light exposure
hamster(X) :- benefits_from_light(X).
% If a hamster benefits from light exposure, then there is a specific group of hamsters expected to live 2.5% longer.
group_living_longer(Y) :- hamster(Y), benefits_from_light(Y).
% Define that there is at least one group of hamsters hypothesized to recover from light therapy
hospital_light_therapy(Z) :- group_living_longer(Z), hypothesized_to_recover(Z).
% Check if the above statement implies that there is at least one group of hamsters hypothesized to recover from light therapy
experiment_motivation(Z) :- hospital_light_therapy(Z), hypothesized_to_recover(Z).
% Facts (assuming we have a group of hamsters who meets the criteria for the answer)
hamster(groupA).
benefits_from_light(groupA).
hypothesized_to_recover(groupA).
