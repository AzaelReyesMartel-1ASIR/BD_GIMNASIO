drop database if exists BD_Gimnasio;
create database BD_Gimnasio;
use BD_Gimnasio;

create table maquina (
id_maquina int not null auto_increment,
brazos varchar(15) not null,
pectorales varchar(15) not null,
pierna varchar(15) not null,
dorsales varchar(15) not null,
primary key (id_maquina)
);

create table salas (
id_sala int not null auto_increment,
cardio varchar(15) not null ,
zumba varchar(15) not null,
musculacion varchar(15) not null,
id_gimnasio int not null,
primary key (id_sala)
);

create table gimnasio (
id_gimnasio int not null auto_increment,
id_presupuesto int not null,
mensualidad varchar(9) not null,
direccion varchar(15) not null,
telefono varchar(9) not null,
horario varchar(40) not null,
primary key (id_gimnasio)
);

create table presupuesto (
id_presupuesto int not null auto_increment,
materiales varchar(25) not null,
tipo_sala varchar(15) not null,
primary key (id_presupuesto)
);

create table cliente (
DNI int not null auto_increment,
nombre varchar(15) not null,
apellidos varchar(15) not null,
telefono varchar(9) not null,
direccion varchar(20) not null,
id_gimnasio int not null,
primary key (DNI)
);

create table monitores (
id_monitor int not null auto_increment,
nombre varchar(15) not null,
telefono varchar(9) not null,
salario varchar(5) not null,
primary key (id_monitor)
);

create table rutinas (
cod_rutina int not null auto_increment,
dificultad varchar(20) not null,
id_monitor int not null,
primary key (cod_rutina)
);

create table ejercicios (
grupo_muscular int not null auto_increment,
nombre varchar(30) not null,
sets int not null,
reps int not null,
cod_rutina int not null,
 primary key (grupo_muscular)
);

create table musculacion (
id_musculo int not null auto_increment,
pierna varchar(30) not null,
pectorales varchar(30) not null,
brazos varchar(30) not null,
dorsales varchar(30) not null,
primary key (id_musculo)
);

create table hay (
id_maquina int not null,
id_sala int not null
);

create table contrata (
id_gimnasio int not null,
id_monitor int not null
);

create table se_dividen_por (
grupo_muscular int not null,
id_musculo int not null
);

alter table hay 
add constraint FK_id_maquina foreign key (id_maquina) references maquina (id_maquina),
add constraint FK_id_sala foreign key (id_sala) references salas (id_sala);

alter table salas
add constraint FK_id_gimnasio foreign key (id_gimnasio) references gimnasio (id_gimnasio);

alter table gimnasio
add constraint FK_id_presupuesto foreign key (id_presupuesto) references Presupuesto (id_presupuesto);

alter table cliente
add constraint foreign key (id_gimnasio) references gimnasio (id_gimnasio);

alter table contrata
add constraint foreign key (id_gimnasio) references gimnasio (id_gimnasio),
add constraint FK_id_monitor foreign key (id_monitor) references monitores (id_monitor);

alter table rutinas
add constraint fk1 foreign key (id_monitor) references monitores (id_monitor);

alter table ejercicios
add constraint FK_cod_rutina foreign key (cod_rutina) references rutinas (cod_rutina);

alter table se_dividen_por
add constraint FK_grupo_muscular foreign key (grupo_muscular) references ejercicios (grupo_muscular),
add constraint FK_id_musculo foreign key (id_musculo) references musculacion (id_musculo);


insert into maquina values (1, 'bicep', 'pecho superior', 'femoral', 'deltoides post');
insert into maquina values (2, 'tricep', 'pecho inferior', 'cuadricep', 'trapecio');
insert into maquina values (3, 'radial', 'pecho medio', 'abductores', 'lumbares');
insert into maquina values (4, 'hombro', 'pecho completo', 'gemelos', 'dorsal bajo');
insert into maquina values (5, 'flexores', 'pecho menor', 'gluteo', 'espalda alta');

insert into presupuesto values (1, 'mancuernas', 'musculacion');
insert into presupuesto values (2, 'maquinas', 'musculacion');
insert into presupuesto values (3, 'balon medicinal', 'musculacion');
insert into presupuesto values (4, 'bandas elasticas', 'zumba');
insert into presupuesto values (5, 'bola de yoga', 'zumba');

insert into gimnasio values (1, 1, '15€', 'calle tenoya', '234434567', '08:00-22:00');
insert into gimnasio values (2, 2, '20€', 'calle timanfaya', '234534567', '08:00-22:00');
insert into gimnasio values (3, 3, '25€', 'calle tunez', '234434667', '08:00-22:00');
insert into gimnasio values (4, 4, '30€', 'calle turca', '234438567', '08:00-22:00');
insert into gimnasio values (5, 5, '35€', 'calle terror', '234434367', '08:00-22:00');



insert into salas values (1,'zumba', 'bicicleta', 'pecho',1);
insert into salas values (2,'zumba step', 'eliptica', 'espalda',2);
insert into salas values (3, 'aqua zumba', 'cinta', 'hombro',3);
insert into salas values (4, 'zumba gold', 'salto cuerda', 'brazos',4);
insert into salas values (5, 'zumba kids', 'skillrow', 'pierna',5);

insert into cliente values (1, 'Raul', 'Gonzalez', '622431214', 'calle peruana',1);
insert into cliente values (2, 'Joel', 'Florez', '922368940', 'calle boliviana',2);
insert into cliente values (3, 'Jowy', 'Castellano', '928364940', 'calle colombiana',3);
insert into cliente values (4, 'Ismael', 'Cabrera', '987788872', 'calle paraguaya',4);
insert into cliente values (5, 'Anabel', 'Silva', '987785557', 'calle jinamar',5);

insert into monitores values (1, 'Azael', '787654567', '1000');
insert into monitores values (2, 'Ricardo', '787654467', '1100');
insert into monitores values (3, 'Juan Jose', '787674567', '1200');
insert into monitores values (4, 'Carmelo', '787694567', '1300');
insert into monitores values (5, 'Elisa', '787654560', '1400');

insert into rutinas values (1, 'principiante',1);
insert into rutinas values (2, 'intermedio',2);
insert into rutinas values (3, 'avanzado',3);
insert into rutinas values (4, 'experto',4);
insert into rutinas values (5, 'gym rat',5);

insert into ejercicios values (1, 'peck deck', 3, 15,1);
insert into ejercicios values (2, 'dominadas', 3, 10,2);
insert into ejercicios values (3, 'curl inclinado', 3, 12,3);
insert into ejercicios values (4, 'elevaciones laterales', 5, 10,4);
insert into ejercicios values (5, 'sentadilla hack', 5, 5,5);

insert into musculacion values (1, 'tricep', 'cuadricep', 'pecho superior', 'dorsal ancho');
insert into musculacion values (2, 'bicep', 'femoral', 'pecho inferior', 'romboides mayor');
insert into musculacion values (3, 'braquial', 'gemelo', 'pecho medio', 'infraespinoso');
insert into musculacion values (4, 'muñeca', 'gluteo', 'pecho completo', 'redondo mayor');
insert into musculacion values (5, 'antebrazo', 'abductores', 'pecho plano', 'trapecio');

insert into hay values (1, 1);
insert into hay values (2, 2);
insert into hay values (3, 3);
insert into hay values (4, 4);
insert into hay values (5, 5);

insert into contrata values (1, 1);
insert into contrata values (2, 2);
insert into contrata values (3, 3);
insert into contrata values (4, 4);
insert into contrata values (5, 5);

insert into se_dividen_por values (1, 1);
insert into se_dividen_por values (2, 2);
insert into se_dividen_por values (3, 3);
insert into se_dividen_por values (4, 4);
insert into se_dividen_por values (5, 5);













































