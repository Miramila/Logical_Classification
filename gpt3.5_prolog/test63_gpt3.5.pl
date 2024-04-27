% Define that there are more types of life books sold than types of science and technology books
more_life_books_sold_than_science :- types_of_life_books(Types_life), types_of_science_books(Types_science), Types_life > Types_science.
% Check if the above statement refutes the argument that life books are more popular than science and technology books
