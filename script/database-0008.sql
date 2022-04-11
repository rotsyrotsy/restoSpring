create view payementEffectue as
	select idOrder, sum(valeur) as prix from payement p group by idOrder;
	
create or replace view additionNonPaye as
	select daty as date,po.prix as total,pe.prix as dejapaye ,po.prix - pe.prix as restant, it.numero 
	 from payementEffectue pe 
		join prixOrder po on pe.idOrder = po.idOrder
		join orderr o on o.id = pe.idOrder
		join idTable it on it.id = o.idTable;
