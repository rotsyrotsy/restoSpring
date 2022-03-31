create view prixDeVente as (
	select p.id,p.label,pa.price+((pa.price*pourcentage)/100) as prixVente,m.pourcentage,pa.price as prixDeRevient
	from prixachatplat pa 
	join marge m on (pa.price >= m.minimum and pa.price <= m.maximum)
	join plat p on p.id = pa.idPlat
	);

	create view prixPlatOrder as
	select dt.id,dt.idOrder as idOrder,dt.idPlat,pv.label as plat,dt.idServeur,dt.daty as date,prixVente from detailsOrder dt 
		join prixDeVente pv on dt.idPlat = pv.id ;

create view prixOrderServeur as
	select sum(prixVente) as sommePrix,idOrder,idServeur,date,sum(prixVente)*0.02 as pourboire from prixPlatOrder
		group by idOrder,idServeur,date;


insert into tables values ('1',1);
insert into tables values ('2',2);
insert into tables values ('3',3);