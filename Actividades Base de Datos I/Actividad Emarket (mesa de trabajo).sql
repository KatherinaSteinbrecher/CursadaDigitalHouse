use emarket;
/*Clientes
1) ¿Cuántos clientes existen?*/

select count(*) as 'Total Clientes'
from clientes;

/*2) ¿Cuántos clientes hay por ciudad?*/

select Ciudad, count(clienteID)
from clientes
group by Ciudad;

/*Facturas
1) ¿Cuál es el total de transporte?*/
select sum(Transporte)
from facturas;

/*2) ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?*/

select sum(Transporte), EnvioVia
from facturas;

/*3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por
cantidad de facturas.*/
select count(FacturaID), ClienteID
from facturas
group by ClienteID
order by count(FacturaID) desc;

/*4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.*/
select clienteID, count(facturaID)
from facturas
group by ClienteID
limit 5;

/*5) ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?*/
select count(FacturaID), PaisEnvio
from facturas
group by PaisEnvio
order by count(FacturaID) asc;

/*6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado realizó más operaciones de ventas?*/

select count(FacturaID), EmpleadoID
from facturas
group by EmpleadoID
order by count(FacturaID) desc;

/*Factura detalle
1) ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?*/
select productoID, count(*)
from facturadetalle
group by productoID
order by count(*) desc;

/*2) ¿Cuál es el total facturado? Considerar que el total facturado es la suma de
cantidad por precio unitario.*/
select sum(Cantidad * PrecioUnitario)
from facturadetalle;

/*3) ¿Cuál es el total facturado para los productos ID entre 30 y 50?*/
select sum(Cantidad * PrecioUnitario)
from facturadetalle
WHERE ProductoID between 30 and 50;

/*4) ¿Cuál es el precio unitario promedio de cada producto?*/
select avg(PrecioUnitario), ProductoID
from facturadetalle
group by productoID;

/*5) ¿Cuál es el precio unitario máximo?*/
select max(PrecioUnitario)
from facturadetalle;

/*Consultas queries XL parte II - JOIN*/
/* 1) Generar un listado de todas las facturas del empleado 'Buchanan'.*/

select empleados.Nombre, empleados.Apellido, facturas.FacturaID
from empleados
inner join facturas
on empleados.EmpleadoID = facturas.EmpleadoID
where empleados.Apellido = 'Buchanan';

/*2) Generar un listado con todos los campos de las facturas del correo 'Speedy
Express'.*/
select facturas.facturaID, correos.CorreoID, correos.Compania
from facturas
inner join correos 
on facturas.EnvioVia = correos.CorreoID
where correos.Compania = 'Speedy Express';

/*3) Generar un listado de todas las facturas con el nombre y apellido de los
empleados.*/
select facturas.FacturaID, empleados.Nombre, empleados.Apellido
from facturas
inner join empleados
on empleados.EmpleadoID = facturas.EmpleadoID;

/*4) Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío
“USA”.*/
select clientes.Titulo, facturas.PaisEnvio, facturas.FacturaID
from clientes
inner join facturas
on clientes.ClienteID = facturas.ClienteID
where clientes.Titulo = 'Owner' and facturas.PaisEnvio= 'USA';

/*5) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
“Leverling” o que incluyan el producto id = “42”.*/
select facturas.FacturaID, empleados.apellido, facturadetalle.ProductoID
from facturas
inner join empleados
on facturas.EmpleadoID = empleados.EmpleadoID
inner join facturadetalle
on facturas.FacturaID = facturadetalle.FacturaID
where empleados.apellido = 'Leverling' and facturadetalle.ProductoID ='42';

/*6) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
“Leverling” y que incluya los producto id = “80” o ”42”.*/
select facturas.FacturaID, empleados.apellido, productos.ProductoID
from facturas, empleados, productos
where empleados.apellido = 'Leverling' and productos.ProductoID ='80' or '42';

/*7) Generar un listado con los cinco mejores clientes, según sus importes de
compras total (PrecioUnitario * Cantidad).*/
select count(PrecioUnitario * Cantidad), facturas.ClienteID
from facturas
inner join facturadetalle 
on facturas.FacturaID = facturadetalle.FacturaID
group by facturas.ClienteID
order by count(PrecioUnitario * Cantidad) desc
limit 5;

/*8) Generar un listado de facturas, con los campos id, nombre y apellido del cliente,
fecha de factura, país de envío, Total, ordenado de manera descendente por
fecha de factura y limitado a 10 filas.*/

select facturas.FacturaID, facturas.PaisEnvio, facturas.FechaFactura, count(PrecioUnitario * Cantidad), clientes.contacto
from facturas 
inner join clientes
on facturas.ClienteID = clientes.ClienteID
inner join facturadetalle
ON facturas.FacturaID = facturadetalle.FacturaID
group by facturas.FacturaID
order by facturas.FechaFactura desc
limit 10;

