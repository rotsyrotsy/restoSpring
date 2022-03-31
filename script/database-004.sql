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


create view prixPlatOrder2 as
	select dt.id,dt.idOrder as idOrder,dt.idPlat,pv.label as plat,dt.idServeur,dt.daty as date,prixVente, o.idTable from detailsOrder dt 
		join prixDeVente pv on dt.idPlat = pv.id 
		join orderr o on o.id = dt.idOrder;



ALTER TABLE orderr
ALTER COLUMN daty TYPE timestamp;


create view lastOrderByTable as
 select o.id,t.numero from orderr o join idTable t on o.idTable = t.id where daty=(select max(daty) from orderr od where od.idTable = o.idTable);


create view qteParPlatParIngredient as
	select idPlat,p.label,quantity,labelUnity as unite from platIngredient pi
		join ingredient i on i.id = pi.idIngredient
		join plat p on p.id = idPlat; 



ALTER TABLE detailsOrder ADD etat VARCHAR(100);