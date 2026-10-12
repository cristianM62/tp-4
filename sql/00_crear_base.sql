-- Base separada para practicar sin modificar tp4bs.
USE [master];
GO
IF DB_ID(N'tp4bs_practica') IS NULL
    EXEC(N'CREATE DATABASE [tp4bs_practica]');
GO
