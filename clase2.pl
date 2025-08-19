% -------------------------------
% Hechos: Mamíferos
% -------------------------------
mamifero(leon).
mamifero(vaca).
mamifero(cabra).

% -------------------------------
% Hechos: Qué come cada animal
% -------------------------------
come(leon, carne).
come(vaca, pasto).
come(cabra, pasto).

% -------------------------------
% Reglas
% -------------------------------

% Regla 1: Todo mamífero (excepto el león) es comida para el león
comida(X) :- mamifero(X), X \= leon.

% Regla 2: Un animal es herbívoro si come pasto
herbivoro(X) :- come(X, pasto).

% Regla 3: Un animal es carnívoro si come carne
carnivoro(X) :- come(X, carne).

% Regla 4: Todo animal que es comida del león es una presa
presa(X) :- comida(X).

% Regla 5: Un depredador es todo animal carnívoro
depredador(X) :- carnivoro(X).

% Regla 6: Un animal no come cierta comida si es mamífero y no está declarado que la coma
no_come(X, Y) :- mamifero(X), \+ come(X, Y).
