% Define that petroleum is the energy source of some high-temperature furnaces for making cement
energy_source(petroleum).
% Define that high-temperature furnaces use petroleum as their energy source to make cement
high_temperature_furnace(F) :- energy_source(petroleum), cement_production(F).
% Check if the above conclusion can be drawn
likely_conclusion(B) :- high_temperature_furnace(B), cement_production(B).
% Facts
cement_production(furnace1).
cement_production(furnace2).
cement_production(furnace3).
