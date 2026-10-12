-- Datos sinteticos de practica. No son una copia de los registros originales.
USE [tp4bs_practica];
GO
SET XACT_ABORT ON;
BEGIN TRY
    BEGIN TRANSACTION;
    IF EXISTS (SELECT 1 FROM dbo.clientes)
       OR EXISTS (SELECT 1 FROM dbo.empleados)
       OR EXISTS (SELECT 1 FROM dbo.productos)
       OR EXISTS (SELECT 1 FROM dbo.pedidos)
       OR EXISTS (SELECT 1 FROM dbo.Pedidos_Productos)
        THROW 50002, 'Las tablas deben estar vacias para cargar los ejemplos.', 1;

INSERT INTO dbo.[clientes] (id_cliente, nombre, telefono)
VALUES
(2, 'Cliente 2', NULL),
(3, 'Cliente 3', NULL),
(4, 'Cliente 4', NULL),
(5, 'Cliente 5', NULL);

INSERT INTO dbo.[clientes] (id_cliente, nombre, telefono)
VALUES
(10, 'Cliente 10', NULL),
(11, 'Cliente 11', NULL),
(12, 'Cliente 12', NULL),
(13, 'Cliente 13', NULL),
(14, 'Cliente 14', NULL),
(15, 'Cliente 15', NULL),
(16, 'Cliente 16', NULL),
(17, 'Cliente 17', NULL),
(18, 'Cliente 18', NULL),
(19, 'Cliente 19', NULL);

INSERT INTO dbo.[empleados] (id_empleado, nombre, apellido)
VALUES
(10, 'Empleado 10', 'Ejemplo'),
(11, 'Empleado 11', 'Ejemplo'),
(12, 'Empleado 12', 'Ejemplo'),
(13, 'Empleado 13', 'Ejemplo'),
(14, 'Empleado 14', 'Ejemplo'),
(15, 'Empleado 15', 'Ejemplo'),
(16, 'Empleado 16', 'Ejemplo'),
(17, 'Empleado 17', 'Ejemplo');

INSERT INTO dbo.[productos] (id_producto, nombre, precio_neto, precio_venta)
VALUES
(10, 'Leche', 900, 1200),
(11, 'Azucar', 700, 1000),
(12, 'Fideos', 800, 1100),
(13, 'Aceite', 2500, 3200),
(14, 'Harina', 600, 850),
(15, 'Cafe', 4500, 6000),
(16, 'Yerba', 3500, 4800),
(17, 'Galletitas', 1200, 1700),
(18, 'Detergente', 1800, 2400),
(19, 'Jabon', 950, 1400),
(20, 'Shampoo', 3200, 4500),
(21, 'Chocolate', 2100, 2900);

INSERT INTO dbo.[pedidos] (id_pedidos, id_cliente, id_empleado, fecha_pedidos)
VALUES
(10, 10, 10, '2026-10-01'),
(11, 11, 11, '2026-10-01'),
(12, 12, 10, '2026-10-02'),
(13, 13, 12, '2026-10-02'),
(14, 14, 10, '2026-10-03'),
(15, 15, 13, '2026-10-03'),
(16, 16, 11, '2026-10-04'),
(17, 17, 10, '2026-10-04'),
(18, 18, 14, '2026-10-05'),
(19, 19, 12, '2026-10-05'),
(20, 10, 10, '2026-10-06'),
(21, 11, 15, '2026-10-06'),
(22, 12, 10, '2026-10-07'),
(23, 13, 11, '2026-10-07'),
(24, 14, 16, '2026-10-08'),
(25, 15, 10, '2026-10-08'),
(26, 16, 12, '2026-10-09'),
(27, 17, 17, '2026-10-09'),
(28, 18, 10, '2026-10-10'),
(29, 19, 11, '2026-10-10');

INSERT INTO dbo.[Pedidos_Productos] (id_pedidos, id_producto, cantidad)
VALUES
(10, 10, 2),
(10, 11, 3),
(11, 12, 4),
(11, 13, 1),
(12, 14, 5),
(12, 15, 2),
(13, 16, 1),
(13, 17, 3),
(14, 10, 4),
(14, 18, 2),
(15, 11, 2),
(15, 19, 5),
(16, 12, 3),
(16, 20, 1),
(17, 13, 2),
(17, 10, 3),
(18, 14, 6),
(18, 16, 2),
(19, 15, 1),
(19, 17, 4),
(20, 10, 5),
(20, 12, 2),
(21, 11, 3),
(21, 18, 1),
(22, 13, 1),
(22, 14, 4),
(23, 15, 2),
(23, 19, 3),
(24, 16, 2),
(24, 20, 1),
(25, 17, 5),
(25, 10, 2),
(26, 11, 4),
(26, 12, 3),
(27, 13, 2),
(27, 18, 2),
(28, 14, 3),
(28, 15, 1),
(29, 16, 4),
(29, 19, 2);
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO
