% Define that in the past five years, the amount of food purchased by each household in City W has not changed.
food_purchased_not_changed :-
    increased_food_prices,
    food_purchases_8_percent_income.
% Define that food prices in City W have increased by an average of 25% in the past five years
increased_food_prices.
% Define that residents' food purchases accounted for only about 8% of the city's monthly household income
food_purchases_8_percent_income.
% Define that the average income of households in City W has increased in the past two years
increased_income.
% Check if the statement is correct based on the context provided
% (Assuming that increased food prices and food purchases accounting for 8% of income imply increased income in the past two years)
?- food_purchased_not_changed.
% Facts
increased_food_prices.
food_purchases_8_percent_income.
