% Predicate that defines an automatic cigarette vending machine
vending_machine(Machine).

% Predicate that defines a ban on a machine
banned(Machine).

% Predicate that defines if a smoker is an adult
adult_smoker(Smoker).

% Predicate that represents the inconvenience caused to a smoker by the ban
inconvenienced(Smoker, Machine) :- adult_smoker(Smoker), vending_machine(Machine), banned(Machine).

% Fact: defining an automatic cigarette vending machine
vending_machine(machine1).

% Assuming the machine is banned
banned(machine1).

% Example facts about smokers
adult_smoker(john).
adult_smoker(mary).