use GeeksHubs;

# BLOQUE 1 #

# Reto 1: Obtener los nombres de los productos de la tienda.

select NOMBRE from GeeksHubs.articulos; 

# Reto 2: Obtener los nombres y los precios de los productos de la tienda.

select NOMBRE, PRECIO from GeeksHubs.articulos; 

# Reto 3: Obtener el nombre de los productos cuyo precio sea menor o igual a 200€.

select NOMBRE from GeeksHubs.articulos where PRECIO<=200; 

# Reto 4: Obtener todos los datos de los artículos cuyo precio esté entre los 60€ y los 120€ (ambas cantidades incluídas).

select NOMBRE from GeeksHubs.articulos where PRECIO between 60 AND 120;

# Reto 5: Obtener el nombre y el precio en pesetas (es decir, el precio en euros multiplicado por 166.386.

select NOMBRE, PRECIO*166.386 from GeeksHubs.articulos;

# BLOQUE 2 #

# Reto 6: Seleccionar el precio medio de todos los productos.

select avg(PRECIO) from GeeksHubs.articulos;

# Reto 7: Obtener el precio medio de los artículos cuyo código de fabricante sea 2.

select avg(PRECIO) from GeeksHubs.articulos where FABRICANTE=2;

# Reto 8: Obtener el número de artículos cuyo precio sea mayor o igual a 180€.

select count(CODIGO) from GeeksHubs.articulos where PRECIO>=180;

# Reto 9: Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180€, y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.

select NOMBRE, PRECIO from GeeksHubs.articulos where PRECIO>=180 order by PRECIO desc, NOMBRE asc;

# Reto 10: Obtener un listado completo de artículos, incluyendo por cada artículo los datos del artículo y de su fabricante.

select * from GeeksHubs.articulos inner join GeeksHubs.fabricantes on GeeksHubs.articulos.FABRICANTE=GeeksHubs.fabricantes.CODIGO;

# Reto 11: Obtener un listado de artículos, incluyendo el nombre del artículo, su precio y el nombre del fabricante.

select GeeksHubs.articulos.NOMBRE, GeeksHubs.articulos.PRECIO, GeeksHubs.fabricantes.NOMBRE from GeeksHubs.articulos inner join GeeksHubs.fabricantes on GeeksHubs.articulos.FABRICANTE=GeeksHubs.fabricantes.CODIGO;

# Reto 12: Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante.

select avg(GeeksHubs.articulos.PRECIO), fabricantes.CODIGO from GeeksHubs.articulos inner join GeeksHubs.fabricantes on GeeksHubs.articulos.FABRICANTE=GeeksHubs.fabricantes.CODIGO group by (GeeksHubs.fabricantes.CODIGO);

# BLOQUE 3 #

# Reto 13: Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.

select avg(GeeksHubs.articulos.PRECIO), GeeksHubs.fabricantes.NOMBRE from GeeksHubs.articulos inner join GeeksHubs.fabricantes on GeeksHubs.articulos.FABRICANTE=GeeksHubs.fabricantes.CODIGO group by (GeeksHubs.fabricantes.NOMBRE);

# Reto 14: Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150€.

select avg(GeeksHubs.articulos.PRECIO) as MEDIA, GeeksHubs.fabricantes.NOMBRE 
from GeeksHubs.articulos 
inner join GeeksHubs.fabricantes 
on GeeksHubs.articulos.FABRICANTE=GeeksHubs.fabricantes.CODIGO 
group by (GeeksHubs.fabricantes.NOMBRE) 
having MEDIA>=150;

# Reto 15: Obtener el nombre y precio del artículo más barato.

select GeeksHubs.articulos.NOMBRE 
from GeeksHubs.articulos 
where PRECIO = (
	select min(GeeksHubs.articulos.PRECIO) 
    from GeeksHubs.articulos
);

# Reto 16: Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor.

select GeeksHubs.articulos.NOMBRE, GeeksHubs.articulos.PRECIO  
from GeeksHubs.articulos 
where GeeksHubs.articulos.PRECIO in (
	select max(GeeksHubs.articulos.PRECIO)
	from GeeksHubs.articulos
	inner join GeeksHubs.fabricantes 
	on GeeksHubs.articulos.FABRICANTE=GeeksHubs.fabricantes.CODIGO 
	group by GeeksHubs.fabricantes.NOMBRE
);


# Reto 17: Añadir un nuevo producto: Altavoces de 70€ (del fabricante 2).

insert into GeeksHubs.articulos (CODIGO, NOMBRE, PRECIO, FABRICANTE) values (11, "Altavoces", 70, 2);

# Reto 18: Cambiar el nombre del producto 8 a 'Impresora Láser'.

update GeeksHubs.articulos set GeeksHubs.articulos.NOMBRE="Impresora Láser" where GeeksHubs.articulos.CODIGO=8;

# Reto 19: Aplicar un descuento del 10% (multiplicar el precio por 0.9) a todos los productos.

SET SQL_SAFE_UPDATES = 0;
update GeeksHubs.articulos set GeeksHubs.articulos.PRECIO=GeeksHubs.articulos.PRECIO*0.9;

# Reto 20: Aplicar un descuento de 10€ a todos los productos cuyo precio sea mayor o igual a 120€.

update GeeksHubs.articulos set GeeksHubs.articulos.PRECIO=GeeksHubs.articulos.PRECIO-10 where GeeksHubs.articulos.PRECIO>=120;



