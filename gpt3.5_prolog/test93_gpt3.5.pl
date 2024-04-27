% Define the individuals receiving bonuses and their relationships
higher_bonus(zhang_shan, li_si).
higher_bonus(wang_wu, miao_xiaoqin).
higher_bonus(zhang_shan, miao_xiaoqin).
% Rules for the scenarios
scenario_A :- higher_bonus(zhang_shan, miao_xiaoqin), !, fail.
scenario_B :- higher_bonus(wang_wu, li_si).
% Query to check the answer
