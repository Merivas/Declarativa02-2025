         % X pasa de libre a ligada a 5
X = 5.

?- Y = [1,2,Z].  % Y ligada a una lista con Z libre
Y = [1,2,Z], Z = _. 

padre(juan, pedro).
padre(juan, luis).
padre(ana, carla).

:-padre(juan, Hijo).

