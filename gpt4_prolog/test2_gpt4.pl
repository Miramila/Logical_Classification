% Predicates
hamster_with_heart_disease(X).
exposed_to_fluorescent(X).
has_longer_lifespan(X).

% Facts
hamster_with_heart_disease(group1).
hamster_with_heart_disease(group2).
exposed_to_fluorescent(group1).
not(exposed_to_fluorescent(group2)).

% Rule
beneficial_to_health(X) :- hamster_with_heart_disease(X), exposed_to_fluorescent(X), has_longer_lifespan(X).

% Placeholder fact, as the motivation is not explicitly stated in the context
initial_motivation_for_experiment('Does fluorescent light exposure promote recovery?').

% Fact based on the answer provided
hospital_light_therapy_promotes_recovery.

% Rule to check if the answer matches the initial motivation for the experiment
correct_answer(Answer) :- initial_motivation_for_experiment(Answer), hospital_light_therapy_promotes_recovery.

