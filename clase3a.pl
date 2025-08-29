hijo(pedro, juan).
hijo(luis, juan).
hijo(maria, ana).
hijo(maria, tomas).

% Regla: descendiente(X,Y) :- hijo(X,Y).
descendiente(X,Y) :- hijo(X,Y).
descendiente(X,Y) :- hijo(X,Z), descendiente(Z,Y).

:-descendiente(maria, P).

