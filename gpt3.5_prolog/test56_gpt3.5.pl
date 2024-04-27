% Define the context rules
missile_shot_down_plane :- not(malfunction), not(hijacked).
discovered_by_satellite :- missile_shot_down_plane.
announced_to_media :- discovered_by_satellite.
% Define the question and answer
must_be_hijacked :- added_condition_hijacked.
% Answer options
added_condition_hijacked :- not(reported_missiles), not(malfunction).
% Facts
% To be added based on the answer statement
not(reported_missiles).
not(malfunction).
