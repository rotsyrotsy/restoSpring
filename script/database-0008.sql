create view payementEffectue as
	select idOrder, sum(valeur) as prix from payement p group by idOrder
	
create view additionNonPaye as
	select daty as date,pe.prix as total,po.prix - pe.prix as restant from payementEffectue pe 
		join prixOrder po on pe.idOrder = po.idOrder
		join orderr o on o.id = pe.idOrder