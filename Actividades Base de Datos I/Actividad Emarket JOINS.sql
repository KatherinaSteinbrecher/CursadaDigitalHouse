use emarket;
/*● Id de la factura
● fecha de la factura
● nombre de la empresa de correo
● nombre del cliente
● categoría del producto vendido
● nombre del producto
● precio unitario
● cantidad*/

select facturas.FacturaID, facturas.FechaFactura, facturas.EnvioVia, clientes.contacto, productos.CategoriaID, productos.ProductoNombre,facturadetalle.PrecioUnitario, facturadetalle.Cantidad
from facturas 
inner join clientes
on facturas.ClienteID = clientes.ClienteID
inner join facturadetalle 
on facturadetalle.FacturaID = facturas.FacturaID
inner join productos
on facturadetalle.ProductoID = productos.ProductoID;

/*1. Listar todas las categorías junto con información de sus productos. Incluir todas
las categorías aunque no tengan productos.*/
select categorias.CategoriaNombre, categorias.Descripcion, categorias.Imagen, productos.ProductoNombre
from productos
inner join categorias 
on productos.CategoriaID = categorias.CategoriaID;

/*2. Listar la información de contacto de los clientes que no hayan comprado nunca
en emarket.*/
select clientes.Contacto, clientes.ClienteID,  facturas.FacturaID
from facturas
right join clientes
on clientes.ClienteID = facturas.ClienteID
where FacturaID is null;

/*3. Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y
la información de contacto de su proveedor. Tener en cuenta que puede haber
productos para los cuales no se indicó quién es el proveedor.*/
select proveedores.contacto, proveedores.proveedorID, productos.ProductoNombre, productos.CategoriaID
from proveedores
left join productos 
on proveedores.ProveedorID = productos.ProveedorID;

/*4. Para cada categoría listar el promedio del precio unitario de sus productos.*/
select categorias.CategoriaID, categorias.CategoriaNombre, avg(productos.PrecioUnitario)
from categorias 
inner join productos;

/*5. Para cada cliente, indicar la última factura de compra. Incluir a los clientes que
nunca hayan comprado en e-market.*/
select clientes.clienteID, facturas.facturaID, max(facturas.FechaFactura)
from clientes 
inner join facturas
on clientes.ClienteID = facturas.ClienteID
group by facturas.fechaFactura;

/*6. Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un
listado con todas las empresas de correo, y la cantidad de facturas
correspondientes. Realizar la consulta utilizando RIGHT JOIN.*/


