CREATE TABLE serveur
(
	id varchar(15) primary key,
	nom varchar(50)
);

CREATE TABLE tables
(
	id varchar(15) primary key,
	numero float	
);

CREATE TABLE orderr
(
	id varchar(15) primary key,
	idTable varchar(15),
	idServeur varchar(15),
	daty date,
	foreign key(idTable) references tables(id),
	foreign key(idServeur) references serveur(id)
);

CREATE TABLE detailsOrder
(
	id varchar(15) primary key,
	idOrder varchar(15),
	idPlat varchar(15),
	foreign key(idOrder) references orderr(id),
	foreign key(idPlat) references plat(id)
);

create sequence seqServeur;
create sequence seqIdTable;
create sequence seqOrderr;
create sequence seqDetailsOrder;

create view dateDetailsOrder as
	select  d.id,d.idOrder,d.idPlat,o.daty as date,o.idServeur
		from detailsOrder d
		join orderr o on o.id = d.idOrder



insert into serveur values ('S1','RASERVE');
insert into serveur values ('S2','THESERVE');
insert into serveur values ('S3','CERVEAU');


insert into orderr values ('O1',1,'S1','28-03-2022');
insert into orderr values ('O2',1,'S1','28-03-2022');
insert into orderr values ('O3',2,'S1','28-03-2022');

insert into detailsOrder values ('DO1','O1','24','28-03-2022','S1');
insert into detailsOrder values ('DO2','O1','25','28-03-2022','S1');
insert into detailsOrder values ('DO3','O1','26','28-03-2022','S1');
insert into detailsOrder values ('DO4','O2','27','28-03-2022','S1');
insert into detailsOrder values ('DO5','O2','24','28-03-2022','S1');
insert into detailsOrder values ('DO6','O2','25','28-03-2022','S1');
insert into detailsOrder values ('DO7','O3','26','28-03-2022','S1');
insert into detailsOrder values ('DO8','O3','27','28-03-2022','S1');
insert into detailsOrder values ('DO9','O3','24','28-03-2022','S1');
insert into detailsOrder values ('DO10','O1','25','28-03-2022','S1');

