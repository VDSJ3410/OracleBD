-- Consultas Simples:
-- Pregunta: ¿Cómo obtener el nombre, puesto y empresa de cada empleado?
-- Obtenemos el nombre, puesto y la empresa de cada empleado
SELECT e.NOMBRE AS EMPLEADO, e.PUESTO, emp.NOMBRE AS EMPRESA
FROM EMPLEADO e
JOIN EMPRESA emp ON e.ID_EMPRESA = emp.ID_EMPRESA;

-- Pregunta: ¿Qué empleados ganan más de $20,000?
-- Seleccionamos los empleados que ganan más de $20,000
SELECT NOMBRE, PUESTO, SALARIO
FROM EMPLEADO
WHERE SALARIO > 20000;

-- Pregunta: ¿Cómo mostrar los empleados ordenados por salario descendente con alias de columnas?
-- Mostramos los empleados ordenados por salario descendente y con alias de columna
SELECT NOMBRE AS "Empleado", PUESTO AS "Puesto", SALARIO AS "Salario"
FROM EMPLEADO
ORDER BY SALARIO DESC;

--  Pregunta: ¿Qué empleados trabajan en la empresa "Tech Solutions"?
-- Obtenemos los empleados que trabajan en la empresa "Tech Solutions"
SELECT NOMBRE, PUESTO
FROM EMPLEADO
WHERE ID_EMPRESA = (
    SELECT ID_EMPRESA
    FROM EMPRESA
    WHERE NOMBRE = 'Tech Solutions'
);

--  Pregunta: ¿Qué empleados ganan más que el promedio de su empresa?
-- Seleccionamos empleados que ganan más que el promedio de su propia empresa
SELECT e.NOMBRE, e.PUESTO, e.SALARIO
FROM EMPLEADO e
WHERE e.SALARIO > (
    SELECT AVG(e2.SALARIO)
    FROM EMPLEADO e2
    WHERE e2.ID_EMPRESA = e.ID_EMPRESA
);

-- Pregunta: ¿Qué empleados participan en qué proyectos y cuántas horas han trabajado? 
-- Obtenemos qué empleados participan en qué proyectos y cuántas horas trabajaron
SELECT e.NOMBRE AS EMPLEADO, p.NOMBRE AS PROYECTO, a.HORAS
FROM ASIGNACION a
JOIN EMPLEADO e ON a.ID_EMPLEADO = e.ID_EMPLEADO
JOIN PROYECTO p ON a.ID_PROYECTO = p.ID_PROYECTO;

--  Pregunta: ¿Cuántas horas totales se han trabajado por proyecto?
-- Calculamos las horas totales trabajadas por proyecto
SELECT p.NOMBRE AS PROYECTO, SUM(a.HORAS) AS TOTAL_HORAS
FROM ASIGNACION a
JOIN PROYECTO p ON a.ID_PROYECTO = p.ID_PROYECTO
GROUP BY p.NOMBRE;

--  Pregunta: ¿Qué proyectos tienen más de 150 horas totales trabajadas?
-- Seleccionamos los proyectos que tienen más de 150 horas totales trabajadas
SELECT p.NOMBRE AS PROYECTO, SUM(a.HORAS) AS TOTAL_HORAS
FROM ASIGNACION a
JOIN PROYECTO p ON a.ID_PROYECTO = p.ID_PROYECTO
GROUP BY p.NOMBRE
HAVING SUM(a.HORAS) > 150;

--  Pregunta: ¿Qué empresas tienen al menos un empleado asignado a algún proyecto?
-- Mostramos las empresas que tienen al menos un empleado asignado a algún proyecto
SELECT e.NOMBRE AS EMPRESA
FROM EMPRESA e
WHERE EXISTS (
    SELECT 1
    FROM EMPLEADO emp
    JOIN ASIGNACION a ON emp.ID_EMPLEADO = a.ID_EMPLEADO
    WHERE emp.ID_EMPRESA = e.ID_EMPRESA
);

-- Pregunta: ¿Cuál es el salario promedio por empresa?
-- Calculamos el salario promedio por empresa
SELECT emp.NOMBRE AS EMPRESA, AVG(emp_sal.SALARIO) AS SALARIO_PROMEDIO
FROM EMPRESA emp
JOIN EMPLEADO emp_sal ON emp.ID_EMPRESA = emp_sal.ID_EMPRESA
GROUP BY emp.NOMBRE;
