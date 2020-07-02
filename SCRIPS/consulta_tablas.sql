
set search_path to papeleria;

select v.folio_v,fecha_v,c.nombre,e.nombre,descipcion

from cliente as c inner join venta as v on c.id_cliente = v.id_cliente

	inner join empleado as e on v.id_empleado = e.id_empleado
	inner join detalle_venta as dv on v.folio_v = dv.folio_v
	inner join producto as p on dv.codigo = p.codigo
	order by v.folio_v;

	select * from venta,empleado;

	select * from venta,empleado where venta.id_empleado = empleado.id_empleado;

	select distinct empleado.id_empleado,nombre from venta,empleado where venta.id_empleado = empleado.id_empleado;

	select *
		from venta as v inner join
		empleado as e
		on v.id_empleado = e.id_empleado;

	select *
	from venta natural join empleado;

	
