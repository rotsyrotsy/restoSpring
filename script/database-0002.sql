CREATE TABLE serveur
(
	id varchar(15) primary key,
	nom varchar(50)
);

CREATE TABLE idTable
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
	foreign key(idTable) references idTable(id),
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

