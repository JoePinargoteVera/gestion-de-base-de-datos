/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE (
   ID_ESTUDIANTE        NUMERIC              not null,
   NOMBRE_ESTUDIANTE    VARCHAR(50)          null,
   NUMERO_REPETICIONES  NUMERIC              null,
   FECHA_INGRESO        DATE                 null,
   constraint PK_ESTUDIANTE primary key (ID_ESTUDIANTE)
);

/*==============================================================*/
/* Index: ESTUDIANTE_PK                                         */
/*==============================================================*/
create unique index ESTUDIANTE_PK on ESTUDIANTE (
ID_ESTUDIANTE
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
create table MATRICULA (
   ID_MATRICULA         NUMERIC              not null,
   ID_ESTUDIANTE        NUMERIC              null,
   FECHA_MATRICULA      DATE                 null,
   NIVEL                NUMERIC              null,
   constraint PK_MATRICULA primary key (ID_MATRICULA)
);

/*==============================================================*/
/* Index: MATRICULA_PK                                          */
/*==============================================================*/
create unique index MATRICULA_PK on MATRICULA (
ID_MATRICULA
);

/*==============================================================*/
/* Index: ESTUDIANTE_MATRICULA_FK                               */
/*==============================================================*/
create  index ESTUDIANTE_MATRICULA_FK on MATRICULA (
ID_ESTUDIANTE
);

alter table MATRICULA
   add constraint FK_MATRICUL_ESTUDIANT_ESTUDIAN foreign key (ID_ESTUDIANTE)
      references ESTUDIANTE (ID_ESTUDIANTE)
      on delete restrict on update restrict;

