create or replace view affichageEtatCommande as (
select d.idplat ,p.label ,sum(cast(p.price as double precision)) as montant, p.image,d.idorder ,d.etat , d.id as idDetails
from detailsOrder d
join plat p on d.idplat =p.id
 group by d.idplat , p.label,p.image,d.idorder ,d.etat ,d.id 
);
