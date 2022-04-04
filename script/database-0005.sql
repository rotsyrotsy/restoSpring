create or replace view prixOrder as
    select idOrder,sum(prixVente) as prix from prixPlatOrder ppo group by idOrder
