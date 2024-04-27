% Define that there are scammers in society and some people have greed in their hearts
scammers_exist.
greed_in_hearts.
% Define that if there are scammers in society and some people have greed in their hearts, then someone must be cheated
cheated :- scammers_exist, greed_in_hearts.
% Define that if society progresses so that no one is deceived, then people in that society must have universally eliminated greed
eliminated_greed :- not(cheated).
% Check if the above argument is supported by the statement "No matter in what society, scammers always exist"
supports_statement :- scammers_exist.
% Facts
scammers_exist.
