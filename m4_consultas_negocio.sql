/* El siguiente ejercicio corresponde a la Pre-Entrega 4 del curso Data Analytics
 de Eduardo Franco */

--Primera Consulta Resumen Ejecutivo Mensual: Total facturado, Total pedidos y Ticket promedio--
SELECT
  MONTH(Fecha_venta) AS mes,
  SUM(Cantidad*Precio_unitario) AS total_facturado,
  COUNT(Cantidad) AS total_pedidos,
  SUM(Cantidad*Precio_unitario) / COUNT(Cantidad) AS ticket_promedio
FROM dbo.ventas
GROUP BY MONTH(Fecha_venta)
ORDER BY mes ASC;

--No pude hacer la consulta con EXTRACT MONTH me marcaba error--

--Segunda Consulta Ranking de productos: Top 5 de productos por total facturado--
SELECT TOP 5 Id_producto,
  SUM(Cantidad) AS unidades_vendidas,
  SUM (Cantidad*Precio_Unitario) AS total_generado
FROM dbo.ventas
GROUP BY Id_producto
ORDER BY Total_Generado DESC;


--Tercera Consulta Clientes Recurrentes:Id_cliente que haya realizado mas de un pedido--
SELECT Id_cliente,
  COUNT(*) AS total_pedidos,
  SUM(Cantidad*Precio_Unitario) AS total_gastado
FROM dbo.ventas
GROUP BY Id_cliente
HAVING COUNT(*) >1
ORDER BY total_gastado DESC;


--Cuarta Consulta Meses por encima/debajo del promedio
SELECT 
 MONTH(Fecha_venta) AS mes,
 SUM(Cantidad*Precio_unitario) AS total_facturado,
 CASE
  WHEN SUM(Cantidad*Precio_unitario) >= 6444.00 THEN 'Por encima'
  ELSE 'Por debajo'
END AS evaluacion_promedio
 FROM dbo.ventas
 GROUP BY MONTH(Fecha_venta)
 ORDER BY mes ASC;

 --No se si trata de un error que cometi en la entrega anterior pero todas las ventas de la tabla de ventas son de un mismo mes--

--HALLAZGOS DE NEGOCIO--
--El cliente con el ID 1 es cliente top, al ser recurrente al haber hecho dos pedidos y con el mayor gasto.
--El producto con el id 2 a pesar de ser el que mas unidades ha vendido no genera tantas ganancias como otros que venden menos unidades.
--El mes de marzo tiene una facturacion total de $6444.00 situandose como el punto de partida para el crecimiento de ventas para mese siguientes.
