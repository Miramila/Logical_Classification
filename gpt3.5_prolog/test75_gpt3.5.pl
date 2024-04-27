% Define that there is at least one person who thinks it's wrong to say that inferior gasoline will not cause abnormal fuel consumption
wrong_to_say(inferior_gasoline).
% Define that if it's considered wrong to say inferior gasoline won't cause abnormal fuel consumption, then there's a possibility of very normal aging of engine valves due to inferior gasoline
aging_of_engine_valves(inferior_gasoline).
% Define that abnormal aging of motive valves due to engine issues can cause abnormal fuel consumption
abnormal_fuel_consumption(motive_valves).
% Check if the above argument is valid
valid_argument(Y) :- wrong_to_say(Y), aging_of_engine_valves(Y), abnormal_fuel_consumption(motive_valves).
