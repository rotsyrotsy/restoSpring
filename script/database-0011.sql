create or replace view affichageEtatCommande as (
select d.idplat ,p.label ,sum(cast(p.price as double precision)) as montant, p.image,d.idorder ,d.etat , d.id as idDetails
from detailsOrder d
join plat p on d.idplat =p.id
 group by d.idplat , p.label,p.image,d.idorder ,d.etat ,d.id 
);


CREATE OR REPLACE VIEW public.additionnonpaye
AS SELECT o.daty AS date,
    po.prix AS total,
    pe.prix AS dejapayer,
    po.prix - pe.prix AS restant,
    it.numero,
    o.id as idorder 
   FROM payementeffectue pe
     JOIN prixorder po ON pe.idorder::text = po.idorder::text AND po.prix > pe.prix
     JOIN orderr o ON o.id::text = pe.idorder::text
     JOIN idtable it ON it.id::text = o.idtable::text;