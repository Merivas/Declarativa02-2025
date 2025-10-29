% -------------------------------------------------------------------
% 1. SIMPLIFICACION SIMBOLICA BASICA
% -------------------------------------------------------------------
% Estas reglas reducen expresiones eliminando terminos neutros.
% Se asume que las expresiones vienen representadas con funtores
% prefijos, por ejemplo +(a, b) en lugar de a + b.

% Sumar cero a la izquierda no altera el resultado.
simplifica(+(0, X), X).
% Sumar cero a la derecha tampoco cambia el valor.
simplifica(+(X, 0), X).
% Multiplicar por uno a la izquierda mantiene el factor original.
simplifica(*(1, X), X).
% Multiplicar por uno a la derecha produce el mismo efecto.
simplifica(*(X, 1), X).
% Multiplicar por cero a la izquierda fuerza el resultado a cero.
simplifica(*(0, _), 0).
% Multiplicar por cero a la derecha tambien produce cero.
simplifica(*(_, 0), 0).
% Regla por defecto: si nada se reduce, la expresion se queda igual.
simplifica(X, X).

% Ejemplo interactivo:
% ?- simplifica(*(1, +(0, X)), R).
% R = X.


% -------------------------------------------------------------------
% 2. DERIVACION SIMBOLICA
% -------------------------------------------------------------------
% Calcula derivadas basicas siguiendo las reglas de derivacion para
% suma, producto y resta. Las expresiones son simbolicas, por lo que
% no se simplifican automaticamente tras aplicar las reglas.

% La derivada de una variable respecto de si misma es 1.
derivada(X, X, 1).
% La derivada de una constante respecto de cualquier variable es 0.
derivada(C, _, 0) :- number(C).
% Regla de derivacion para la suma: (A + B)' = A' + B'.
derivada(A + B, X, DA + DB) :-
    derivada(A, X, DA),
    derivada(B, X, DB).
% Regla del producto: (A * B)' = A * B' + B * A'.
derivada(A * B, X, A*DB + B*DA) :-
    derivada(A, X, DA),
    derivada(B, X, DB).
% Regla de la resta: (A - B)' = A' - B'.
derivada(A - B, X, DA - DB) :-
    derivada(A, X, DA),
    derivada(B, X, DB).

% Ejemplo:
% ?- derivada(x*x + 3*x + 2, x, D).
% D = x*1 + x*1 + 3*1 + 0.


% -------------------------------------------------------------------
% 3. EVALUACION SIMBOLICA
% -------------------------------------------------------------------
% Sustituye la variable X por un valor numerico V dentro de una
% expresion y la evalua aritmeticamente. Las expresiones siguen el
% mismo formato prefijo usado en los ejemplos anteriores.

%Donde:

%evalua(Expresion, Variable, Valor, Resultado).

%Expresion → es una fórmula simbólica (por ejemplo x*x + 3*x + 2)

%Variable → el símbolo que queremos sustituir (x)

%Valor → el número que queremos usar (2)

%Resultado → el valor final calculado (12)

% Si el termino coincide con la variable de interes, se reemplaza.
evalua(X, X, V, V).
% Las constantes permanecen iguales sin importar la variable.
evalua(C, _, _, C) :- number(C).
% Evaluacion de una suma: se evalua cada sumando y se suman sus valores.
evalua(A + B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA + RB.
% Evaluacion de un producto: se evalua cada factor y se multiplican.
evalua(A * B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA * RB.

% Ejemplo:
% ?- evalua(x*x + 3*x + 2, x, 2, R).
% R = 12.


% -------------------------------------------------------------------
% 4. SUMA DE FRACCIONES (REPRESENTACION SIMBOLICA)
% -------------------------------------------------------------------
% Representa fracciones como estructuras frac(Numerador, Denominador)
% y suma dos fracciones sin simplificarlas.

% Calcula la fraccion resultante aplicando la suma de fracciones.
suma(frac(A, B), frac(C, D), frac(N, M)) :-
    N is A*D + C*B,
    M is B*D.

% Ejemplo:
% ?- suma(frac(1,2), frac(1,3), R).
% R = frac(5,6).


% -------------------------------------------------------------------
% 5. RESOLUCION SIMBOLICA SENCILLA
% -------------------------------------------------------------------
% Se resuelven ecuaciones lineales basicas de la forma X + N = M,
% es decir, se despeja la variable cuando aparece sumada a una constante.

% Caso donde la variable aparece primero: X + N = M.
resuelve(X + N = M, X, V) :-
    number(N), number(M),
    V is M - N.
% Caso donde la variable aparece como segundo sumando: N + X = M.
resuelve(N + X = M, X, V) :-
    number(N), number(M),
    V is M - N.

% Ejemplo:
% ?- resuelve(x + 3 = 7, x, V).
% V = 4.
