--drop schema OlgaMarin cascade

--Schema

create schema OlgaMarin authorization cclgjebc;

--Tables

create table OlgaMarin.type_modelos (
	id_modelo varchar(10) not null, --PK
	id_marca varchar(10) not null, --FK
	modelo varchar(20) not null, 
	description varchar(250) null 
);
alter table OlgaMarin.type_modelos
add constraint type_modelos_pk primary key (id_modelo);


create table OlgaMarin.type_marcas (
	id_marca varchar(10) not null, --PK
	id_grupo_empresarial varchar(10) not null, --FK
	marca varchar(20) not null, 
	description varchar(250) null 
);
alter table OlgaMarin.type_marcas
add constraint type_marcas_pk primary key (id_marca);


create table OlgaMarin.type_grupo_empresarial (
	id_grupo_empresarial varchar(10) not null, --PK
	grupo varchar(20) not null, 
	description varchar(250) null 
);
alter table OlgaMarin.type_grupo_empresarial
add constraint type_grupo_empresarial_pk primary key (id_grupo_empresarial);


create table OlgaMarin.type_monedas (
	id_moneda varchar(10) not null, --PK
	name varchar(20) not null, 
	description varchar(250) null 
);
alter table OlgaMarin.type_monedas
add constraint type_monedas_pk primary key (id_moneda);


create table OlgaMarin.type_color (
	id_color varchar(10) not null, --PK
	name varchar(20) not null, 
	description varchar(250) null 
);
alter table OlgaMarin.type_color
add constraint type_color_pk primary key (id_color);

create table OlgaMarin.type_aseguradora (
	id_aseguradora varchar(10) not null, --PK
	name varchar(20) not null, 
	description varchar(250) null 
);
alter table OlgaMarin.type_aseguradora
add constraint type_aseguradora_pk primary key (id_aseguradora);


create table OlgaMarin.vehiculos (
	id_vehiculo varchar(10) not null,  --PK
	color varchar(20) not null,        --FK
	matricula varchar(10) not null,
	kms integer not null, 
	aseguradora varchar(20) not null,  --FK
	n_poliza integer not null,
	fecha_compra date not null,
	modelo varchar(20) not null,       --FK
	description varchar(250) null 
);
alter table OlgaMarin.vehiculos
add constraint vehiculos_pk primary key (id_vehiculo);

alter table OlgaMarin.vehiculos 
add constraint vehiculos_FK1 foreign key (modelo) 
references OlgaMarin.type_modelos (id_modelo); 

alter table OlgaMarin.vehiculos 
add constraint vehiculos_FK2 foreign key (color) 
references OlgaMarin.type_color (id_color); 

alter table OlgaMarin.vehiculos 
add constraint vehiculos_FK3 foreign key (aseguradora) 
references OlgaMarin.type_aseguradora (id_aseguradora); 


create table OlgaMarin.revisiones (
	id_vehiculo varchar(10) not null, --PK --FK
	id_revision varchar(10) not null, --PK
	kms integer not null, 
	fecha date not null,
	importe integer not null,
	moneda varchar(20) not null, --FK
	description varchar(250) null 
);
alter table OlgaMarin.revisiones
add constraint revisiones_pk primary key (id_vehiculo, id_revision);

alter table OlgaMarin.revisiones 
add constraint revisiones_FK1 foreign key (id_vehiculo) 
references OlgaMarin.vehiculos (id_vehiculo); 

alter table OlgaMarin.revisiones 
add constraint revisiones_FK2 foreign key (moneda) 
references OlgaMarin.type_monedas (id_moneda); 


alter table OlgaMarin.type_modelos
add constraint type_modelos_FK foreign key (id_marca) 
references OlgaMarin.type_marcas (id_marca); 

alter table OlgaMarin.type_marcas 
add constraint type_marcas_FK foreign key (id_grupo_empresarial) 
references OlgaMarin.type_grupo_empresarial (id_grupo_empresarial); 

-- Data

insert into OlgaMarin.type_grupo_empresarial
(id_grupo_empresarial, grupo)
values ('0001','BMW Group');

insert into OlgaMarin.type_marcas
(id_marca, id_grupo_empresarial, marca)
values ('0001','0001', 'BMW');

insert into OlgaMarin.type_marcas
(id_marca, id_grupo_empresarial, marca)
values ('0002','0001', 'Mini');

insert into OlgaMarin.type_marcas
(id_marca, id_grupo_empresarial, marca)
values ('0003','0001', 'Rolls Royce');

insert into OlgaMarin.type_grupo_empresarial
(id_grupo_empresarial, grupo)
values ('0002','FCA');

insert into OlgaMarin.type_marcas
(id_marca, id_grupo_empresarial, marca)
values ('0004','0002', 'Alfa Romeo');

insert into OlgaMarin.type_marcas
(id_marca, id_grupo_empresarial, marca)
values ('0005','0002', 'Jeep');

insert into OlgaMarin.type_marcas
(id_marca, id_grupo_empresarial, marca)
values ('0006','0002', 'Dodge');

insert into OlgaMarin.type_grupo_empresarial
(id_grupo_empresarial, grupo)
values ('0003','General Motors');

insert into OlgaMarin.type_marcas
(id_marca, id_grupo_empresarial, marca)
values ('0007','0003', 'Cadillac');

insert into OlgaMarin.type_modelos
(id_modelo, id_marca, modelo)
values ('0001','0001', 'X1');

insert into OlgaMarin.type_modelos
(id_modelo, id_marca, modelo)
values ('0002','0001', 'X2');

insert into OlgaMarin.type_modelos
(id_modelo, id_marca, modelo)
values ('0003','0002', 'Countryman');

insert into OlgaMarin.type_modelos
(id_modelo, id_marca, modelo)
values ('0004','0002', 'Clubman');

insert into OlgaMarin.type_modelos
(id_modelo, id_marca, modelo)
values ('0005','0003', 'Phantom');

insert into OlgaMarin.type_modelos
(id_modelo, id_marca, modelo)
values ('0006','0004', 'Stelvio');

insert into OlgaMarin.type_modelos
(id_modelo, id_marca, modelo)
values ('0007','0005', 'Renegade');

insert into OlgaMarin.type_modelos
(id_modelo, id_marca, modelo)
values ('0008','0005', 'Wrangler');

insert into OlgaMarin.type_modelos
(id_modelo, id_marca, modelo)
values ('0009','0006', 'Challenger');

insert into OlgaMarin.type_modelos
(id_modelo, id_marca, modelo)
values ('0010','0007', 'Escalade');

insert into OlgaMarin.type_monedas
(id_moneda, name)
values ('0001','Euro');

insert into OlgaMarin.type_monedas
(id_moneda, name)
values ('0002','Dolar');

insert into OlgaMarin.type_color
(id_color, name)
values ('0001','Negro');

insert into OlgaMarin.type_color
(id_color, name)
values ('0002','Blanco');

insert into OlgaMarin.type_color
(id_color, name)
values ('0003','Rojo');

insert into OlgaMarin.type_aseguradora
(id_aseguradora, name)
values ('0001','AXA');

insert into OlgaMarin.type_aseguradora
(id_aseguradora, name)
values ('0002','Mapfre');

insert into OlgaMarin.type_aseguradora
(id_aseguradora, name)
values ('0003','Generali');

insert into OlgaMarin.vehiculos
(id_vehiculo, color, matricula, kms, aseguradora, n_poliza, fecha_compra, modelo)
values ('0001','0001', '9999X', 11000, '0002', '50500', '2018-05-18', '0001');

insert into OlgaMarin.vehiculos
(id_vehiculo, color, matricula, kms, aseguradora, n_poliza, fecha_compra, modelo)
values ('0002','0002', '8888X', 15050, '0001', '80800', '2018-09-18', '0002');

insert into OlgaMarin.vehiculos
(id_vehiculo, color, matricula, kms, aseguradora, n_poliza, fecha_compra, modelo)
values ('0003','0003', '7777X', 05050, '0003', '80801', '2018-10-18', '0003');

insert into OlgaMarin.vehiculos
(id_vehiculo, color, matricula, kms, aseguradora, n_poliza, fecha_compra, modelo)
values ('0004','0003', '6666X', 05080, '0002', '00801', '2015-10-18', '0001');

insert into OlgaMarin.vehiculos
(id_vehiculo, color, matricula, kms, aseguradora, n_poliza, fecha_compra, modelo)
values ('0005','0002', '5555X', 35080, '0001', '21601', '2022-10-18', '0007');

insert into OlgaMarin.vehiculos
(id_vehiculo, color, matricula, kms, aseguradora, n_poliza, fecha_compra, modelo)
values ('0006','0001', '4444X', 2045, '0002', '45289', '2020-11-18', '0006');

insert into OlgaMarin.vehiculos
(id_vehiculo, color, matricula, kms, aseguradora, n_poliza, fecha_compra, modelo)
values ('0007','0001', '3333X', 11045, '0002', '84289', '2020-11-17', '0005');

insert into OlgaMarin.vehiculos
(id_vehiculo, color, matricula, kms, aseguradora, n_poliza, fecha_compra, modelo)
values ('0008','0003', '2222X', 51045, '0001', '69289', '2017-03-17', '0010');

