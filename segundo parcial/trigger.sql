create function fn_controlMatricula() returns trigger
as
$$
declare
aumento int;
aumento2 int;
BEGIN
select count(nivel) into aumento2 from matricula
where id_estudiante = new.id_estudiante and nivel = new.nivel;
IF(aumento2 >= 1) then
update estudiante set numero_repeticiones = aumento2 - 1;
return new;
END IF;
select count(nivel) into aumento from matricula
where id_estudiante = old.id_estudiante and nivel = old.nivel;
IF(aumento >= 1) then
update estudiante set numero_repeticiones = aumento - 1;
return old;
else
update estudiante set numero_repeticiones = aumento;
return old;
END IF;
END;
$$
language 'plpgsql';
create trigger tr_controlMatricula after insert or delete
on matricula for each row 
execute procedure fn_controlMatricula();