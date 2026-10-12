# SQL Server · Bases de Datos II · TP4

Material para continuar la practica en otra computadora con SQL Server y SSMS.

## Origen y alcance

El esquema se verifico contra la exportacion de SSMS de la base `tp4bs`: nombres, tipos, nulabilidad, claves primarias y cuatro claves foraneas. Tablas: `dbo.clientes`, `dbo.empleados`, `dbo.productos`, `dbo.pedidos` y `dbo.Pedidos_Productos`.

Los datos y las consultas iniciales provienen del archivo de practica `SQLQuery1.sql`. Los clientes y empleados tienen nombres sinteticos y telefonos NULL. Se conservan los identificadores, productos, importes, fechas y cantidades del ejercicio. No se exportaron registros de la base original. Los ejercicios de JOIN, GROUP BY, HAVING e importes son adicionales; no se presentan como consignas oficiales del TP4. La conversacion recuperada no contenia esas consignas.

La reconstruccion usa una base separada llamada `tp4bs_practica`. No contiene contrasenas, logins, usuarios ni rutas locales del servidor de origen. El usuario `usuario_tp4` y su rol no se recrean. Se omiten las opciones de servidor de la exportacion, incluido el nivel de compatibilidad 170 y OPTIMIZE_FOR_SEQUENTIAL_KEY, para facilitar el traslado.

## Restaurar el entorno en SSMS

Esta es una reconstruccion con scripts, no una restauracion de un archivo `.bak`.

1. En GitHub, selecciona **Code > Download ZIP** y extrae la carpeta.
2. Abri SSMS y conectate a tu instancia de SQL Server. SSMS por si solo no instala el motor. Usa una cuenta con permiso para crear la base y sus tablas.
3. Abri `sql/00_crear_base.sql` con **Archivo > Abrir > Archivo** y ejecutalo con **F5**. Crea `tp4bs_practica` si no existe.
4. Abri `sql/01_esquema.sql` y ejecutalo con **F5**. La base debe estar vacia. Si aparece un error, detene el proceso y revisalo antes de continuar.
5. Abri `sql/02_datos_ejemplo.sql` y ejecutalo con **F5**. Si alguna tabla ya tiene datos, el script rechaza la carga. Ante un error se revierte la transaccion.
6. Ejecuta `sql/04_verificar.sql`: espera 14 clientes, 8 empleados, 12 productos, 20 pedidos y 40 detalles. La comprobacion de restricciones no debe devolver infracciones.
7. Abri `sql/03_consultas.sql`. Selecciona una consulta por vez y pulsa **F5**.

No vuelvas a ejecutar el esquema sobre tablas creadas. No borres tu base original para resolver un error. Para empezar de nuevo, usa una base de practica vacia y adapta el nombre en los scripts.

## Practica oral

Antes de ejecutar cada consulta, explica que devuelve y que funcion cumple cada clausula. Compara COUNT(*) con COUNT(DISTINCT), WHERE con HAVING, INNER JOIN con LEFT JOIN y SUM con AVG. La consulta del cliente 1 devuelve cero filas porque ese registro no estaba incluido en el archivo de ejemplos. Los cuatro clientes sin pedidos permiten practicar LEFT JOIN.

## Guardar avances

Crea nuevos archivos dentro de `sql/` con nombres descriptivos. Revisa el contenido antes de subirlo: usa datos ficticios y no agregues contrasenas, cadenas de conexion con credenciales ni copias de datos laborales.

## Validacion realizada

Se revisaron el esquema exportado, la cantidad de filas y la ausencia de credenciales y telefonos. No se pudo ejecutar en SQL Server desde esta sesion: la conexion local no estuvo disponible. La verificacion funcional queda indicada en el paso 6.

