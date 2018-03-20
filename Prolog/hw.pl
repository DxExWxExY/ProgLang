/*Females Definitions*/
female(erika).
female(bere). 
female(kenny).

/*Male Definitions*/
male(javier).
male(dimitri).
male(diego).

/*Parent Definitions*/
parent(erika, dimitri).
parent(javier, bere).
parent(erika, kenny).
parent(javier, diego).

/*Problem 1 Definitions*/
mother(X,Y) :- parent(X,Y) , female(X).

/*Problem 2 Definition*/
sister(X,Y) :- parent(Z,Y) , parent(Z,X) , female(X).

/*Problem 3 Definition*/
second(X,List) :- [A,B|C] = List , X = B.

/*Problem 4 Definition*/
twice([],[]).
twice(In,Out) :- [H|T] = In , [H,H|N] = Out , twice(T,N).

/*Problem 5 Definition*/
interleave([],[],[]).
interleave(A,B,X) :- [H1|T1] = A , [H2|T2] = B, [H1,H2|T] = X , interleave(T1,T2,T).