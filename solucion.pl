

%Familias
padre(esteban, clara).
padre(esteban, rodolfo).
padre(esteban, ismael).
madre(mariela, clara).
madre(mariela, rodolfo).
madre(mariela, ismael).

padre(rodolfo, lucas).
padre(rodolfo, martina).
madre(teresa, lucas).
madre(teresa, martina).

padre(andres, sofia).
madre(clara, sofia).

padre(alonso, felipe).
padre(alonso, catalina).
padre(alonso, emilia).
madre(beatriz, felipe).
madre(beatriz, catalina).
madre(beatriz, emilia).

% --- Matrimonios y relaciones ---
matrimonio(esteban, mariela).
matrimonio(rodolfo, teresa).
matrimonio(clara, andres).
matrimonio(catalina, andres).

amistad(ismael, hector).

% --- Oficios ---
oficio(hector, herrero).
oficio(teresa, tejedora).
oficio(clara, maestra).

oficio(catalina, curandera).
oficio(felipe, explorador).
oficio(emilia, ceramista).

oficio(mateo, agricultor).
oficio(irene, pastora).

% Aprendices
aprendiz(sofia, catalina).
aprendiz(lucas, hector).
aprendiz(martina, emilia).

% --- Aldeas ---
aldea(rivoria).
aldea(montelar).
aldea(durania).

vive(esteban, rivoria).
vive(mariela, rivoria).
vive(clara, rivoria).
vive(rodolfo, rivoria).
vive(ismael, rivoria).
vive(teresa, rivoria).
vive(hector, rivoria).
vive(sofia, rivoria).
vive(lucas, rivoria).
vive(martina, rivoria).

vive(alonso, montelar).
vive(beatriz, montelar).
vive(felipe, montelar).
vive(catalina, montelar).
vive(emilia, montelar).

vive(mateo, durania).
vive(irene, durania).

% --- Alianzas y rivalidades ---
alianza(rivoria, durania).
independiente(montelar).

rivalidad(rodolfo, felipe).
rivalidad(clara, catalina).

% --- Festividades ---
festividad(rivoria, fiesta_del_rio).
festividad(montelar, ceremonia_de_la_luna).
festividad(durania, feria_del_grano).

% --- Creencias ---
espiritu(rivoria, espiritu_del_agua).
espiritu(montelar, espiritu_de_la_montana).
espiritu(durania, espiritu_de_la_tierra).

% --- Jefes de aldeas ---
jefe(rivoria, esteban).
jefe(montelar, alonso).
jefe(durania, mateo).

% --- Reglas útiles ---
hijo(Hijo, Padre) :- padre(Padre, Hijo).
hijo(Hijo, Madre) :- madre(Madre, Hijo).

hermano(X,Y) :- padre(P,X), padre(P,Y), X \= Y.
hermano(X,Y) :- madre(M,X), madre(M,Y), X \= Y.

abuelo(Abuelo, Nieto) :- padre(Abuelo, Padre), padre(Padre, Nieto).
abuelo(Abuelo, Nieto) :- padre(Abuelo, Padre), madre(Padre, Nieto).
abuelo(Abuela, Nieto) :- madre(Abuela, Madre), padre(Madre, Nieto).
abuelo(Abuela, Nieto) :- madre(Abuela, Madre), madre(Madre, Nieto).

% --- Consultas de ejemplo ---
% ?- hijo(lucas, rodolfo).
% ?- matrimonio(clara, andres).
% ?- rivalidad(clara, catalina).
% ?- oficio(lucas, herrero).
% ?- espiritu(durania, X).
% ?- alianza(rivoria, durania).
% ?- aprendiz(sofia, catalina).
