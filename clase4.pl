% ---------------------------------------
% Base de conocimiento
% ---------------------------------------

% Hechos: lista de usuarios y sus roles
usuario(ana, admin).
usuario(juan, editor).
usuario(luis, visitante).

% ---------------------------------------
% Uso de NEGACIÓN (\+/1)
% Verifica si un usuario NO es administrador
% ---------------------------------------
no_es_admin(Nombre) :-
    \+ usuario(Nombre, admin).

% ---------------------------------------
% Uso de CORTE (!)
% Devuelve el mayor entre dos números
% ---------------------------------------
maximo(X, Y, X) :- X >= Y, !.
maximo(_, Y, Y).

% ---------------------------------------
% Uso de FALLO (fail)
% Muestra todos los usuarios de la base
% ---------------------------------------
mostrar_usuarios :-
    usuario(Nombre, Rol),
    write('Usuario: '), write(Nombre),
    write(' - Rol: '), write(Rol), nl,
    fail.
mostrar_usuarios. % Cierra el backtracking

% ---------------------------------------
% Uso de ENTRADA y SALIDA
% Pide un número al usuario y dice si es mayor o menor que 10
% ---------------------------------------
verificar_numero :-
    write('Ingrese un número: '), read(Num),
    (   Num > 10
    ->  write('El número es mayor que 10')
    ;   write('El número es menor o igual a 10')
    ).

% ---------------------------------------consultas-----------------
%--Negación (\+/1):

:- no_es_admin(juan).

:- no_es_admin(ana).

%--Corte (!/0):
:- maximo(8, 5, M).

:-maximo(3, 10, M).

%--Fallo (fail/0):
%--:- mostrar_usuarios.

%---Entrada/salida

%--:- verificar_numero.











