create view payementEffectue as
	select idOrder, sum(valeur) as prix from payement p group by idOrder;
	
create or replace view additionNonPaye as
	select daty as date,po.prix as total,pe.prix as dejapayer,po.prix - pe.prix as restant, it.numero 
	 from payementEffectue pe 
		join prixOrder po on pe.idOrder = po.idOrder and po.prix>pe.prix
		join orderr o on o.id = pe.idOrder
		join idTable it on it.id = o.idTable;

-- cohérence de données entre prix plat et payement

insert into payement values(nextval('seqPayement'),'18',5000,'2022-04-06','cheque');
insert into payement values(nextval('seqPayement'),'O2',10000,'2022-04-06','cheque');
insert into payement values(nextval('seqPayement'),'17',22350,'2022-04-07','cheque');
insert into payement values(nextval('seqPayement'),'16',5850,'2022-04-07','cheque');


insert into payement values(nextval('seqPayement'),'19',6500,'2022-04-06','espece');
insert into payement values(nextval('seqPayement'),'O1',8500,'2022-04-07','espece');
insert into payement values(nextval('seqPayement'),'O3',15000,'2022-04-07','espece');
