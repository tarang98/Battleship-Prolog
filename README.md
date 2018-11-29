# Battleship-Prolog

What is the problem?

We have created an implementation of the game Battleship using Prolog. Our implementation uses a command-line interface. It also features an AI that can randomly guess positions without repeating. We also let the user know when they hit or miss AI ships. The game is in the form of a loop and in each cycle the player and AI guess positions. The game breaks out of the loop when the player has hit all AI ships. In our implementation there are four kinds of ships of sizes 2 through 5. 

What is the something extra?
When the player sinks an AI ship, we fetch information from Wikidata that tells the player about the kind of ship that they have sunk. For example, 'destroyer' is a ship of size 2 in our game. The game displays: 'A fast, maneuverable long-endurance warship intended to escort larger vessels in a fleet, convoy or battle group and defend them against smaller powerful short-range attackers.' We used rdf to fetch the information from Wikidata. Also, we edited Wikidata with information from Wikipedia.


What did we learn from doing this?

Prolog is a good option for logic based games like Battleship. For example, when a ship is hit, when a ship has sunk, generating non-repeated AI moves, etc., are all issues that can be answered through rules. Prolog is also a good language for the Semantic Web as it is easy to deal with information from those websites. However, for practical uses, one may need to use many imperative features. For example, we used flags to denote when a ship is hit. Prolog's relations also were very helpful as it could associate many features with a simple predicate. We also found ourselves thinking about what to compute rather than how to compute.
