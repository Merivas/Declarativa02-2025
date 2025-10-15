crear_archivo :-
    open('salida.txt', write, Stream),
    writeln(Stream, 'Registro de datos del sistema:'),
    writeln(Stream, '-----------------------------'),
    format(Stream, 'Usuario: ~w~n', ['Ana']),
    format(Stream, 'Edad: ~d~n', [25]),
    close(Stream),
    writeln('Archivo creado y cerrado correctamente.').
%/////////////////////////////////////////////////////////////////

%Leer texto línea por línea
leer_archivo :-
    open('salida.txt', read, Stream),
    repeat,
        read_line_to_string(Stream, Linea),
        (   Linea == end_of_file
        ->  writeln('--- Fin del archivo ---'), !
        ;   writeln(Linea),
            fail
        ),
    close(Stream).

%Leer términos Prolog
:- dynamic persona/2.

cargar_personas :-
    open('datos.pl', read, Stream),
    cargar(Stream),
    close(Stream).

cargar(Stream) :-
    read(Stream, Termino),
    (   Termino == end_of_file
    ->  true
    ;   assert(Termino),
        cargar(Stream)
    ).
%persona(X,Y).

%/////////////////////////////////////////////////////////////////

actualizar_archivo(Nombre, Mensaje) :-
    open(Nombre, append, S),
    format(S, 'Actualización: ~w~n', [Mensaje]),
    close(S),
    writeln('Archivo actualizado correctamente.').

%/////////////////////////////////////////////////////////////////

% -----------------------------------------
% Ejemplo 1: Escritura condicional
% -----------------------------------------
guardar_nota(Estudiante, Nota) :-
    (   Nota >= 0, Nota =< 10
    ->  open('notas.txt', append, Stream),
        format(Stream, 'Estudiante: ~w | Nota: ~w~n', [Estudiante, Nota]),
        close(Stream),
        format('✅ Nota registrada para ~w.~n', [Estudiante])
    ;   format('⚠️  Nota inválida para ~w: ~w (debe estar entre 0 y 10).~n', [Estudiante, Nota])
    ).
%guardar_nota('Ana', 9).
%guardar_nota('Luis', 12).
%guardar_nota('Carlos', 8).


% -------------------------------------------------------------------------
% % -----------------------------------------
% Ejemplo 2: Actualización total de archivo
% -----------------------------------------
:- dynamic producto/2.

% Base inicial de hechos dinámicos
producto('Laptop', 750).
producto('Mouse', 25).
producto('Teclado', 45).

% Guardar toda la base en un archivo
guardar_productos :-
    open('productos.txt', write, Stream),
    forall(producto(Nombre, Precio),
           format(Stream, 'Producto: ~w | Precio: $~w~n', [Nombre, Precio])),
    close(Stream),
    writeln('💾 Archivo "productos.txt" actualizado con éxito.').

% Actualizar un producto y volver a guardar el archivo
actualizar_precio(Nombre, NuevoPrecio) :-
    retract(producto(Nombre, _)),       % elimina el anterior
    assert(producto(Nombre, NuevoPrecio)), % agrega el nuevo
    guardar_productos.
