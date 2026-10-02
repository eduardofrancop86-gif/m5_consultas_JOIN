/* Ejercicio del modulo 5 del curso Data Analytics Coderhouse
Eduardo Franco*/

-- Consulta 1 Vista base del proyecto (INNER JOIN)

SELECT v.Fecha_venta fecha,
       c.Nombre nombre_cliente,
       c.Ciudad ciudad,
       p.Nombre_producto producto,
       cat.Nombre_categoria categoria,
       v.Cantidad,
       v.Precio_unitario,
       (v.Cantidad*v.Precio_unitario) total_venta
FROM dbo.ventas v
INNER JOIN clientes c ON v.Id_cliente = c.Id_cliente
INNER JOIN productos p ON v.Id_producto = p.Id_producto
INNER JOIN categorias cat ON p.Id_categoria = cat.Id_categoria

--Consulta 2 Clientes sin venta (LEFT JOIN)

SELECT c.Nombre,
       c.Email,
       c.Fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.Id_cliente = v.Id_cliente
WHERE v.Id_venta IS NULL;

/* Como el resultado de la consulta no muestra clientes sin venta, hacemos el siguiente
ejercicio de introducir un cliente que no tenga venta para comprobar el resultado*/

INSERT INTO clientes VALUES ('Roberto Gómez', 'roberto@mail.com', 'Monterrey', '2024-04-01');

-- Consulta 3 Productos sin ventas (LEFT JOIN)

SELECT p.Nombre_producto,
       cat.Nombre_categoria,
       p.Precio
FROM productos p
INNER JOIN categorias cat ON p.Id_categoria = cat.Id_categoria
LEFT JOIN ventas v ON p.Id_producto = v.Id_producto
WHERE v.Id_venta IS NULL;

/* Nuevamente como el resultado no mandaba productos sin venta vamos a introducir
un producto sin ventas para comprobar el reslutado*/

INSERT INTO productos VALUES ('Cámara Web Full HD', 2, 75.00, 25, 1);

--Consulta 4 Consolidado por canal (UNION ALL)
/*En este caso para separar por canal se hizo el ejercicio de separar por el ID_venta
si este es menor igual a cinco el canal sera 'Online' si es mayor a 5 el canal sera 'Presencial' */


SELECT Fecha_venta,
       (Cantidad*Precio_unitario) total,
       'Online' AS canal
FROM ventas
WHERE Id_venta <= 5;


SELECT Fecha_venta,
       (Cantidad*Precio_unitario) total,
       'Presencial' AS canal
FROM dbo.ventas
WHERE Id_venta >5;


WITH ventas_por_canal AS (
SELECT Fecha_venta,
       (Cantidad*Precio_unitario) total,
       'Online' AS canal
FROM ventas
WHERE Id_venta <=5

UNION ALL

SELECT Fecha_venta,
       (Cantidad*Precio_unitario) total,
       'Presencial' AS canal
FROM ventas
WHERE Id_venta >5
)

SELECT canal,
SUM(total) AS total_por_canal
FROM ventas_por_canal
GROUP BY canal;