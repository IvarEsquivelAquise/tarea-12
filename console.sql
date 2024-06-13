### ¿Cuál es el total de ventas realizadas en el año 2009?

SELECT SUM(Total_Venta) AS Total_Ventas_2009
FROM (
SELECT CONVERT(DECIMAL(10,2), SUM(Precio_Unitario * Cantidad * (1 - Descuento))) AS Total_Venta
FROM FACTURA F
INNER JOIN DETALLE_FACTURA DF ON F.Numero_Factura = DF.Numero_Factura
WHERE YEAR(Fecha_Factura) = 2009
GROUP BY F.Numero_Factura
) AS Ventas_2009;

### ¿Cuáles son los proyectos que se desarrollan en 'CHICAGO'?

SELECT IDProyecto, NombreProyecto
FROM Proyecto
WHERE Ubicacion = 'CHICAGO';

### ¿Cuáles son los proyectos que pertenecen al departamento con identificador 2?
  
SELECT IDProyecto, NombreProyecto
FROM Proyecto
WHERE IDDepartamento = 2;

### ¿Cuáles son los nombres y ubicaciones de los proyectos junto con los nombres de sus departamentos asociados?
  
SELECT Proyecto.NombreProyecto, Proyecto.Ubicacion, Departamento.NombreDepartamento
FROM Proyecto
JOIN Departamento ON Proyecto.IDDepartamento = Departamento.IDDepartamento;

### ¿Qué empleados están asignados al proyecto identificado con el número 4, y cuáles son sus nombres?

SELECT Empleado.IDEmpleado, Empleado.NombreEmpleado
FROM EmpleadoProyecto
JOIN Empleado ON EmpleadoProyecto.IDEmpleado = Empleado.IDEmpleado
WHERE EmpleadoProyecto.IDProyecto = 4;

### ¿En qué proyectos está participando el empleado con el identificador 4, y cuáles son los nombres de esos proyectos?

SELECT Proyecto.IDProyecto, Proyecto.NombreProyecto
FROM EmpleadoProyecto
JOIN Proyecto ON EmpleadoProyecto.IDProyecto = Proyecto.IDProyecto
WHERE EmpleadoProyecto.IDEmpleado = 4;

### ¿Cuántas horas han trabajado en total los empleados en el proyecto con identificador 2?
  
SELECT SUM(HorasTrabajadas) AS TotalHoras
FROM EmpleadoProyecto
WHERE IDProyecto = 2;

### ¿Cuáles son los empleados que han trabajado más de 10 horas en el proyecto con identificador 2?

SELECT Empleado.IDEmpleado, Empleado.NombreEmpleado
FROM EmpleadoProyecto
JOIN Empleado ON EmpleadoProyecto.IDEmpleado = Empleado.IDEmpleado
WHERE EmpleadoProyecto.IDProyecto = 2
  AND EmpleadoProyecto.HorasTrabajadas > 10;

### ¿Cuál es el total de horas trabajadas por cada empleado en todos los proyectos?

SELECT Empleado.IDEmpleado, Empleado.NombreEmpleado, SUM(EmpleadoProyecto.HorasTrabajadas) AS TotalHoras
FROM Empleado
JOIN EmpleadoProyecto ON Empleado.IDEmpleado = EmpleadoProyecto.IDEmpleado
GROUP BY Empleado.IDEmpleado, Empleado.NombreEmpleado;

### ¿Cuáles son los empleados que trabajan en más de un proyecto?

SELECT Empleado.IDEmpleado, Empleado.NombreEmpleado, COUNT(EmpleadoProyecto.IDProyecto) AS NumeroProyectos
FROM Empleado
JOIN EmpleadoProyecto ON Empleado.IDEmpleado = EmpleadoProyecto.IDEmpleado
GROUP BY Empleado.IDEmpleado, Empleado.NombreEmpleado
HAVING NumeroProyectos > 1;

### ¿Cuáles son los empleados que han trabajado más de 30 horas en total en todos los proyectos?

SELECT Empleado.IDEmpleado, Empleado.NombreEmpleado, SUM(EmpleadoProyecto.HorasTrabajadas) AS TotalHoras
FROM Empleado
JOIN EmpleadoProyecto ON Empleado.IDEmpleado = EmpleadoProyecto.IDEmpleado
GROUP BY Empleado.IDEmpleado, Empleado.NombreEmpleado
HAVING TotalHoras > 30;

### ¿Cuál es el promedio de horas trabajadas por proyecto?

SELECT Proyecto.IDProyecto, Proyecto.NombreProyecto, AVG(EmpleadoProyecto.HorasTrabajadas) AS HorasPromedio
FROM Proyecto
JOIN EmpleadoProyecto ON Proyecto.IDProyecto = EmpleadoProyecto.IDProyecto
GROUP BY Proyecto.IDProyecto, Proyecto.NombreProyecto;
