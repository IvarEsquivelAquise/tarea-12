### ¿Cuáles son los identificadores y nombres de todos los proyectos existentes en la empresa?
SELECT IDProyecto, NombreProyecto
FROM Proyecto;

###¿Cuáles son los proyectos que se desarrollan en 'CHICAGO'?
SELECT IDProyecto, NombreProyecto
FROM Proyecto
WHERE Ubicacion = 'CHICAGO';

Consulta de Proyectos por Departamento: ¿Cuáles son los proyectos que pertenecen al departamento con identificador 2?
sql
Copiar código
SELECT IDProyecto, NombreProyecto
FROM Proyecto
WHERE IDDepartamento = 2;
Consulta de Proyectos y Departamentos: ¿Cuáles son los nombres y ubicaciones de los proyectos junto con los nombres de sus departamentos asociados?
sql
Copiar código
SELECT Proyecto.NombreProyecto, Proyecto.Ubicacion, Departamento.NombreDepartamento
FROM Proyecto
JOIN Departamento ON Proyecto.IDDepartamento = Departamento.IDDepartamento;
Consulta de Empleados por Proyecto: ¿Qué empleados están asignados al proyecto identificado con el número 4, y cuáles son sus nombres?
sql
Copiar código
SELECT Empleado.IDEmpleado, Empleado.NombreEmpleado
FROM EmpleadoProyecto
JOIN Empleado ON EmpleadoProyecto.IDEmpleado = Empleado.IDEmpleado
WHERE EmpleadoProyecto.IDProyecto = 4;
Consulta de Proyectos por Empleado: ¿En qué proyectos está participando el empleado con el identificador 4, y cuáles son los nombres de esos proyectos?
sql
Copiar código
SELECT Proyecto.IDProyecto, Proyecto.NombreProyecto
FROM EmpleadoProyecto
JOIN Proyecto ON EmpleadoProyecto.IDProyecto = Proyecto.IDProyecto
WHERE EmpleadoProyecto.IDEmpleado = 4;
Consulta de Horas Trabajadas por Proyecto: ¿Cuántas horas han trabajado en total los empleados en el proyecto con identificador 2?
sql
Copiar código
SELECT SUM(HorasTrabajadas) AS TotalHoras
FROM EmpleadoProyecto
WHERE IDProyecto = 2;
Consulta de Empleados con Horas Trabajadas: ¿Cuáles son los empleados que han trabajado más de 10 horas en el proyecto con identificador 2?
sql
Copiar código
SELECT Empleado.IDEmpleado, Empleado.NombreEmpleado
FROM EmpleadoProyecto
JOIN Empleado ON EmpleadoProyecto.IDEmpleado = Empleado.IDEmpleado
WHERE EmpleadoProyecto.IDProyecto = 2
  AND EmpleadoProyecto.HorasTrabajadas > 10;
Consulta de Total de Horas por Empleado: ¿Cuál es el total de horas trabajadas por cada empleado en todos los proyectos?
sql
Copiar código
SELECT Empleado.IDEmpleado, Empleado.NombreEmpleado, SUM(EmpleadoProyecto.HorasTrabajadas) AS TotalHoras
FROM Empleado
JOIN EmpleadoProyecto ON Empleado.IDEmpleado = EmpleadoProyecto.IDEmpleado
GROUP BY Empleado.IDEmpleado, Empleado.NombreEmpleado;
Consulta de Empleados con Múltiples Proyectos: ¿Cuáles son los empleados que trabajan en más de un proyecto?
sql
Copiar código
SELECT Empleado.IDEmpleado, Empleado.NombreEmpleado, COUNT(EmpleadoProyecto.IDProyecto) AS NumeroProyectos
FROM Empleado
JOIN EmpleadoProyecto ON Empleado.IDEmpleado = EmpleadoProyecto.IDEmpleado
GROUP BY Empleado.IDEmpleado, Empleado.NombreEmpleado
HAVING NumeroProyectos > 1;
Consulta de Empleados y Horas Totales: ¿Cuáles son los empleados que han trabajado más de 30 horas en total en todos los proyectos?
sql
Copiar código
SELECT Empleado.IDEmpleado, Empleado.NombreEmpleado, SUM(EmpleadoProyecto.HorasTrabajadas) AS TotalHoras
FROM Empleado
JOIN EmpleadoProyecto ON Empleado.IDEmpleado = EmpleadoProyecto.IDEmpleado
GROUP BY Empleado.IDEmpleado, Empleado.NombreEmpleado
HAVING TotalHoras > 30;
Consulta de Proyectos y Horas Promedio: ¿Cuál es el promedio de horas trabajadas por proyecto?
sql
Copiar código
SELECT Proyecto.IDProyecto, Proyecto.NombreProyecto, AVG(EmpleadoProyecto.HorasTrabajadas) AS HorasPromedio
FROM Proyecto
JOIN EmpleadoProyecto ON Proyecto.IDProyecto = EmpleadoProyecto.IDProyecto
GROUP BY Proyecto.IDProyecto, Proyecto.NombreProyecto;
