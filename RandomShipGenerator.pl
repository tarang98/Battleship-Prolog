:- ['Util.pl'].

% Clears the board from previous values
:- abolish(ship_car/11).                 
:- abolish(ship_sub/9). 
:- abolish(ship_bship/7). 
:- abolish(ship_des/5).

:- dynamic ship_car/11, ship_sub/9, ship_bship/7, ship_des/5.


% calls the randomPointGen predicate from the Util class
% returns true always.
chooseStartingPoint(X) :- randomPointGen(X).


% with the given X, Y, generateShipCar generates an Aircraft carrier 
% if it has valid points, if not, it does the recursion until there is
% a valid set of 5 points. The caller has to ensure that X and Y 
% are valid values.
% valid points here refers to whether there is are no other ships in that 
% particular position. 
generateShipCar(X, Y):- 
	( notValidCoor([X1,Y]) ->

		chooseStartingPoint(NewX),
		chooseStartingPoint(NewY),
		generateShipCar(NewX, NewY); 

		( notValidCoor([X2,Y]) ->

			chooseStartingPoint(NewX),
			chooseStartingPoint(NewY),
			generateShipCar(NewX, NewY);

			( notValidCoor([X,Y]) ->

				chooseStartingPoint(NewX),
				chooseStartingPoint(NewY),
				generateShipCar(NewX, NewY);

				( notValidCoor([X3,Y]) ->

					chooseStartingPoint(NewX),
					chooseStartingPoint(NewY),
					generateShipCar(NewX, NewY);

					( notValidCoor([X4,Y]) -> 

						chooseStartingPoint(NewX),
						chooseStartingPoint(NewY),
						generateShipCar(NewX, NewY);

						assert(ship_car([X1,Y], [X2,Y], [X,Y], [X3,Y], [X4,Y], 0, 0, 0, 0, 0, 0)) ))))),
		
		% write('('), write(X1), write(', '), write(Y), write(')'), nl,
		% write(string_concat('(', X2, ', ', Y, ')')), nl,
		% write(string_concat('(', X, ', ', Y, ')')), nl,
		% write(string_concat('(', X3, ', ', Y, ')')), nl,
		% write(string_concat('(', X4, ', ', Y, ')')), nl, nl,

		X1 is X-2, 
		X2 is X-1,
		X3 is X+1,
		X4 is X+2.


% with the given X, Y, generateShipCar generates an Aircraft carrier 
% if it has valid points, if not, it does the recursion until there is
% a valid set of 4 points. The caller has to ensure that X and Y 
% are valid values.
% valid points here refers to whether there is are no other ships in that 
% particular position. 
generateShipSub(X, Y):- 
	( notValidCoor([X1,Y]) ->

		chooseStartingPoint(NewX),
		chooseStartingPoint(NewY),
		generateShipSub(NewX, NewY);
		
		( notValidCoor([X2,Y]) -> 

			chooseStartingPoint(NewX),
			chooseStartingPoint(NewY),
			generateShipSub(NewX, NewY);

			( notValidCoor([X,Y]) ->

				chooseStartingPoint(NewX),
				chooseStartingPoint(NewY),
				generateShipSub(NewX, NewY);

				( notValidCoor([X3,Y]) -> 
			
					chooseStartingPoint(NewX),
					chooseStartingPoint(NewY),
					generateShipSub(NewX, NewY);  

					assert(ship_sub([X1,Y], [X2,Y], [X,Y], [X3,Y], 0, 0, 0, 0, 0)) )))),

		% write(string_concat('(', X1, ', ', Y, ')')), nl,
		% write(string_concat('(', X2, ', ', Y, ')')), nl,
		% write(string_concat('(', X1, ', ', Y, ')')), nl,
		% write(string_concat('(', X3, ', ', Y, ')')), nl, nl,

		X1 is X-2, 
		X2 is X-1, 
		X3 is X+1.



% with the given X, Y, generateShipCar generates an Aircraft carrier 
% if it has valid points, if not, it does the recursion until there is
% a valid set of 3 points. The caller has to ensure that X and Y 
% are valid values.
% valid points here refers to whether there is are no other ships in that 
% particular position. 
generateShipBship(X, Y):- 
	( notValidCoor([X1,Y]) ->

		chooseStartingPoint(NewX),
		chooseStartingPoint(NewY),
		generateShipBship(NewX, NewY); 

		( notValidCoor([X,Y]) ->

			chooseStartingPoint(NewX),
			chooseStartingPoint(NewY),
			generateShipBship(NewX, NewY);

			( notValidCoor([X2,Y]) -> 

				chooseStartingPoint(NewX),
				chooseStartingPoint(NewY),
				generateShipBship(NewX, NewY); 
				
				assert(ship_bship([X1,Y], [X,Y], [X2,Y], 0, 0, 0, 0)) ))),

		% write(string_concat('(', X1, ', ', Y, ')')), nl,
		% write(string_concat('(', X, ', ', Y, ')')), nl, 
		% write(string_concat('(', X2, ', ', Y, ')')), nl, nl,

		X1 is X-1,
		X2 is X+1.  



% with the given X, Y, generateShipCar generates an Aircraft carrier 
% if it has valid points, if not, it does the recursion until there is
% a valid set of 2 points. The caller has to ensure that X and Y 
% are valid values.
% valid points here refers to whether there is are no other ships in that 
% particular position. 
generateShipDes(X, Y):-  
	( notValidCoor([X1,Y]) ->

		chooseStartingPoint(NewX),
		chooseStartingPoint(NewY),
		generateShipDes(NewX, NewY);

		( notValidCoor([X,Y]) -> 
		
			chooseStartingPoint(NewX),
			chooseStartingPoint(NewY),
			generateShipDes(NewX, NewY);

			assert(ship_des([X1,Y], [X,Y], 0, 0, 0)) )), 
		
		% write(string_concat('(', X1, ', ', Y, ')')), nl,
		% write(string_concat('(', X, ', ', Y, ')')), nl, nl,

		X1 is X-1.



% Returns true when the Coor is not available - that is, there is already a ship 
% at that particular point
notValidCoor(Coor) :- ship_car(Coor, _,    _,    _,    _,    _, _, _, _, _, _ ).   % case 1
notValidCoor(Coor) :- ship_car(_,    Coor, _,    _,    _,    _, _, _, _, _, _ ).   % case 2
notValidCoor(Coor) :- ship_car(_,    _,    Coor, _,    _,    _, _, _, _, _, _ ).   % case 3
notValidCoor(Coor) :- ship_car(_,    _,    _,    Coor, _,    _, _, _, _, _, _ ).   % case 4
notValidCoor(Coor) :- ship_car(_,    _,    _,    _,    Coor, _, _, _, _, _, _ ).   % case 5
	                % ship_car(pt1,  pt2,  pt3,  pt4,  pt5,  1f,2f,3f,4f,5f,tf)    % labels

notValidCoor(Coor) :- ship_sub(Coor, _,    _,    _,      _, _, _, _, _ ).   % case 1
notValidCoor(Coor) :- ship_sub(_,    Coor, _,    _,      _, _, _, _, _ ).   % case 2
notValidCoor(Coor) :- ship_sub(_,    _,    Coor, _,      _, _, _, _, _ ).   % case 3
notValidCoor(Coor) :- ship_sub(_,    _,    _,    Coor,   _, _, _, _, _ ).   % case 4
	                % ship_sub(pt1,  pt2,  pt3,  pt4,    1f,2f,3f,4f,tf)    % labels

notValidCoor(Coor) :- ship_bship(Coor, _,    _,      _, _, _, _ ).   % case 1
notValidCoor(Coor) :- ship_bship(_,    Coor, _,      _, _, _, _ ).   % case 2
notValidCoor(Coor) :- ship_bship(_,    _,    Coor,   _, _, _, _ ).   % case 3
	                % ship_bship(pt1,  pt2,  pt3,    1f,2f,3f,tf)    % labels

notValidCoor(Coor) :- ship_des(Coor, _,       _, _, _ ).   % case 1
notValidCoor(Coor) :- ship_des(_,    Coor,    _, _, _ ).   % case 2
	                % ship_des(pt1,  pt2,     1f,2f,tf)    % labels


% Similar to a switch statment to call the specific function pertaining to the 
% ship type
selectShip(X, Y, Type) :-
	( Type == 2 -> 
		generateShipDes(X, Y); 
		( Type == 3 -> 
			generateShipBship(X, Y); 
			(Type == 4 ->
				generateShipSub(X, Y); 
				( Type == 5 -> 
					generateShipCar(X, Y);
					write("Invalid Input"))))).


% Runs upon initialization to prevent human errors from taking place 
% (such as creating a very small a board size). It populates the 
% knowledge base with 1 of each battleship. 
:- initialization(placeShip).
placeShip :- chooseStartingPoint(X1),       % creating a destroyer
			 chooseStartingPoint(Y1),
			 selectShip(X1, Y1, 2), 

			 chooseStartingPoint(X2),       % creating a Battleship
			 chooseStartingPoint(Y2),
			 selectShip(X2, Y2, 3), 
			 
			 chooseStartingPoint(X3),       % creating a Submarine
			 chooseStartingPoint(Y3),
			 selectShip(X3, Y3, 4), 
			 
			 chooseStartingPoint(X4),       % creating an Aircraft Carrier
			 chooseStartingPoint(Y4),
			 selectShip(X4, Y4, 5).
