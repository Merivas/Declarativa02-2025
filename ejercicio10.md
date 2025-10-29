# 📘 Guía de Ejercicios – Programación Simbólica en Prolog

### Instrucciones.

- Usa los predicados implementados (`simplifica/2`, `derivada/3`, `evalua/4`, `suma/3`, `resuelve/3`).
- Ejecuta las consultas en **SWI-Prolog**.
- Registra los resultados y súbelos al repositorio indicado.

---

## 🔹 1. Simplificación simbólicza

**1.** Simplifique la siguiente expresión:  

```prolog
?- simplifica(*(1, +(0, X)), R).
```

**2.** Aplique las reglas de simplificación al siguiente término:  

```prolog
?- simplifica(*(0, +(X, 3)), R).
```

**3.** Determine el resultado tras aplicar las reglas a:  

```prolog
?- simplifica(+(X, 0), R).
```

**4.** Proponga una expresión propia que contenga al menos **una suma y un producto con términos neutros** y simplifíquela.

---

## 🔸 2. Derivación simbólica

**5.** Calcule la derivada de la siguiente expresión:  

```prolog
?- derivada(x*x + 3*x + 2, x, D).
```

**6.** Derive la siguiente función:  

```prolog
?- derivada(x*x*x, x, D).
```

**7.** Calcule la derivada de la resta:  

```prolog
?- derivada(x*x - 4*x + 1, x, D).
```

**8.** Cree su propia función polinómica de tres términos y obtenga su derivada simbólica.

---

## 🧮 3. Evaluación simbólica

**9.** Evalúe la siguiente expresión sustituyendo `x = 3`:  

```prolog
?- evalua(x*x + 3*x + 2, x, 3, R).
```

**10.** Determine el resultado de la expresión:  

```prolog
?- evalua(x*x - 4*x + 4, x, 2, R).
```

**11.** Combine evaluación y derivación: primero derive y luego evalúe el resultado en `x = 2`.  

```prolog
?- derivada(x*x + 3*x + 2, x, D), evalua(D, x, 2, R).
```

---

## ⚙️ 4. Suma de fracciones simbólicas

**12.** Sume las siguientes fracciones simbólicas:  

```prolog
?- suma(frac(1,2), frac(1,3), R).
```

**13.** Realice la suma siguiente y verifique el numerador y denominador del resultado:  

```prolog
?- suma(frac(2,5), frac(3,10), R).
```

**14.** Cree una regla adicional para **restar fracciones** y pruebe:  

```prolog
?- resta(frac(3,4), frac(1,2), R).
```

---

## 🧠 5. Resolución simbólica sencilla

**15.** Resuelva la ecuación:  

```prolog
?- resuelve(x + 3 = 7, x, V).
```

**16.** Pruebe el caso donde la variable aparece al final:  

```prolog
?- resuelve(5 + x = 10, x, V).
```

**17.** Cree una ecuación nueva y resuélvala simbólicamente (de la forma `x + N = M` o `N + x = M`).
