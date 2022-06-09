--primera consulta
--Consultar el numero de citas a ciegas por sector

select  s.nombre_sector as sector, count(ci.id_cita) as citas from cita ci
inner join sector s on s.id_sector = ci.id_sector_cita
group by sector;

--segunda consulta
--Histórico que muestre el numero de citas por año

select  extract(YEAR from fecha_cita) as fecha, count(id_cita) as citas from cita
group by fecha;

--tercera consulta
--Mostrar las calificaciones regulares, calificaciones buenas y  calificaciones malas por citas a ciegas por sector

select  s.nombre_sector as sector, ci.calificacion_cita as calificacion, count(ci.id_cita) as citas from cita ci
inner join sector s on s.id_sector = ci.id_sector_cita
group by calificacion, sector
order by sector;

--cuarta consulta
--mostrar la cantidad de dinero cobrada por cada servicio en el sistema de citas a ciegas por sectores

select  s.nombre_sector as sector, sv.nombre_servicio as nombre, sum(sv.costo_servicio) as recaudado from cita ci
inner join sector s on s.id_sector = ci.id_sector_cita
inner join servicios_adquiridos se on  se.id_cita = ci.id_cita
inner join servicio sv on sv.id_servicio = se.id_servicio
group by sector, nombre
order by sector
