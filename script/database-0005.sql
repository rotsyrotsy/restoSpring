create or replace view prixOrder as
    select idOrder,sum(prixVente) as prix from prixPlatOrder ppo group by idOrder;

    ALTER TABLE detailsOrder ADD lieulivraison VARCHAR(255);

create view as etatPlat 
select do.*,p.label from detailsOrder do
join plat p on p.id=do.idOrder;
