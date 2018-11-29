:- ['WikiDataFetch.pl'].
% :- ['RandomShipGenerator.pl']. % For randomized AI ship locations

:- use_module(library(random)).

:- dynamic ship_car/11.
:- dynamic ship_sub/9.
:- dynamic ship_bship/7.
:- dynamic ship_des/5.

:- dynamic to_print_miss/1.

:- dynamic tried/2.
:- style_check(-singleton).


% Sample ship position information
ship_car([0,0],[0,1],[0,2],[0,3],[0,4],0,0,0,0,0,0).
ship_sub([1,0],[1,1],[1,2],[1,3],0,0,0,0,0).
ship_bship([2,0],[2,1],[2,2],0,0,0,0).
ship_des([3,0],[3,1],0,0,0).

% Flag for printing miss
to_print_miss(1).

% Hit and miss declarations
hit :-
    write('Hit!').

miss :-
    write('Miss!').


change_miss :-
  retract(to_print_miss(V)), assert(to_print_miss(0)).

% Predicate to check if there was a hit or miss
check(Coor) :-
  (ship_car(Coor, Coor2,Coor3,Coor4,Coor5,H1,H2,H3,H4,H5,HA) ->
    hit, retract(ship_car(Coor,Coor2,Coor3,Coor4,Coor5,H1,H2,H3,H4,H5,HA)), assert(ship_car(Coor,Coor2,Coor3,Coor4,Coor5,1,H2,H3,H4,H5,HA)), change_miss;
    true),
  (ship_car(Coor1,Coor, Coor3,Coor4,Coor5,H1,H2,H3,H4,H5,HA) ->
    hit, retract(ship_car(Coor1,Coor,Coor3,Coor4,Coor5,H1,H2,H3,H4,H5,HA)), assert(ship_car(Coor1,Coor,Coor3,Coor4,Coor5,H1,1,H3,H4,H5,HA)), change_miss;
    true),
  (ship_car(Coor1,Coor2,Coor, Coor4,Coor5,H1,H2,H3,H4,H5,HA) ->
    hit, retract(ship_car(Coor1,Coor2,Coor,Coor4,Coor5,H1,H2,H3,H4,H5,HA)), assert(ship_car(Coor1,Coor2,Coor,Coor4,Coor5,H1,H2,1,H4,H5,HA)), change_miss;
    true),
  (ship_car(Coor1,Coor2,Coor3,Coor, Coor5,H1,H2,H3,H4,H5,HA) ->
    hit, retract(ship_car(Coor1,Coor2,Coor3,Coor,Coor5,H1,H2,H3,H4,H5,HA)), assert(ship_car(Coor1,Coor2,Coor3,Coor,Coor5,H1,H2,H3,1,H5,HA)), change_miss;
    true),
  (ship_car(Coor1,Coor2,Coor3,Coor4,Coor, H1,H2,H3,H4,H5,HA) ->
    hit, retract(ship_car(Coor1,Coor2,Coor3,Coor4,Coor,H1,H2,H3,H4,H5,HA)), assert(ship_car(Coor1,Coor2,Coor3,Coor4,Coor,H1,H2,H3,H4,1,HA)), change_miss;
    true),

  (ship_sub(Coor, Coor2,Coor3,Coor4,H1,H2,H3,H4,HA) ->
    hit, retract(ship_sub(Coor,Coor2,Coor3,Coor4,H1,H2,H3,H4,HA)), assert(ship_sub(Coor,Coor2,Coor3,Coor4,1,H2,H3,H4,HA)), change_miss;
    true),
  (ship_sub(Coor1,Coor, Coor3,Coor4,H1,H2,H3,H4,HA) ->
    hit, retract(ship_sub(Coor1,Coor,Coor3,Coor4,H1,H2,H3,H4,HA)), assert(ship_sub(Coor1,Coor,Coor3,Coor4,H1,1,H3,H4,HA)), change_miss;
    true),
  (ship_sub(Coor1,Coor2,Coor, Coor4,H1,H2,H3,H4,HA) ->
    hit, retract(ship_sub(Coor1,Coor2,Coor,Coor4,H1,H2,H3,H4,HA)), assert(ship_sub(Coor1,Coor2,Coor,Coor4,H1,H2,1,H4,HA)), change_miss;
    true),
  (ship_sub(Coor1,Coor2,Coor3,Coor, H1,H2,H3,H4,HA) ->
    hit, retract(ship_sub(Coor1,Coor2,Coor3,Coor,H1,H2,H3,H4,HA)), assert(ship_sub(Coor1,Coor2,Coor3,Coor,H1,H2,H3,1,HA)), change_miss;
    true),

  (ship_bship(Coor, Coor2,Coor3,H1,H2,H3,HA) ->
    hit, retract(ship_bship(Coor,Coor2,Coor3,H1,H2,H3,HA)), assert(ship_bship(Coor,Coor2,Coor3,1,H2,H3,HA)), change_miss;
    true),
  (ship_bship(Coor1,Coor, Coor3,H1,H2,H3,HA) ->
    hit, retract(ship_bship(Coor1,Coor,Coor3,H1,H2,H3,HA)), assert(ship_bship(Coor1,Coor,Coor3,H1,1,H3,HA)), change_miss;
    true),
  (ship_bship(Coor1,Coor2,Coor, H1,H2,H3,HA) ->
    hit, retract(ship_bship(Coor1,Coor2,Coor,H1,H2,H3,HA)), assert(ship_bship(Coor1,Coor2,Coor,H1,H2,1,HA)), change_miss;
    true),

  (ship_des(Coor, Coor2,H1,H2,HA) ->
    hit, retract(ship_des(Coor,Coor2,H1,H2,HA)), assert(ship_des(Coor,Coor2,1,H2,HA)), change_miss;
    true),
  (ship_des(Coor1,Coor, H1,H2,HA) ->
    hit, retract(ship_des(Coor1,Coor,H1,H2,HA)), assert(ship_des(Coor1,Coor,H1,1,HA)), change_miss;
    true),

  (to_print_miss(1) ->
    miss;
    retract(to_print_miss(V)), assert(to_print_miss(1)) ).

prompt_number(Prompt, Number) :-
  write(Prompt),
  read(Number).

ai :-
  random_between(0,9,N),
  random_between(0,9,M),
  not(tried(M,N)),
  write('AI tries ('),
  write(M),
  write(','),
  write(N),
  write(')'),nl,
  assert(tried(M,N)),
  write('Was it correct? '),
  read(Ans), nl, write(Ans), nl, nl.

% Updates to flags
update_car :-
  (ship_car(C1,C2,C3,C4,C5,1,1,1,1,1,0) ->
    retract(ship_car(C1,C2,C3,C4,C5,1,1,1,1,1,0)), 
    assert(ship_car(C1,C2,C3,C4,C5,1,1,1,1,1,1)),
    specificShip(5);
    true).
update_sub :-
  (ship_sub(C1,C2,C3,C4,1,1,1,1,0) ->
    retract(ship_sub(C1,C2,C3,C4,1,1,1,1,0)), 
    assert(ship_sub(C1,C2,C3,C4,1,1,1,1,1)),
    specificShip(4);
    true).
update_bship :-
  (ship_bship(C1,C2,C3,1,1,1,0) ->
    retract(ship_bship(C1,C2,C3,1,1,1,0)), 
    assert(ship_bship(C1,C2,C3,1,1,1,1)),
    specificShip(3);
    true).
update_des :-
  (ship_des(C1,C2,1,1,0) ->
    retract(ship_des(C1,C2,1,1,0)), 
    assert(ship_des(C1,C2,1,1,1)),
    specificShip(2);
    true).

% Start here
:- initialization(main).
main :-
  write('Welcome to Battleship-Prolog'), nl, nl,
  
  prompt_number('Enter board size ', Bsize), nl, nl,
  assert(bsize(Bsize)),
  repeat,
  prompt_number('Enter row number ', Row),
  prompt_number('Enter column number ', Col),
  nl,
  check([Row,Col]), 
  update_car, update_sub, update_bship, update_des, nl, nl,
  (ship_car(_,_,_,_,_,_,_,_,_,_,1),
    ship_sub(_,_,_,_,_,_,_,_,1),
    ship_bship(_,_,_,_,_,_,1),
    ship_des(_,_,_,_,1) ->
    true;
    ai, fail).
