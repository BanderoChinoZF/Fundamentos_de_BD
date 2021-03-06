﻿create schema zapateria authorization postgres;

set search_path to zapateria;

create table cliente
(
	id_c 		int primary key,
	nombre 		varchar (60),
	cedula_fiscal	varchar (13),
	telefono	varchar (15)
);

create table proveedor
(
	id_p		int primary key,
	razon_social	varchar (40),
	ciudad		varchar (20),
	telefono	varchar (15),
	e_mail		varchar (60)
);

create table zapato
(
	codigo		int primary key,
	descripcion	varchar (80),
	prov		int not null,
	talla		numeric (4,1),
	color		varchar (20),
	material	varchar (30),
	precio_c	numeric (10,2),
	precio_v	numeric (10,2),
	existencia	int,
	foreign key (prov) references proveedor (id_p)
);

create table empleado
(
	id_e		int primary key,
	nombre		varchar (60),
	fecha_ingreso	date,
	fecha_nacimiento date,
	turno		varchar (15),
	puesto		varchar (20)
);

create table compra
(
	folio_c	int primary key,
	fecha		date,
	prov		int,
	id_e		int,
	foreign key (prov) references proveedor (id_p),
	foreign key (id_e) references empleado (id_e)
);

create table det_compra
(
	folio_c		int,
	codigo		int,
	cantidad	int,
	foreign key (folio_c) references compra (folio_c),
	foreign key (codigo) references zapato (codigo)
);

create table venta
(
	folio_v		int primary key,
	fecha		date,
	id_c		int,
	id_e		int,
	foreign key (id_c) references cliente (id_c),
	foreign key (id_e) references empleado (id_e)
);

create table detalle_venta
(
	folio_v		int,
	codigo		int,
	cantidad	int,
	foreign key (folio_v) references venta (folio_v),
	foreign key (codigo) references zapato (codigo)
);

create table devolucion
(
	folio_dev int primary key,
	folio_v int not null,
	fecha_devolucion date,
	id_e int,
	foreign key (folio_v) references venta (folio_v)

);

create table detalle_devolucion
(
	folio_dev 	int,
	codigo int,
	cantidad int,
	motivo text,
	foreign key (folio_dev) references devolucion (folio_dev)

);

--drop schema zapateria cascade;
