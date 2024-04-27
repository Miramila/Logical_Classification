% Define that there are nearly 1000 conference papers each time
conference_papers(nearly_1000).
% Define that only 10% of the papers are selected as conference communication papers
select_conference_comm_papers(Papers) :- conference_papers(Total), Papers is Total * 0.1.
% Define that the remaining 90% of papers do not meet the quality standard
not_meet_quality_standard(Papers) :- conference_papers(Total), select_conference_comm_papers(Selected), Papers is Total - Selected.
% Check if the decision of selecting only 10% of the papers is based on the assumption that 90% of papers do not meet the quality standard
assumption_based_on_decision :- not_meet_quality_standard(90).
% Query to validate the answer based on the assumption
