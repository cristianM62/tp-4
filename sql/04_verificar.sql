USE [tp4bs_practica];
GO
-- Valores esperados despues de cargar los ejemplos en tablas vacias.
SELECT 'clientes' AS Tabla, COUNT(*) AS Filas, 14 AS Esperadas FROM dbo.clientes
UNION ALL SELECT 'empleados', COUNT(*), 8 FROM dbo.empleados
UNION ALL SELECT 'productos', COUNT(*), 12 FROM dbo.productos
UNION ALL SELECT 'pedidos', COUNT(*), 20 FROM dbo.pedidos
UNION ALL SELECT 'Pedidos_Productos', COUNT(*), 40 FROM dbo.Pedidos_Productos;
DBCC CHECKCONSTRAINTS WITH ALL_CONSTRAINTS;
