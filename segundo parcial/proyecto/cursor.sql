do $$
declare 
historial record;
historial_cur cursor for 
select  s.nombre_sector as sector, nombre_servicio as nombre, sum(sv.costo_servicio) as recaudado from cita ci
inner join sector s on s.id_sector = ci.id_sector_cita
inner join servicios_adquiridos se on  se.id_cita = ci.id_cita
inner join servicio sv on sv.id_servicio = se.id_servicio
group by sector, nombre
order by sector;
begin
open historial_cur ;
fetch historial_cur into historial ;
while (found)loop raise notice '
SECTOR: % |NOMBRE: %|RECAUDADO: %',
historial.sector,
historial.nombre,historial.recaudado;
fetch historial_cur into historial ;
end loop;
end $$
language plpgsql;