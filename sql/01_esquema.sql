-- Esquema verificado contra la exportacion de SSMS. Ejecutar en una base vacia.
USE [tp4bs_practica];
GO
SET XACT_ABORT ON;
BEGIN TRY
    BEGIN TRANSACTION;
    IF EXISTS (SELECT 1 FROM sys.tables WHERE is_ms_shipped = 0)
        THROW 50001, 'La base ya contiene tablas; no se modifico el esquema.', 1;

SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[empleados](
	[id_empleado] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[pedidos](
	[id_pedidos] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[fecha_pedidos] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pedidos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Pedidos_Productos](
	[id_pedidos] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pedidos] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[productos](
	[id_producto] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio_neto] [decimal](10, 2) NOT NULL,
	[precio_venta] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])

ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([id_empleado])
REFERENCES [dbo].[empleados] ([id_empleado])

ALTER TABLE [dbo].[Pedidos_Productos]  WITH CHECK ADD FOREIGN KEY([id_pedidos])
REFERENCES [dbo].[pedidos] ([id_pedidos])

ALTER TABLE [dbo].[Pedidos_Productos]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO
