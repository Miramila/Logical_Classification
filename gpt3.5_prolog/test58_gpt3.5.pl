% Define that all heroes can stand the test
can_stand_the_test(hero).
can_stand_the_test(AnotherHero).
% Define that if a person is not able to stand the test, then they are not a hero
not_hero(Person) :- not(can_stand_the_test(Person)).
% Check if the above statement implies that those who cannot stand the test are not heroes
guarantee_statement(Person) :- not_hero(Person).
% Facts
not(can_stand_the_test(villain)).
