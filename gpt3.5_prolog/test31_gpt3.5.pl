% Define that the "Aklyusian monkey" has a short and wide heel bone
has_characteristic(aklyusian_monkey, short_wide_heel_bone).
% Define that the "Aklyusian monkey" has a small eye socket
has_characteristic(aklyusian_monkey, small_eye_socket).
% Define that if a primate has a short and wide heel bone, it is good at jumping and preying in the bushes
good_at_jumping_and_preying(X) :- has_characteristic(X, short_wide_heel_bone).
% Query to check if the statement provided in the answer supports the scientists' speculation
