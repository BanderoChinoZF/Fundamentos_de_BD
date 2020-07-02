4set search_path to papeleria;

create table proveedor
(
	RFC 		varchar (15) primary key,
	razon_social 	varchar (100),
	domicilio 	varchar (100),
	tel_cont 	varchar (15),
	ciudad 		varchar (30),
	estado 		varchar (30)
);

create table producto
(
	codigo 		int primary key,
	descipcion	varchar (150),
	precio_c 	numeric (8,2),
	precio_v 	numeric (8,2),
	marca 		varchar(30),
	existencia 	int not null
);
create table cliente
(
	id_cliente int primary key,
	nombre varchar (30),
	domicilio varchar (100),
	telefono varchar (20),
	tipo_telefono varchar (20)
);
create table sucursal
(
	telefono_fijo varchar (20),
	nombre varchar(50),
	domicilio varchar(100),
	ciudad varchar(20),
	id_sucursal int primary key
);
create table empleado
(
	id_empleado int primary key,
	nombre varchar (100),
	ap_p varchar(20),
	ap_m varchar(20),
	fecha_n varchar(15),
	fecha_cont varchar(15),
	id_sucursal int,
	foreign key (id_sucursal) references sucursal(id_sucursal)
);
create table administrador
(
	id_admin	int,
	id_empleado 	int,
	foreign key (id_admin) references empleado(id_empleado),
	foreign key (id_empleado) references empleado(id_empleado),
	unique (id_empleado)
);
create table venta
(
	id_cliente int,
	observaciones varchar (50),
	fecha_v varchar(15),
	folio_v int primary key,
	id_empleado int,
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_empleado) references empleado(id_empleado)
);
create table detalle_venta 
(
	codigo 		int,
	cantidad 	int,
	descuento 	numeric,
	folio_v  	int,
	foreign key (codigo) references producto(codigo),
	foreign key (folio_v) references venta(folio_v)
);
create table compra 
(
	RFC 		varchar(15),
	folio_c 	int primary key,
	fecha_c 	varchar(15),
	id_empleado 	int,
	foreign key (RFC) references proveedor(RFC)
);
create table detalle_compra
(
	folio_c int,
	cantidad int,
	descuento int,
	codigo int,
	foreign key (folio_c) references compra(folio_c),
	foreign key (codigo) references producto(codigo)
);