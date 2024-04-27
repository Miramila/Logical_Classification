% Define that there are two types of community-organized activities: health care and leisure
activity(health_care).
activity(leisure).
% Define that the elderly in the community have participated in all health-related activities
participated(elderly, health_care).
% Define that some of the elderly have participated in all leisure-type activities
some_participated(elderly, leisure).
% Define a rule that states any activity organized by a community will involve the elderly in the community
involve_elderly(Activity) :- activity(Activity), participated(elderly, Activity).
involve_elderly(Activity) :- activity(Activity), some_participated(elderly, Activity).
% Facts (assuming the given data)
participated(elderly, health_care).
some_participated(elderly, leisure).
% Check if the answer is correct based on the given statistics
% Is it true that any activity organized by a community will involve the elderly?
% Query to validate the answer
