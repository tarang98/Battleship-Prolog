:- use_module(library(semweb/rdf_http_plugin)).
:- use_module(library(semweb/rdf_db)).


% Similar to a switch statement, where it calls getDescURL with the specific Key based on 
% the length of that is given. Always returns true, even if input is wrong so as to not 
% break the code  
specificShip(Len) :- 
	( Len == 2 ->    
		getDescURL('Q174736');             % destroyer           
		( Len == 3 -> 
			getDescURL('Q182531');         % battleship
			( Len == 4 ->
				getDescURL('Q2811');       % submarine
				( Len == 5 -> 
					getDescURL('Q17205');  % aircraft carrier
					write("Invalid Input"))))).


% getDescURL takes in the Key which is of the form Q174736, etc. 
% essentially the key corresponds to the wikidata page. This key 
% is passed into the URL to be loaded and the data to be fetched
% getDescURL writes out the description of the subject of the 
% wikidata page and returns true. 
getDescURL(Key) :- string_concat('http://www.wikidata.org/wiki/Special:EntityData/', Key, MidURL),
				   string_concat(MidURL, '.rdf', LoadURL),
				   atom_string(PurifiedURL, LoadURL),
				   rdf_load(PurifiedURL),

				   string_concat('http://www.wikidata.org/entity/', Key, Wikidata),
				   atom_string(PurifiedWiki, Wikidata),
				   rdf(PurifiedWiki, 'http://schema.org/description', literal(lang(en, N))),
				   write(N), nl.	



