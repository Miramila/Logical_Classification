% Define the robots and their capabilities
robot(a, colors).
robot(b, shapes).
robot(c, none).
% Define the experiment outcomes
picked_up(1, red_square).
picked_up(2, blue_ball).
% Define the types based on the experiment
type_c(R) :- picked_up(R, _), robot(R, none).
type_a(R) :- picked_up(R, red_square), robot(R, colors).
type_b(R) :- picked_up(R, blue_ball), robot(R, shapes).
% Check if both robots are type C
must_be_true :- type_c(1), type_c(2), not((type_a(1); type_b(1))), not((type_a(2); type_b(2))).
