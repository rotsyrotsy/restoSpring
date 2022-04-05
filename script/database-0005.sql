create or replace view prixOrder as
    select idOrder,sum(prixVente) as prix from prixPlatOrder ppo group by idOrder;

    ALTER TABLE detailsOrder ADD lieulivraison VARCHAR(255);

create or replace view etatPlat as
select d.*,p.label from detailsOrder d
join plat p on p.id=d.idPlat;

