% Assuming that having a lot of money means that the industry will thrive
thriving_industry(tobacco_industry) :- has_a_lot_of_money(tobacco_industry).
% If the tobacco industry is thriving and the sales increased, then American tobacco farmers are successful
american_tobacco_farmers(successful) :- thriving_industry(tobacco_industry), sales_increased(tobacco).
% If the number of smokers are declining while sales are increasing, there is a third factor contributing
third_factor_exists :- smokers(declining), sales_increased(tobacco), not(equal(smokers, sales)).
% If more women start smoking than men quitting, this does not necessarily explain the phenomenon
does_not_explain_phenomenon :- women_start_smoking(More), men_quit_smoking(Less), More > Less.
% Facts that include the context
has_a_lot_of_money(tobacco_industry).
sales_increased(tobacco).
smokers(declining).
% Query to determine if more women smoking than men quitting is not reason for the phenomenon
