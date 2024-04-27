% Define the inflation rates for two consecutive years
inflation_rate(last_year, 1.2).
inflation_rate(this_year, 4.0).

% Predicate to check if inflation is rising
rising_trend(CurrentYear) :-
    PreviousYear is CurrentYear - 1,
    inflation_rate(PreviousYear, PreviousRate),
    inflation_rate(CurrentYear, CurrentRate),
    CurrentRate > PreviousRate.

% Predicting future based on rising trend
higher_next_year(NextYear) :-
    CurrentYear is NextYear - 1,
    rising_trend(CurrentYear).

% Checking the rising trend for this year
?- rising_trend(2023).

% Predicting higher inflation for next year
?- higher_next_year(2024).

% Represents the effect of false prosperity leading to recession
false_prosperity_leads_to_recession.

% Adjusting the prediction about rising inflation
higher_next_year_adjusted(NextYear) :-
    CurrentYear is NextYear - 1,
    rising_trend(CurrentYear),
    \+ false_prosperity_leads_to_recession.

% Adding fact about possible recession
?- assert(false_prosperity_leads_to_recession).