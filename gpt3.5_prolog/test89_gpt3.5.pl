% Define that painters are great
great_painter(X) :- painter(X), great(X).
% Define that great painters spend most of their time in loneliness
loneliness(X) :- great_painter(X), spend_most_time_alone(X).
% Define that there is a psychological theory stating that intimacy is necessary for happiness
intimacy_necessary_for_happiness :- happiness_requires_intimacy.
% Define that loneliness and lack of intimate relationships are conflicting
conflicting_theory :- loneliness(X), not(intimacy(X)).
% Check if the theory about painters contradicts the psychological theory
contradiction_analysis :- loneliness(X), great_painter(X), not(intimacy_necessary_for_happiness).
% Facts
painter(van_gogh).
spend_most_time_alone(van_gogh).
happiness_requires_intimacy.
% Validate the logic
