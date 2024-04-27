% Define that there is at least one newborn who was a test-tube baby screened by gene sequencing technology
newborn(conne_levi).
test_tube_baby(conne_levi).
screened_by_gene_sequencing(conne_levi).
% Define that experts and scholars' attention was drawn to this newborn
attention_drawn_by_experts_and_scholars(conne_levi).
% Define that news detonated the audience at a specific meeting in London
news_detonated_at_meeting(london_meeting).
held_at(london_meeting, "European Society of Human Reproduction and Embryology Annual Meeting").
% Define the belief of ordinary people about the era of "customized babies"
belief(ordinary_people, era_of_customized_babies).
% Define the statement that could refute the views of ordinary people
refute_statement :-
    technological_development_faster_than_cognition,
    technology_may_deviate_from_human_cognition.
% Check if the refute statement holds true
