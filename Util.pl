:- use_module(library(random)).


randomPointGen(N) :- random_between(5, 9, N). 
randomShipSelector(N) :- random_between(2, 5, N).

