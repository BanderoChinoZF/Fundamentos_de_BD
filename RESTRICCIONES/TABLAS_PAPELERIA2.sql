set search_path to papeleria2;

create table sucursal
(
	id_sucursal int primary key,
	/*id_sucursal integridad de entidad y recordar que la primary key no
	 recibe valores nulos.*/
	nombre 		varchar(50),
	domicilio 	varchar(100),
	ciudad 		varchar(20),
	telefono_fijo 	varchar (13),
	check(id_sucursal > 0 and id_sucursal <= 30)
	/**/
);

create table producto
(
	codigo 		int primary key,
	/*El codigo es integridad de entidad y recordar que la primary key no puede
	 recibir valores nulos.*/
	descipcion	varchar (150),
	precio_c 	numeric (8,2),
	precio_v 	numeric (8,2),
	marca 		varchar(30),
	--existencia 	int not null, opcional pero con la deficiencia que me acepte un valor negativo
	existencia	int,
	check(codigo > 0 and codigo <= 1200),
	/*Integridad de dominio para el codigo de producto, ya que la empresa tiene a la 
	  venta 1200 productos, */
	check(precio_c > 0),
	/*Regla de negocios e integridad de dominio para los precios de commpra*/
	check(precio_v > precio_c),
	/*Regla de negocios e integridad de dominio para los precios de venta,
	  estos deben ser mayor a los de compra para obtener ganancias*/
	check (existencia > 0),
	/*Nunca puede haber existencia cero*/
	
);

create table proveedor
(
	RFC 		varchar (15) primary key,
	/*RFC restriccion basica en donde no se puede repetir dos veces un 
	  proveedor que nos surte mercancia*/
	razon_social 	varchar (100),
	domicilio 	varchar (100),
	tel_cont 	varchar (15),
	ciudad 		varchar (30),
	estado 		varchar (30)
);

create table cliente
(
	id_cliente 	int primary key,
	nombre 		varchar (30),
	domicilio 	varchar (100),
	telefono 	varchar (20),
	tipo_telefono 	varchar (20)
	/*En la tabla cliente tenemos una integridad de entidad por lo que el id_cliente es un identificador unico, y un cliente no puede entar registrado mas de dos veces
	 * y no recibe valores nulos para identificar al cliente.*/
);

create table empleado
(
	id_empleado 	int primary key,
	nombre 		varchar (100),
	ap_p 		varchar(20),
	ap_m 		varchar(20),
	fecha_n 	date,
	fecha_cont 	varchar(15),
	id_sucursal 	int,
	foreign key (id_sucursal) references sucursal(id_sucursal),
	check((current_date-fecha_n)>=6570)--RESTRICCION
	/*En la tabla empleado tenemos diferentes restricciones, tenemos un restriccion de entidad definida en nuestra clave llamada id_empleado
	 *la cual nos define como identificaremos de manera unica a los empleados de la papeleria, tambien nos encontramos con la siguiente restriccion de relacion
	 *en nuestra clave foranea de id_sucursal la cual es una integridad de relacion, por lo que relaciona a los dif. empleados que tenemos con una sucursal
	 *y nuestro check quee es una integridad de dominio y regla de negocio ya que definimos un rango de edad y nuestro negocio no acepta menores de 18 años*/
);

create table administrador
(
	id_admin	int,
	id_empleado 	int,
	foreign key (id_admin) references empleado(id_empleado),
	foreign key (id_empleado) references empleado(id_empleado),
	unique (id_empleado)
	/*En nuestra tabla administrador es una recursividad, en la cual encontramos que un empleado es administrador el cual tiene a cargo mas empleados
	 *y econtramos dos restricciones de relacion, nuestras claves foraneas de id_admin, id_empleado, referenciadas ambas al id_empleado de la tabla empleado
	 **/
);

create table venta
(
	id_cliente 	int,
	observaciones 	varchar (50),
	fecha_v 	varchar(15),
	folio_v 	int primary key,
	id_empleado int,
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_empleado) references empleado(id_empleado)
	/*En la tabla venta tenemos como identificador unico al folio de venta, para identificar cada venta que se haga de manera unica
	 *y nos econtramos dos integridades de relacion las cuales son las claves foraneas que relacionan la venta con el cliente al que se le vende
	 *y al empleado que realiza la venta.*/
);

create table detalle_venta 
(
	codigo 		int,
	cantidad 	int,
	descuento 	numeric,
	folio_v  	int,
	foreign key (codigo) references producto(codigo),
	foreign key (folio_v) references venta(folio_v)
	/*En la tabla detalle venta nos encontramos con dos claves foraneas las cuales con integridades de relacion, por que ambas claves relacionan la tabla
	 *con la venta que se esta realizando y los productos que se estan vendiendo, el codigo del producto que introducimos en nuestra tabla producto,
	 *y el folio de venta que se encuentra en nuestra tabla venta
	 */
);

reate table compra 
(
	RFC 		varchar(15),
	folio_c 	int primary key,
	fecha_c 	varchar(15),
	id_empleado 	int,
	foreign key (RFC) references proveedor(RFC)
	/*En la tabla compra la manera de identificar de manera unica a una compra que realiza la empresa de una determinada cantidad de productos
	 *con un determinado proveedor es nuestro folio de venta(folio_v), la cual es una integridad de entidad, y tenemos una integridad de relacion
	 *en nuestra clave foranea que es el RFC que identifica a que proveedor le estamos haciendo la compra
	 */
);
create table detalle_compra
(
	folio_c 	int,
	cantidad 	int,
	descuento 	int,
	codigo 		int,
	foreign key (folio_c) references compra(folio_c),
	foreign key (codigo) references producto(codigo)
	/*En la tabla detalle venta nos ecnotramos con integridades de relacion, ya que la entidad detalle venta se relaciona con el folio de compra
	 *y con el codigo del producto que necesitamos adquirir como empresa, y por ese tenemos integridad de relacion.
	 *
	 */
);