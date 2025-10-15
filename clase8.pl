% Declaramos el predicado estudiante/2 como dinámico.
:- dynamic estudiante/2.

% Hechos iniciales de la base.
estudiante('Ana', programacion).
estudiante('Luis', logica).
estudiante('Carlos', declarativa).

% Consultar todos los estudiantes registrados
listar_estudiantes :-
    writeln('--- Lista de estudiantes ---'),
    estudiante(Nombre, Curso),
    format('~w cursa ~w.~n', [Nombre, Curso]), % Se muestra el nombre y curso del estudiante
    fail. %fail. se usa para forzar que Prolog explore todas las combinaciones y liste todo antes de terminar.
listar_estudiantes.  % Finaliza el backtracking

%listar_estudiantes.

%/////////////////////////////////////////////////////////////////////////////////////

% Agregar nuevo estudiante
agregar_estudiante(Nombre, Curso) :-
    assert(estudiante(Nombre, Curso)),
    format('Se ha agregado el estudiante: ~w en el curso ~w.~n', [Nombre, Curso]).

% agregar_estudiante('Carlos', declarativa).

%//////////////////////////////////////////////////////////////////////////////////////

% Eliminar un estudiante por nombre
eliminar_estudiante(Nombre) :-
    retract(estudiante(Nombre, Curso)),
    format('Se ha eliminado a ~w del curso ~w.~n', [Nombre, Curso]), % ~w Imprime un término
    !. % evita múltiples eliminaciones

% Eliminar todos los estudiantes
eliminar_todos :-
    retractall(estudiante(_, _)),
    writeln('Todos los estudiantes han sido eliminados de la base.').

% eliminar_estudiante('Luis').

%////////////////////////////////////////////////////////////////////////////////

% Actualizar el curso de un estudiante
actualizar_curso(Nombre, NuevoCurso) :-
    retract(estudiante(Nombre, _)),  % elimina el hecho antiguo
    assert(estudiante(Nombre, NuevoCurso)),  % inserta el nuevo
    format('Se ha actualizado el curso de ~w a ~w.~n', [Nombre, NuevoCurso]),
    !. % evita múltiples actualizaciones

    % actualizar_curso('Ana', inteligencia_artificial).

%//////////////////////////////////////////////////////////////////////////////////////

% Agregar solo si no existe
agregar_unico(Nombre, Curso) :-
    (   estudiante(Nombre, Curso)
    ->  format('El estudiante ~w ya está inscrito en ~w.~n', [Nombre, Curso])
    ;   assert(estudiante(Nombre, Curso)),
        format('Se ha agregado a ~w en el curso ~w.~n', [Nombre, Curso])
    ).

%agregar_unico('Ana', programacion).
%agregar_unico('Sofía', logica).





%actividad replicar la siguiente salida en la consola:
% ==========================================
% 📘 SISTEMA DE EMPLEADOS EN PROLOG
% Simulación de una sesión interactiva con el menú principal
% ==========================================

% Inicio del sistema
?- main.
% 📘 SISTEMA DE EMPLEADOS INICIADO
% ========= MENÚ =========
% 1. Listar empleados
% 2. Agregar empleado
% 3. Eliminar empleado
% 4. Actualizar empleado
% 5. Agregar con validación
% 6. Eliminar todos
% 0. Salir
% ========================
% Seleccione una opción: 1.

% --- LISTA DE EMPLEADOS ---
% Nombre: Ana | Depto: contabilidad | Salario: $900
% Nombre: Luis | Depto: sistemas | Salario: $1200
% Nombre: Sofía | Depto: marketing | Salario: $1100
% ----------------------------

% Seleccione una opción: 2.
% Nombre: 'Carlos'.
% Departamento: 'ventas'.
% Salario: 950.
% ✅ Se agregó a Carlos en el departamento ventas con salario $950.

% Seleccione una opción: 4.
% Nombre: 'Luis'.
% Nuevo departamento: 'infraestructura'.
% Nuevo salario: 1400.
% 🔁 Datos actualizados: Luis → Depto: infraestructura | Salario: $1400

% Seleccione una opción: 3.
% Nombre a eliminar: 'Ana'.
% 🗑️  Se eliminó a Ana del departamento contabilidad (salario $900).

% Seleccione una opción: 1.
% --- LISTA DE EMPLEADOS ---
% Nombre: Luis | Depto: infraestructura | Salario: $1400
% Nombre: Sofía | Depto: marketing | Salario: $1100
% Nombre: Carlos | Depto: ventas | Salario: $950
% ----------------------------

% Fin de la simulación de sesión del sistema de empleados
% ==========================================

