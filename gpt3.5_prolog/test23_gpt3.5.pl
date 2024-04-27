% Define that all dishes served at the resturant are either Sichuan or Cantonese cuisine
dishes(X) :-  sichuan(X); cantonese(X).
% Define Mr.Zhang's order to include only Sichuan cuisine
order_mr_zhang(X) :- sichuan(X).
% The resturant stipulates that when you order Cantonese food, you cannot order Sichuan food and vice versa
cannot_order_both(X, Y) :- cantonese(X), not(sichuan(Y)); sichuan(X), not(cantonese(Y)).
% Check if Mr.Zhang's order includes only Sichuan cuisine
answer(A) :- order_mr_zhang(A), cannot_order_both(A, _).
% Facts (assuming we have some dishes for Mr.Zhang's order)
sichuan(kung_pao_chicken).
sichuan(mapo_tofu).
