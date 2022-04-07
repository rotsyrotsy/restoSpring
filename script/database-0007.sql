create table payement
(
	id varchar(15) primary key,
	idOrder varchar(15),
	valeur float,
	date date,
	type varchar(15),
	foreign key(idOrder) references orderr(id)
);

create sequence seqPayement;

insert into payement values(nextval('seqPayement'),'1',15000,'2022-04-01','cheque');
insert into payement values(nextval('seqPayement'),'2',175000,'2022-04-02','espece');
insert into payement values(nextval('seqPayement'),'4',120400,'2022-04-09','cheque');


