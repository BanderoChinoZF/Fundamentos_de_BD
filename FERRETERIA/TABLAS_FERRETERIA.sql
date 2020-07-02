set search_path to Ferreteria;

/*Tablas padre*/
create table empleado
(
	id_empleado	int primary key,
	nombre		varchar(80),
	turno		varchar(60),
	salario		numeric(6,2),
	genero		char(1) check (genero = 'H' OR genero = 'M')
);

create table cliente
(
	id_cliente	int primary key,
	nombre		varchar(80),
	domicilio	varchar(80),
	telefono	varchar(100)
);

create table fabricante
(
	id_fabricante	int primary key,--INTEGRIDAD DE ENTIDAD
	nombre		varchar(80),
	ciudad		varchar(35),
	contacto	varchar(40),
	tel_contacto	varchar(15)
);



create table compra
(
	id_fabricante 	int,
	folio_c 	int primary key,--INTEGRIDAD DE ENTIDAD
	fecha 		date,
	foreign key (id_fabricante) references fabricante(id_fabricante)
);

create table producto
(
	codigo 		int primary key,--INTEGRIDAD DE ENTIDAD
	descipcion	varchar (150),
	precio_v 	numeric (8,2),
	precio_c 	numeric (8,2),
	marca 		varchar(30),
	longitud	numeric(5,2),
	peso		numeric(5,2),
	check(precio_v > 0),
	check(precio_c > 0),
	check(precio_c < precio_v)
);

/*Tablas Hijo*/
create table administrador
(
	id_admin	int,
	id_empleado 	int,
	foreign key (id_admin) references empleado(id_empleado),--INTEGRIDAD REFERENCIAL
	foreign key (id_empleado) references empleado(id_empleado),--INTEGRIDAD REFERENCIAL
	unique (id_empleado)
);

create table detalle_compra
(
	folio_c		int,
	observacion	varchar(80),
	cantidad	int,
	foreign key (folio_c) references compra(folio_c)
);

create table credito 
(	
	folio_c 	int unique references compra(folio_c),
	no_pagos	int,
	monto		int,
	frecuencia	varchar(30)
);

create table contado 
(
	folio_c		int unique references compra(folio_c),
	total		numeric(7,2),
	tipo_pago	varchar(35)
);

create table venta
(
	id_cliente 	int,
	fecha_v 	varchar(15),
	folio_v 	int primary key,--INTEGRIDAD DE ENTIDAD
	id_empleado int,
	foreign key (id_cliente) references cliente(id_cliente),--INTEGRIDAD REFERENCIAL
	foreign key (id_empleado) references empleado(id_empleado)--INTEGRIDAD REFERENCIAL
);

create table detalle_venta 
(
	codigo 		int,
	cantidad 	int,
	observaciones	varchar(80),
	folio_v  	int,
	foreign key (codigo) references producto(codigo),
	foreign key (folio_v) references venta(folio_v),
	check(cantidad >= 1)
);

--drop schema Ferreteria cascade;




