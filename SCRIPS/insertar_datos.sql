set search_path to papeleria;

insert into proveedor values
	('ABC123','papeleria ABC','Hidalgo N° 205','5132311','Oaxaca','Oaxaca'),
	('XZW456','TONY','J.P. Garcia N° 105','3415231','Tehuacan','Puebla'),
	('DEF789','La estrella','Arista N° 23 Centro','5162318','Oaxaca','Oaxaca'),
	('SRF816','Color y Papel','xicotencalt N° 30 Centro','5148947','Juchitan','Oaxaca'),
	('FGT816','Lalito','Miguel Cabrera N° 400 Centro','3485610','Cholula','Puebla');

insert into producto values
	(1,'Lapiz de puntilla',5,7,'ZEBRA',1000),
	(2,'Borrador migajon',1.50,3,'Barrilito',1000),
	(3,'Puntillas 0.5',5,8,'PELIKAN',1000),
	(4,'Lapiz N°2',2,2.50,'Berol',1000),
	(5,'Colores',50,68,'NORMA',1000);
	
insert into cliente values
	(50001,'Tamara de Hope Aguirre','New York City Apartament 34','+018524847840','Movil'),
	(50002,'Luis Angel Zaragoza','Fracc. El Rosario, C 18 MZN 29','+529515266028','Movil'),
	(50003,'Juanito Perez','Calle 4to Centenario, Centro Oaxaca','+529518523659','Movil'),
	(50004,'Dulce Diaz','Reforma Agraria N° 245','+529728542539','Movil'),
	(50005,'Dulce Toledo Guzman','Sn. Pedro Comitancillo, Oaxaca S/N','+529719876318','Movil');

insert into sucursal values
	('5111709','Papeleria del sol','Centro, Oaxaca N° 45','Oaxaca',90001),
	('5118217','Papeleria del sur','H.C. Juchitan de Zaragoza, N° 14','Oaxaca',90002),
	('5148298','Papeleria Juanito','Ex. Hacienda Candiani S/N','Oaxaca',90003),
	('5142974','Papeleria Etla','Reyes Etla N°24','Oaxaca',90004),
	('5148390','Papeleria Sor Juana','Fracc. El Rosario Casa 30 Mzn 10','Oaxaca',90005);

insert into empleado values
	(70001,'Monica Michelle','Toledo','Guzman','1998','05-04-2017',90001),
	(70002,'Cecilia Yaneli','Santana','Santos','1997','24-04-2017',90002),
	(70003,'Antonella','Panepinto',null,'1997','16-05-2017',90003),
	(70004,'Anel','Ortiz','Juarez','1998','28-09-2107',90004),
	(70005,'Mayte','Garcia','Cruz','1997','30-01-2017',90005);
--insert into 

	--select * from proveedor;
	--select * from producto;
	--select * from cliente;
	--select * from sucursal;
	--select * from empleado;

insert into venta values 
	(50001,null,'2017-08-10',20001,70001),
	(50002,null,'2017-08-11',20002,70002),
	(50003,null,'2017-08-13',20003,70005),
	(50004,null,'2017-08-17',20004,70004),
	(50005,null,'2017-08-19',20005,70003);
	
insert into detalle_venta values
	(1,3,0,20001),
	(2,5,0,20001),
	(3,8,0.10,20001),
	(4,29,0,20001),
	(5,80,0.25,20001),
	(1,2,0.10,20005),
	(2,1,0.3,20005),
	(3,4,0.10,20005),
	(4,6,0,20005),
	(5,56,0.15,20005),
	(1,1,0,20004),
	(2,6,0.4,20004),
	(3,54,0.2,20004),
	(4,41,0,20004),
	(5,64,0.30,20004),
	(1,7,0.3,20003),
	(2,18,0,20003),
	(3,61,0.2,20003),
	(4,92,0.3,20003),
	(5,28,0,20003);

insert into compra values 
	('ABC123',10001,'2017-07-18',70002),
	('XZW456',10002,'2017-07-16',70001),
	('DEF789',10003,'2017-07-25',70005),
	('SRF816',10004,'2017-07-20',70004),
	('FGT816',10005,'2017-07-08',70003);

insert into detalle_compra values
	(10001,161,0.3,1),
	(10001,186,0,5),
	(10002,618,0,1),
	(10002,161,0.3,4),
	(10003,125,0.5,1),
	(10003,161,0.4,3),
	(10004,943,0,2),
	(10004,161,0.3,5),
	(10005,119,0,3),
	(10005,161,0,2);

	--select * from venta;
	--select * from detalle_venta;