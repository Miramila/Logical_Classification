% Define that balls A, B, C and D exist
ball(a).
ball(b).
ball(c).
ball(d).
% Define the group comparison rule
compare({X,Y}, {Z,W}) :- weight(X, XW), weight(Y, YW), weight(Z, ZW), weight(W, WW), (XW + YW) > (ZW + WW).
% Define weights for each ball
weight(a, 4).
weight(b, 5).
weight(c, 3).
weight(d, 2).
% This query will check if A and D pair is heavier than B and C pair
