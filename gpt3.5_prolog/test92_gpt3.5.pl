% Define that unchecked sex is more likely to be infected with AIDS than checkpoint
likelihood(infected_with_AIDS, unchecked_sex) :- more_likely_to_be_infected(unchecked_sex, AIDS, checkpoint).
% Define that among people with unchecked sex, only a small percentage are infected with AIDS
small_percentage_infected(unchecked_sex, AIDS) :- small_percentage(infected_with_AIDS, unchecked_sex).
% Check if the above statements imply that there is no need to emphasize the harm of unchecked sex in the propaganda of AIDS prevention
% (Assuming that being more likely to be infected with AIDS implies harm)
