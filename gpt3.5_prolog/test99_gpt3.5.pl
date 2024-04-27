% Define that Kobayashi is refused to enter the deep pool if he does not wear a swimming cap
refused_to_enter(kobayashi) :- not(wear_swimming_cap(kobayashi)).
% Define that Kobayashi can enter the deep pool if he shows the deep water certificate
can_enter_deep_pool(kobayashi) :- show_deep_water_certificate(kobayashi).
% Define the regulations of the swimming pool
regulations(not_allowed_to_enter(X)) :- not(wear_swimming_cap(X)).
regulations(can_enter_deep_pool(X)) :- has_deep_water_certificate(X).
% Check if Kobayashi is likely to understand the rules of swimming as stated in the answer
understands_rules(kobayashi, "If you have a deep water certificate, you can enter the deep pool").
% Query to validate the answer
