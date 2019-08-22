parents('Fergus','Agatha').
parents('Fergus','Olivia').
parents('Nora','Agatha').
parents('Nora','Olivia').
parents('Boadicea','Conall').
parents('Boadicea','Harry').
parents('William','Conall').
parents('William','Harry').
parents('Joseph','Lucas').
parents('Zoe','Lucas').
parents('Daniel','Emma').
parents('Daniel','Logan').
parents('Daniel','Rosie').
parents('Emy','Emma').
parents('Emy','Logan').
parents('Emy','Rosie').
parents('Olivia','Edward').
parents('Conall','Edward').
parents('Lucas','Elsie').
parents('Lucas','Віктор').
parents('Emma','Elsie').
parents('Emma','Віктор').
parents('Edward','Adam').
parents('Edward','Eva').
parents('Elsie','Adam').
parents('Elsie','Eva').

male('Fergus').
male('Віктор').
male('William').
male('Joseph').
male('Daniel').
male('Conall').
male('Harry').
male('Lucas').
male('Logan').
male('Edward').
male('Adam').
female('Nora').
female('Boadicea').
female('Agatha').
female('Zoe').
female('Emy').
female('Olivia').
female('Emma').
female('Rosie').
female('Elsie').
female('Eva').

couple('Fergus','Nora').
couple('William','Boadicea').
couple('Joseph','Zoe').
couple('Daniel','Emy').
couple('Conall','Olivia').
couple('Lucas','Emma').
couple('Edward','Elsie').


father(X, Y) :- male(X), parents(X, Y).
mother(X, Y) :- female(X), parents(X, Y).
children(X, Y) :- parents(Z, X), parents(Z, Y), X \= Y.

grandfather(X, Y) :- parents(X, Z), parents(Z, Y), male(X).

grandmother(X, Y) :- parents(X, Z), parents(Z, Y), female(X).

sister(X, Y) :- female(X), children(X, Y).

brother(X, Y) :- male(X), children(X, Y).

uncle(X, Y) :- male(X), children(X, Z), parents(Z, Y).

aunt(X, Y) :- female(X), children(X, Z), parents(Z, Y).

grandson(X, Y) :- male(X), parents(Z, X), parents(Y, Z).

granddaughter(X, Y) :- female(X), parents(Z, X), parents(Y, Z).

cousin(X, Y) :- aunt(Z, Y), mother(Z, X).
cousin(X, Y) :- uncle(Z, Y), father(Z, X).

cousinMale(X, Y) :- male(X), aunt(Z, Y), mother(Z, X).
cousinMale(X, Y) :- male(X), uncle(Z, Y), father(Z, X).

cousinFemale(X, Y) :- female(X), aunt(Z, Y), mother(Z, X).
cousinFemale(X, Y) :- female(X), uncle(Z, Y), father(Z, X).

nephew(X, Y) :- parents(Z, X), children(Z, Y), male(X).

niece(X, Y) :- parents(Z, X), children(Z, Y), female(X).

свекруха(X, Y) :- couple(Z, Y), mother(X, Z).

свекор(X, Y) :- couple(Z, Y), father(X, Z).

теща(X, Y) :- couple(Y, Z), mother(X, Z).

тесть(X, Y) :- couple(Y, Z), father(X, Z).

дівер(X, Y) :- couple(Y, _), brother(Y, X).

шурин(X, Y) :- couple(_, Y), brother(X, Y).

зовиця(X, Y) :- couple(Y, _), sister(X, Y).

своячка(X, Y) :- couple(_, Y), sister(X, Y).

зять(X, Y) :- parents(Y, Z), couple(X, Z), male(X).

невістка(X, Y) :- parents(Y, Z), couple(Z, X), female(X).

сват(X, Y) :- parents(X, Z), parents(Y, R), couple(Z, R), male(X), male(Y).

сваха(X, Y) :- parents(X, Z), parents(Y, R), couple(Z, R), female(X), female(Y).
