% ---------------------------------------------
% SISTEMA DE GESTIÓN DE EMPLEADOS (DINÁMICO)
% ---------------------------------------------

% 1️⃣ Declaración dinámica
:- dynamic empleado/3.

% Base inicial de conocimiento
empleado('Ana', contabilidad, 900).
empleado('Luis', sistemas, 1200).
empleado('Sofía', marketing, 1100).

% ---------------------------------------------
% 2️⃣ Mostrar todos los empleados
listar_empleados :-
    writeln('--- LISTA DE EMPLEADOS ---'),
    (   empleado(Nombre, Depto, Salario),
        format('Nombre: ~w | Depto: ~w | Salario: $~w~n', [Nombre, Depto, Salario]),
        fail
    ;   writeln('----------------------------')
    ).

% ---------------------------------------------
% 3️⃣ Agregar nuevo empleado
% Evita duplicados verificando si ya existe
agregar_empleado(Nombre, Depto, Salario) :-
    (   empleado(Nombre, _, _)
    ->  format('❌ El empleado ~w ya existe en la base.~n', [Nombre])
    ;   assertz(empleado(Nombre, Depto, Salario)),
        format('✅ Se agregó a ~w en el departamento ~w con salario $~w.~n',
               [Nombre, Depto, Salario])
    ).

% ---------------------------------------------
% 4️⃣ Eliminar empleado por nombre
eliminar_empleado(Nombre) :-
    (   retract(empleado(Nombre, Depto, Salario))
    ->  format('🗑️  Se eliminó a ~w del departamento ~w (salario $~w).~n',
               [Nombre, Depto, Salario])
    ;   format('⚠️  No se encontró al empleado ~w.~n', [Nombre])
    ).

% Eliminar todos
eliminar_todos :-
    retractall(empleado(_, _, _)),
    writeln('💣 Todos los registros han sido eliminados de la base.').

% ---------------------------------------------
% 5️⃣ Actualizar salario o departamento
actualizar_empleado(Nombre, NuevoDepto, NuevoSalario) :-
    (   retract(empleado(Nombre, _, _))
    ->  assertz(empleado(Nombre, NuevoDepto, NuevoSalario)),
        format('🔁 Datos actualizados: ~w → Depto: ~w | Salario: $~w~n',
               [Nombre, NuevoDepto, NuevoSalario])
    ;   format('⚠️  No se encontró a ~w para actualizar.~n', [Nombre])
    ).

% ---------------------------------------------
% 6️⃣ Ejemplo de incorporación condicionada
% Solo agrega si el salario es mayor a 0
agregar_condicional(Nombre, Depto, Salario) :-
    (   Salario =< 0
    ->  format('🚫 No se puede agregar a ~w con salario inválido: $~w~n', [Nombre, Salario])
    ;   agregar_empleado(Nombre, Depto, Salario)
    ).

% ---------------------------------------------
% 7️⃣ Menú interactivo
menu :-
    writeln(' '),
    writeln('========= MENÚ ========='),
    writeln('1. Listar empleados'),
    writeln('2. Agregar empleado'),
    writeln('3. Eliminar empleado'),
    writeln('4. Actualizar empleado'),
    writeln('5. Agregar con validación'),
    writeln('6. Eliminar todos'),
    writeln('0. Salir'),
    writeln('========================'),
    write('Seleccione una opción: '),
    read(Opcion),
    ejecutar(Opcion).

% ---------------------------------------------
% 8️⃣ Ejecutor del menú
ejecutar(1) :- listar_empleados, menu.
ejecutar(2) :-
    write('Nombre: '), read(N),
    write('Departamento: '), read(D),
    write('Salario: '), read(S),
    agregar_empleado(N, D, S),
    menu.
ejecutar(3) :-
    write('Nombre a eliminar: '), read(N),
    eliminar_empleado(N),
    menu.
ejecutar(4) :-
    write('Nombre: '), read(N),
    write('Nuevo departamento: '), read(D),
    write('Nuevo salario: '), read(S),
    actualizar_empleado(N, D, S),
    menu.
ejecutar(5) :-
    write('Nombre: '), read(N),
    write('Departamento: '), read(D),
    write('Salario: '), read(S),
    agregar_condicional(N, D, S),
    menu.
ejecutar(6) :- eliminar_todos, menu.
ejecutar(0) :- writeln('👋 Fin del programa.').
ejecutar(_) :- writeln('❗ Opción no válida.'), menu.

% ---------------------------------------------
% 9️⃣ Punto de entrada
main :-
    writeln('📘 SISTEMA DE EMPLEADOS INICIADO'),
    menu.
