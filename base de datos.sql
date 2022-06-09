/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     26/5/2022 12:19:36                           */
/*==============================================================*/


/*==============================================================*/
/* Table: CITA                                                  */
/*==============================================================*/
create table CITA (
   ID_CITA              SERIAL not null,
   ID_MEDIOS_RELACION   INT4                 null,
   ID_CLIENTE_CITA      INT4                 null,
   ID_SECTOR_CITA       INT4                 null,
   FECHA_CITA           DATE                 null,
   ESTADO_CITA          VARCHAR(20)          null,
   TIEMPO_CITA          TIME                 null,
   CALIFICACION_CITA    VARCHAR(30)          null,
   constraint PK_CITA primary key (ID_CITA)
);

/*==============================================================*/
/* Index: CITA_PK                                               */
/*==============================================================*/
create unique index CITA_PK on CITA (
ID_CITA
);

/*==============================================================*/
/* Index: ALBERGA_FK                                            */
/*==============================================================*/
create  index ALBERGA_FK on CITA (
ID_SECTOR_CITA
);

/*==============================================================*/
/* Index: PROVOCA_FK                                            */
/*==============================================================*/
create  index PROVOCA_FK on CITA (
ID_MEDIOS_RELACION
);

/*==============================================================*/
/* Index: ACOJE_FK                                              */
/*==============================================================*/
create  index ACOJE_FK on CITA (
ID_CLIENTE_CITA
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           SERIAL not null,
   ID_IDEOLOGIA_CLIENTE INT4                 null,
   ID_PAREJA_CLIENTE    INT4                 null,
   NOMBRE_CLIENTE       VARCHAR(50)          null,
   APELLIDO_CLIENTE     VARCHAR(50)          null,
   CEDULA_CLIENTE       VARCHAR(10)          null,
   TELEFONO_CLIENTE     VARCHAR(10)          null,
   NICKNAME_CLIENTE     VARCHAR(50)          null,
   DIRECCION_CLIENTE    VARCHAR(100)         null,
   GENERO_CLIENTE       VARCHAR(20)          null,
   REPUTACION_CLIENTE   VARCHAR(30)          null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Index: ADOPTA_FK                                             */
/*==============================================================*/
create  index ADOPTA_FK on CLIENTE (
ID_IDEOLOGIA_CLIENTE
);

/*==============================================================*/
/* Index: EMPAREJA_FK                                           */
/*==============================================================*/
create  index EMPAREJA_FK on CLIENTE (
ID_PAREJA_CLIENTE
);

/*==============================================================*/
/* Table: IDEOLOGIA_DE_GENERO                                   */
/*==============================================================*/
create table IDEOLOGIA_DE_GENERO (
   ID_IDEOLOGIA         SERIAL not null,
   NOMBRE_IDEOLOGIA     VARCHAR(50)          null,
   DESCRIPCION_IDEOLOGIA VARCHAR(200)         null,
   constraint PK_IDEOLOGIA_DE_GENERO primary key (ID_IDEOLOGIA)
);

/*==============================================================*/
/* Index: IDEOLOGIA_DE_GENERO_PK                                */
/*==============================================================*/
create unique index IDEOLOGIA_DE_GENERO_PK on IDEOLOGIA_DE_GENERO (
ID_IDEOLOGIA
);

/*==============================================================*/
/* Table: INFORMACION_PERSONAL                                  */
/*==============================================================*/
create table INFORMACION_PERSONAL (
   ID_PERSONAL          SERIAL not null,
   ID_CLIENTE           INT4                 null,
   GUSTO_PERSONAL       VARCHAR(100)         null,
   DISGUSTO_PERSONAL    VARCHAR(100)         null,
   DESCRICION_PERSONAL  VARCHAR(200)         null,
   constraint PK_INFORMACION_PERSONAL primary key (ID_PERSONAL)
);

/*==============================================================*/
/* Index: INFORMACION_PERSONAL_PK                               */
/*==============================================================*/
create unique index INFORMACION_PERSONAL_PK on INFORMACION_PERSONAL (
ID_PERSONAL
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on INFORMACION_PERSONAL (
ID_CLIENTE
);

/*==============================================================*/
/* Table: MEDIO_DE_RELACION                                     */
/*==============================================================*/
create table MEDIO_DE_RELACION (
   ID_MEDIO             SERIAL not null,
   NOMBRE_MEDIO         VARCHAR(50)          null,
   TIPO_MEDIO           VARCHAR(30)          null,
   constraint PK_MEDIO_DE_RELACION primary key (ID_MEDIO)
);

/*==============================================================*/
/* Index: MEDIO_DE_RELACION_PK                                  */
/*==============================================================*/
create unique index MEDIO_DE_RELACION_PK on MEDIO_DE_RELACION (
ID_MEDIO
);

/*==============================================================*/
/* Table: SECTOR                                                */
/*==============================================================*/
create table SECTOR (
   ID_SECTOR            SERIAL not null,
   NOMBRE_SECTOR        VARCHAR(50)          null,
   CIUDAD_SECTOR        VARCHAR(50)          null,
   PROVINCIA_SECTOR     VARCHAR(50)          null,
   constraint PK_SECTOR primary key (ID_SECTOR)
);

/*==============================================================*/
/* Index: SECTOR_PK                                             */
/*==============================================================*/
create unique index SECTOR_PK on SECTOR (
ID_SECTOR
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          SERIAL not null,
   NOMBRE_SERVICIO      VARCHAR(50)          null,
   TIPO_SERVICIO        VARCHAR(30)          null,
   DESCRIPCION_SERVICIO VARCHAR(100)         null,
   COSTO_SERVICIO       FLOAT500             null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Table: SERVICIOS_ADQUIRIDOS                                  */
/*==============================================================*/
create table SERVICIOS_ADQUIRIDOS (
   ID_CITA              INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   constraint PK_SERVICIOS_ADQUIRIDOS primary key (ID_CITA, ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIOS_ADQUIRIDOS_PK                               */
/*==============================================================*/
create unique index SERVICIOS_ADQUIRIDOS_PK on SERVICIOS_ADQUIRIDOS (
ID_CITA,
ID_SERVICIO
);

/*==============================================================*/
/* Index: ADQUIERE_FK                                           */
/*==============================================================*/
create  index ADQUIERE_FK on SERVICIOS_ADQUIRIDOS (
ID_CITA
);

/*==============================================================*/
/* Index: ADQUIERE2_FK                                          */
/*==============================================================*/
create  index ADQUIERE2_FK on SERVICIOS_ADQUIRIDOS (
ID_SERVICIO
);

alter table CITA
   add constraint FK_CITA_ACOJE_CLIENTE foreign key (ID_CLIENTE_CITA)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CITA
   add constraint FK_CITA_ALBERGA_SECTOR foreign key (ID_SECTOR_CITA)
      references SECTOR (ID_SECTOR)
      on delete restrict on update restrict;

alter table CITA
   add constraint FK_CITA_PROVOCA_MEDIO_DE foreign key (ID_MEDIOS_RELACION)
      references MEDIO_DE_RELACION (ID_MEDIO)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_ADOPTA_IDEOLOGI foreign key (ID_IDEOLOGIA_CLIENTE)
      references IDEOLOGIA_DE_GENERO (ID_IDEOLOGIA)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_EMPAREJA_CLIENTE foreign key (ID_PAREJA_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table INFORMACION_PERSONAL
   add constraint FK_INFORMAC_TIENE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table SERVICIOS_ADQUIRIDOS
   add constraint FK_SERVICIO_ADQUIERE_CITA foreign key (ID_CITA)
      references CITA (ID_CITA)
      on delete restrict on update restrict;

alter table SERVICIOS_ADQUIRIDOS
   add constraint FK_SERVICIO_ADQUIERE2_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

