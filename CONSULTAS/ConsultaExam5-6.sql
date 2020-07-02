set search_path to zapateria;

select pr.razon_social,sum(z.existencia) as suma_existencia
from proveedor as pr inner join zapato as z
on pr.id_p = z.prov
group by pr.id_p

select codigo,descripcion,precio_v,material
from zapato
where material='piel'