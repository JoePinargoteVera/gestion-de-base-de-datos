create function fg_asignacion() returns trigger
as
$$
declare
aumento int;
begin 
select count(calificacion_cita) into aumento from cita
where (calificacion_cita='mala' and
 (cita.id_cliente_dos = new.id_cliente_dos or cita.id_cliente_uno = new.id_cliente_dos)) or
 (calificacion_cita='mala' and
	(cita.id_cliente_uno = new.id_cliente_uno or cita.id_cliente_dos = new.id_cliente_uno));
if(aumento>=2) then 
raise exception 'EL CLIENTE TIENE DOS CITAS MALAS, NO SE PUEDE ASIGNAR OTRA CITA';
else
return new;
end if;
end;
$$
language 'plpgsql';
create trigger tg_asignacion before insert or update
on cita for each row 
execute procedure fg_asignacion();