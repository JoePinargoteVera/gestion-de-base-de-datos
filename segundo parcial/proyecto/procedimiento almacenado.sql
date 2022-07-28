create or replace function ingresar(nombres char)
returns table (nombre_cliente character varying, fecha double precision, cita bigint)
as
$$
select nombre_cliente, extract(YEAR from fecha_cita) as fecha, count(id_cita) as cita from cliente
inner join cita on cliente.id_cliente= cita.id_cliente_uno or cliente.id_cliente= cita.id_cliente_dos
where cliente.nombre_cliente = $1
group by nombre_cliente, fecha ;
$$
language SQL;

select ingresar ('sergio manuel')