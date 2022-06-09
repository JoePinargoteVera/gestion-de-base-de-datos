
/*==============================================================*/
/* Table: CLIENTE                                        */
/*==============================================================*/

insert into cliente (nombre_cliente, apellido_cliente, cedula_cliente, telefono_cliente,
					nickname_cliente, direccion_cliente, genero_cliente, reputacion_cliente,
					id_ideologia_cliente)
values ('joe manuel', 'pinargote vera', '1351770399','0963799715','joe_manuel', 
		'av p14, calle p17', 'masculino', 'buena', 1),
		('maria jose', 'arreaga mantuano', '1347895106','0968795142','majo', 
		'av j12, calle j18', 'femenino', 'buena', 1),
		('willy andres', 'rodriguez quijije', '1347613580','0989154276','wiAndres', 
		'las orquideas', 'masculino', 'buena',2),
		('lucia fernanda', 'zambrano montesdeoca', '0564531287','0935648790','lucifer', 
		'av 13, calle 18, la pradera', 'femenino', 'buena',4),
		('fabricio jose', 'anchundia anchundia', '1358461739','0954127893','fabri', 
		'av j30, calle j12', 'masculino', 'buena',2),
		('alexandra emilia', 'cevallos segundo', '1371304568','0953140279','aleja2ceva', 
		'av t12, calle t8', 'femenino', 'buena',3),
		('lionel andres', 'fabregas pogba', '1345762138','0986451273','lionelmessi', 
		'av orellana, calle p7', 'masculino', 'mala', 1),
		('karla patricia', 'vega vera', '1374621308','0923140678','patovega', 
		'los ceibos', 'femenino', 'buena', 1),
		('sergio manuel', 'rodriguez anchundia', '1241678920','0986147680','serma', 
		'av h23, calle h9', 'masculino', 'regular',2),
		('rafael vicente', 'correa delgado', '1340267890','0975168243','el revoluciones', 
		'el panecillo', 'masculino', 'buena',2),
		('maria emilia', 'vera anchundia', '1371539990','0955512430','gatamala', 
		'av k10, calle k12', 'femenino', 'buena',3),
		('guadalupe esmeralda', 'contreras estrada', '0354216987','0925467810','guapalupe', 
		'marbella, calle m2 av m15', 'femenino', 'buena',4);
/*==============================================================*/
/* Table: INFORMACION_PERSONAL                                      */
/*==============================================================*/
insert into informacion_personal (gusto_personal,disgusto_personal,descricion_personal,id_cliente)
values ('personas extrovertidas','personas poco aseadas','soy alegre y muy responsable, amante del jazz',3),
		('personas guapas y altas','personas bajitas y feas','adoro hablar y ver peliculas clasicas',12),
		('que las personas huelan bien','personas poco aseadas','soy una persona seria, pero de buenos valores',1),
		('personas guapas','personas calladas','amante del football y de cristiano ronaldo',4),
		('personas altas','que no les guste el regueton','siempre bailo y nunca paro',2),
		('personas guapas','personas feas','soy una persona directa que sabe lo que quiere',5),
		('personas cinefilas','personas que hablen mucho','me encanta contemplar el amanecer y las estrellas',11),
		('personas amables','personas pedantes y poco humildes','siempre que puedo ayudar lo hago, soy humilde',6),
		('personas que bailen','personas aburridas','disfruto ir a diskotecas a bailar',7),
		('personas silenciosas','personas habladoras','amo el silencio',8),
		('personas guapas','personas poco aseadas y mal educadas','soy una persona madura sin tapujos',9),
		('personas alocadas','personas que siempre se estresan','me gusta el vino',10);
/*==============================================================*/
/* Table: IDEOLOGIA_DE_GENERO                                      */
/*==============================================================*/

insert into ideologia_de_genero (nombre_ideologia, descripcion_ideologia) 
values  ('heterosexual', 'atracción sexual por personas del genero contrario'),
		('homosexual', 'atracción sexual por personas del mismo género'),
		('asexual', 'ausencia de la atraccion o deseo sexual'),
		('bisexual', 'atracción sexual por personas de ambos géneros');

/*==============================================================*/
/* Table: MEDIO_DE_RELACION                                     */
/*==============================================================*/

insert into medio_de_relacion (nombre_medio, tipo_medio)values ('facebook','electronico'),('mall del pacifico','fisico'),
		('twitter','electronico'),('tinder','electronico'),('uleam','fisico'),('playa murcielago','fisico');

/*==============================================================*/
/* Table: SECTOR                                      		*/
/*==============================================================*/

insert into sector (nombre_sector, ciudad_sector, provincia_sector)
values ('los esteros', 'manta', 'manabi'),
		('flor de bastion', 'guayaquil','guayas'),
		('playa murcielago', 'manta', 'manabi'),
		('la rotonda', 'quito', 'pichincha'),
		('calle 13', 'manta', 'manabi');

/*==============================================================*/
/* Table: CITA		                                    	*/
/*==============================================================*/

insert into cita (estado_cita, tiempo_cita, fecha_cita, calificacion_cita, id_cliente_cita,id_medios_relacion,id_sector_cita)
	values	('realizado','02:00','10-05-2022','buena',1,1,1),		
		('realizado','02:00','01-03-2022','regular',7,4,1),
		('realizado','01:00','16-12-2021','mala',3,3,2),
		('realizado','01:30','19-10-2021','regular',4,6,3),
		('realizado','02:30','23-08-2020','buena',5,5,2),
		('realizado','03:00','08-06-2020','buena',6,5,5);

/*==============================================================*/
/* Table: SERVICIO                                      	*/
/*==============================================================*/

insert into servicio (nombre_servicio,costo_servicio,tipo_servicio,descripcion_servicio)
values ('taxis',30.00,'servicio de transporte','se otorga una unidad de transporte para que los cliente puedan llegar su destino'),
		('seguridad',25.50,'servicio de seguridad','se ofrece un guardia personal especializado para el cuidado de los clientes'),
		('buffet',50.00,'servicio de comidas','se prepara un buffet y se lo lleva a la direccion indicada'),
		('musica',15.80,'servicio de musica','una banda ira a tocar musica en la direccion indicada');

/*==============================================================*/
/* Table: SERVICIOS:ADQUIRIDOS                                  */
/*==============================================================*/

insert into servicios_adquiridos (id_cita, id_servicio) 
values (1, 1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,3),(4,3),(4,4),(5,1),(5,3),(5,4),(6,1),(6,3),(6,4);


		