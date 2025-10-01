% Caso base

%factorial(0, 1).

% Caso general
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.


% Ejemplo: consulta factorial(5, F).
%
% Paso 1: N=5 > 0, calcula N1=4, llama factorial(4,F1).
% Paso 2: N=4 > 0, N1=3, llama factorial(3,F2).
% Paso 3: N=3 > 0, N1=2, llama factorial(2,F3).
% Paso 4: N=2 > 0, N1=1, llama factorial(1,F4).
% Paso 5: N=1 > 0, N1=0, llama factorial(0,F5).
%
% Caso base:
% factorial(0,1) → F5=1.
%
% Ahora empieza la vuelta (resolviendo de atrás hacia adelante):
% F4 is 1 * 1 = 1.
% F3 is 2 * 1 = 2.
% F2 is 3 * 2 = 6.
% F1 is 4 * 6 = 24.
% F  is 5 * 24 = 120.
%
% Respuesta final: F = 120.



%factorial(5, F).

%//////////////////////////////////////////////////////////////////////////////////

% Caso base
longitud([], 0).

% Caso general
longitud([_|T], N) :-
	longitud(T, N1),
	N is N1 + 1.

%longitud([a, b, c, d], L).

%//////////////////////////////////////////////////////////////////////////////77

% Caso base: la suma de una lista vacía es 0
suma([], 0).

% Caso general: sumar cabeza con la suma de la cola
suma([H|T], S) :-
    suma(T, S1),
    S is H + S1.

% suma([1, 2, 3, 4, 5], S).

% Caso base: X es miembro si está en la cabeza
miembro(X, [X|_]).

% Caso general: X es miembro si está en la cola
miembro(X, [_|T]) :-
	miembro(X, T).

%miembro(3, [1, 2, 3, 4]).
%miembro(9, [1, 2, 3, 4]).


%///////////////////////////////////////////////////////////////////////

% Caso base: la inversa de la lista vacía es []
invertir([], []).

% Caso general: invierto la cola y agrego la cabeza al final
invertir([H|T], R) :-
	invertir(T, RT),
	append(RT, [H], R).

%invertir([1, 2, 3], R).
