% Defining rules based on the given context
black_american(X) :- high_blood_pressure(X).
white_american(Y) :- \+high_blood_pressure(Y).
westernized_blacks_african(Z) :- high_blood_pressure(Z).
white_african(W) :- \+high_blood_pressure(W).
high_salt_content(A) :- westernized_blacks_african(A).
genetic_adaptation(A) :- westernized_blacks_african(A).
% Facts (assuming we have individuals who fit into the above definitions)
high_blood_pressure(john). % john is a black American with high blood pressure
\+high_blood_pressure(jane). % jane is a white American without high blood pressure
high_blood_pressure(segun). % segun is a westernized black African with high blood pressure
\+high_blood_pressure(ngugi). % ngugi is a white African without high blood pressure
% Defining descendants of contemporary westernized black African Gambians
descendant_of_westernized_black_african_gambian(X) :- gambian(X), \+high_salt_content(X), \+high_blood_pressure(X).
% Facts (assuming we have a descendant of contemporary westernized black African Gambians)
gambian(kemo). % kemo is a Gambian
\+high_salt_content(kemo). % Kemo has a low salt diet
\+high_blood_pressure(kemo). % Kemo doesn't have high blood pressure
% Check if the above statement supports the hypothesis of researchers
