% Árbol binario como término:
%arbol(Valor, Izquierdo, Derecho).

% Ejemplo:
arbol(a,
      arbol(b, arbol(d,nil,nil), arbol(e,nil,nil)),
      arbol(c,nil,nil)).

% verificar si es un arbol 

es_arbol(nil).
es_arbol(arbol(_,Izq,Der)) :-
    es_arbol(Izq),
    es_arbol(Der).

      %Recorridos

      %Inorden (Izq – Raíz – Der):
      inorden(nil, []). %Si el árbol está vacío (nil), el recorrido no tiene elementos → lista vacía [].
      inorden(arbol(X,Izq,Der), L) :-
      inorden(Izq,L1),
      inorden(Der,L2),
      append(L1,[X|L2],L).

      % Preorden (Raíz – Izq – Der)
      preorden(nil, []).
      preorden(arbol(X,Izq,Der), L) :-
      preorden(Izq, L1),
      preorden(Der, L2),
      append([X|L1], L2, L).

      % Postorden (Izq – Der – Raíz)
      postorden(nil, []). 
      postorden(arbol(X,Izq,Der), L) :-
      postorden(Izq, L1),
      postorden(Der, L2),
      append(L1, L2, L3), %Concatena listas
      append(L3, [X], L).


%inorden(arbol(a,arbol(b,arbol(d,nil,nil),arbol(e,nil,nil)),arbol(c,nil,nil)),L).


% busqueda de una arbol
buscar(X, arbol(X,_,_)).
buscar(X, arbol(_,Izq,_)) :- buscar(X,Izq).
buscar(X, arbol(_,_,Der)) :- buscar(X,Der).

%buscar(e, arbol(a,arbol(b,arbol(d,nil,nil),arbol(e,nil,nil)),arbol(c,nil,nil))).

%consultas 
% es_arbol(nil).

% es_arbol(arbol(a,nil,nil)).

% 


% es_arbol(arbol(a, b, nil)).
% porque b no es un arbol

% buscar(e, arbol(a,arbol(b,arbol(d,nil,nil),arbol(e,nil,nil)),arbol(c,nil,nil))).

% buscar(c, arbol(a,arbol(b,arbol(d,nil,nil),arbol(e,nil,nil)),arbol(c,nil,nil))).

% buscar(z, arbol(a,arbol(b,arbol(d,nil,nil),arbol(e,nil,nil)),arbol(c,nil,nil))).

% buscar(X, arbol(a,arbol(b,arbol(d,nil,nil),arbol(e,nil,nil)),arbol(c,nil,nil))).
            