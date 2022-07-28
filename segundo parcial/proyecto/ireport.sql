select  s.nombre_sector as sector, count(ci.id_cita) as citas, extract(YEAR from fecha_cita) as fecha from cita ci
inner join sector s on s.id_sector = ci.id_sector_cita
group by sector, fecha ;