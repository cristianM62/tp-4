USE [tp4bs_practica];
GO
-- Consultas recuperadas de SQLQuery1.sql. Los ejemplos no incluyen el cliente 1.
SELECT * FROM dbo.clientes WHERE id_cliente = 1;

-- COUNT(*) cuenta filas; COUNT(DISTINCT ...) cuenta valores distintos.
SELECT COUNT(*) AS TotalClientes FROM dbo.clientes;
SELECT COUNT(DISTINCT id_empleado) AS EmpleadosConPedidos FROM dbo.pedidos;
SELECT SUM(cantidad) AS UnidadesPedidas FROM dbo.Pedidos_Productos;
SELECT AVG(precio_venta) AS PrecioPromedio FROM dbo.productos;
SELECT MAX(precio_venta) AS PrecioMaximo FROM dbo.productos;
SELECT MIN(precio_venta) AS PrecioMinimo FROM dbo.productos;
SELECT * FROM dbo.productos ORDER BY precio_venta DESC, id_producto;
SELECT TOP (3) * FROM dbo.productos ORDER BY precio_venta DESC, id_producto;
SELECT * FROM dbo.productos WHERE precio_venta > 2000;

-- Ejercicios adicionales, creados para esta practica.
-- Relacionar cada pedido con su cliente y empleado.
SELECT p.id_pedidos, p.fecha_pedidos,
       c.nombre AS Cliente, e.nombre AS Empleado
FROM dbo.pedidos AS p
INNER JOIN dbo.clientes AS c ON c.id_cliente = p.id_cliente
INNER JOIN dbo.empleados AS e ON e.id_empleado = p.id_empleado
ORDER BY p.id_pedidos;

-- GROUP BY agrupa; HAVING filtra grupos despues de calcular el total.
SELECT p.id_empleado, e.nombre, COUNT(*) AS TotalPedidos
FROM dbo.pedidos AS p
INNER JOIN dbo.empleados AS e ON e.id_empleado = p.id_empleado
GROUP BY p.id_empleado, e.nombre
HAVING COUNT(*) >= 2
ORDER BY TotalPedidos DESC, p.id_empleado;

-- Importe usando los precios de venta actuales, sin historial de precios.
SELECT pp.id_pedidos, SUM(pp.cantidad * pr.precio_venta) AS Importe
FROM dbo.Pedidos_Productos AS pp
INNER JOIN dbo.productos AS pr ON pr.id_producto = pp.id_producto
GROUP BY pp.id_pedidos
ORDER BY pp.id_pedidos;

-- LEFT JOIN permite encontrar clientes sin pedidos.
SELECT c.id_cliente, c.nombre
FROM dbo.clientes AS c
LEFT JOIN dbo.pedidos AS p ON p.id_cliente = c.id_cliente
WHERE p.id_pedidos IS NULL
ORDER BY c.id_cliente;
