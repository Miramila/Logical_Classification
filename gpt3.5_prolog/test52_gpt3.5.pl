% Define that there is strict investigation of drunk driving in cities with urban traffic accidents
strict_investigation(drunk_driving).
% Define that strict investigation of drunk driving can reduce the occurrence of traffic accidents
reduce_accidents(strict_investigation(drunk_driving)).
% Check if severe investigations of drunk driving have occurred in urban traffic accidents
most_helpful_eliminate_inconsistency(A) :- strict_investigation(drunk_driving).
% Query to validate the answer
