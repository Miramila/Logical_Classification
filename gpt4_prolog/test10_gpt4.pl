% Define group members and their knowledge count
knows_count(p1, 3).
knows_count(p2, 2).
knows_count(p3, 2).
knows_count(p4, 2).
knows_count(p5, 1).
knows_count(p6, 1).
knows_count(p7, 1).
knows_count(p8, 1).

% Define potential indirect knowledge
potential_indirect_knowledge(Member) :-
    knows_count(Member, 1),
    \+ (knows_count(Member, X), X > 1).

% Check if any member might only know about others from indirect sources
any_indirect_knowledge :-
    potential_indirect_knowledge(_).
