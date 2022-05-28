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

insert into payement values(nextval('seqPayement'),'1',15000,'2022-04-06','cheque');
insert into payement values(nextval('seqPayement'),'2',120400,'2022-04-06','cheque');
insert into payement values(nextval('seqPayement'),'3',200000,'2022-04-07','cheque');
insert into payement values(nextval('seqPayement'),'4',150000,'2022-04-07','cheque');


insert into payement values(nextval('seqPayement'),'5',50000,'2022-04-06','espece');
insert into payement values(nextval('seqPayement'),'6',30000,'2022-04-07','espece');
insert into payement values(nextval('seqPayement'),'7',85000,'2022-04-07','espece');
