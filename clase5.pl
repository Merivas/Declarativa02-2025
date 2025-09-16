
% =============================================
% Base de conocimiento Prolog - Ejemplos de Operadores
% =============================================

% ---------------------------
% 1. OPERADORES ARITMÉTICOS
% ---------------------------
% En Prolog, usamos "is" para evaluar expresiones aritméticas.

% Suma
suma(X, Y, Resultado) :-
    Resultado is X + Y.

% Resta
resta(X, Y, Resultado) :-
    Resultado is X - Y.

% Multiplicación
multiplicacion(X, Y, Resultado) :-
     Resultado is X * Y.

% División
division(X, Y, Resultado) :-
    Resultado is X / Y.

%Ejemplo de consulta:
% ?- suma(5, 3, R).
% R = 8.


% ---------------------------
% 2. OPERADORES RELACIONALES
% ---------------------------
% Permiten comparar valores numéricos.

% Igualdad aritmética
igualdad(X, Y) :-
    X =:= Y.

% Desigualdad aritmética
desigualdad(X, Y) :-
    X =\= Y.

% Mayor que
mayor(X, Y,Resultado) :-
    X > Y.

% Menor que
menor(X, Y) :-
    X < Y.

% Ejemplo:
% ?- mayor(7, 3).
% true.


% ---------------------------
% 3. OPERADORES DE LIGADURA Y UNIFICACIÓN
% ---------------------------
% "=" se usa para unificar términos sin evaluación.
% "==" compara si son idénticos (sin intentar unificación).
% "\==" verifica si no son estrictamente iguales.
% "is" evalúa expresiones aritméticas.

% Ejemplo de unificación
unificacion :-
    X = 5,
    write('X se unificó con 5: '), write(X), nl.

% Ejemplo de igualdad estricta
igualdad_estricta :-
    X = 3 + 2,
    (X == 3 + 2 -> write('Son exactamente iguales.') ; write('No son exactamente iguales.')), nl.

% Ejemplo de desigualdad estricta
desigualdad_estricta :-
    X = 3 + 2,
    (X \== 5 -> write('Son diferentes.') ; write('Son iguales.')), nl.

% Ejemplo de "is"
evaluacion :-
    X = 3 + 2,
    Y is X,
    write('El valor evaluado de X es: '), write(Y), nl.


% ---------------------------
% 4. FUNCIONES ARITMÉTICAS PREDEFINIDAS
% ---------------------------
% Algunas funciones útiles para cálculos más avanzados.

% Valor absoluto
valor_absoluto(X, Resultado) :-
    Resultado is abs(X).

% Raíz cuadrada
raiz_cuadrada(X, Resultado) :-
    Resultado is sqrt(X).

% Seno
seno(X, Resultado) :-
    Resultado is sin(X).

% Coseno
coseno(X, Resultado) :-
    Resultado is cos(X).

% Redondear
redondear(X, Resultado) :-
    Resultado is round(X).

% Redondear hacia abajo
redondear_abajo(X, Resultado) :-
    Resultado is floor(X).

% Redondear hacia arriba
redondear_arriba(X, Resultado) :-
    Resultado is ceiling(X).

% Máximo entre dos números
maximo(A, B, Resultado) :-
    Resultado is max(A, B).

% Mínimo entre dos números
minimo(A, B, Resultado) :-
    Resultado is min(A, B).

% Ejemplo integrador: Calcular la distancia entre dos puntos (X1, Y1) y (X2, Y2)
distancia(X1, Y1, X2, Y2, D) :-
    D is sqrt((X2 - X1)^2 + (Y2 - Y1)^2).

% Ejemplo de consulta:
% ?- distancia(0, 0, 3, 4, D).
% D = 5.    x   
% Ejemplo de uso de módulo
modulo(X, Y, Resultado) :-
    Resultado is X mod Y.

% Ejemplo de consulta:
% ?- modulo(2, 2, R).
% R = 0.



% Hechos: padre/madre de alguien
padre(juan, ana).
padre(juan, pedro).
padre(carlos, maria).
padre(carlos, jose).

madre(luisa, ana).
madre(luisa, pedro).
madre(marta, maria).
madre(marta, jose).

% Regla: dos personas son hermanos si comparten padre y madre
hermanos(X, Y) :-
    padre(P, X), padre(P, Y),
    madre(M, X), madre(M, Y),
    X \= Y.

:- hermanos(ana, pedro).