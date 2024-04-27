% Define that there is at least one selfish person 
selfish(X) :- not(not_selfish(X)).
% If a person is not selfish, then there is at least one person who is selfish 
person(Y) :- not_selfish(Y), selfish(Y).
% Define that there is at least one person who is not selfish
not_selfish(john).
% Check if there is at least one person who is not selfish implies there is at least one person who is selfish
% (Assuming that not being selfish implies being selfish) 
guarantee_statement(Y) :- not_selfish(Y), selfish(Y).
% Facts (assuming we have someone who meets the criteria for the answer)
not_selfish(mary).
