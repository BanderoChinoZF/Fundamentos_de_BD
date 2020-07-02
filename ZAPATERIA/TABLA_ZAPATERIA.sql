set search_path to zapateria;

--Entidades Fuertes se crean primero para despues crear las entidades debiles o dependientes.
create table calzado
(
	codigo 		int primary key,--Integridad de entidad e identificador unico del calzado.
	descripcion 	varchar(60),
	color 		varchar(50),
	talla 		numeric(3,1),
	marca 		varchar(30),
	precio_v 	numeric (7,2),
	check(codigo >= 10000 and codigo < 11000),
	check(precio_v > 0)
);

create table empleado 
(
	id_empleado 	int primary key,--Integridad de entidad e identificador unico del empleado.
	nombre_em	varchar(80),
	domicilio 	varchar(100),
	telefono 	varchar(15),
	fecha_n 	date,
	fecha_c 	date,
	salario 	numeric(8,2)
);

create table cliente 
(
	id_cliente 	int primary key,--Integridad de entidad e identificador unico del cleinte no puede existir dos veces un cliente
	nombre_cli 	varchar(50),
	domicilio 	varchar(50),
	fecha_n 	date
	
);

--Especializacion de los empleados de mostrador y almacen
create table mostrador
(
	id_empleado int unique references empleado(id_empleado),
	--Integridad de referencia e identificador unico del empleado.
	comision numeric(3,2),
	bono numeric(6,2)
);

create table almacenista
(
	id_empleado 	int unique references empleado(id_empleado),
	area 		varchar(40),
	marca 		varchar(30),
	cantidad 	int
);

create table ejemplar_calzado
(
	codigo int,
	id_ejemplar int,
	estado varchar(30),
	observacion varchar(80)
);

create table venta
(
	folio_venta	int primary key,
	id_empleado	int,
	fecha		date,
	hora		time,
	foreign key (id_empleado) references empleado(id_empleado)
	
);

create table detalle_venta
(
	folio_venta	int,
	observaciones	varchar(80),
	codigo		int,
	foreign key (folio_venta) references venta(folio_venta),
	foreign key (codigo) references calzado(codigo)
);

create table proveedor
(
	id_proveedor 	int primary key,
	rfc 		varchar(30),
	razon_social 	varchar(80),
	domicilio 	varchar(50),
	telefono 	varchar(15)
);

create table compra
(
	id_proveedor 	int,
	id_empleado	int,
	folio_compra 	int primary key,
	hora 		time,
	fecha 		date,
	foreign key (id_proveedor) references proveedor(id_proveedor),
	foreign key (id_empleado) references empleado(id_empleado)
);

create table detalle_compra
(
	folio_compra	int,
	observacion	varchar(80),
	foreign key (folio_compra) references compra(folio_compra)
);
