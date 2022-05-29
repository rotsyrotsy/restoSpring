
alter table orderr add column lieuLivraison varchar(50);

alter table detailsOrder drop column lieuLivraison cascade;

CREATE VIEW public.etatplat AS
 SELECT d.id,
    d.idorder,
    d.idplat,
    d.daty,
    d.idserveur,
    d.etat,
    p.label
   FROM (public.detailsorder d
     JOIN public.plat p ON (((p.id)::text = (d.idplat)::text)));


CREATE OR REPLACE VIEW public.additionnonpaye
AS SELECT o.daty AS date,
    po.prix AS total,
        CASE
            WHEN pe.prix IS NULL THEN 0::double precision
            ELSE pe.prix
        END AS dejapayer,
        CASE
            WHEN pe.prix IS NULL THEN po.prix
            ELSE po.prix - pe.prix
        END AS restant,
    it.numero,
    o.id AS idorder,
    o.lieulivraison 
   FROM prixorder po
     LEFT JOIN payementeffectue pe ON po.idorder::text = pe.idorder::text
     JOIN orderr o ON o.id::text = po.idorder::text
     left JOIN idtable it ON it.id::text = o.idtable::text;



CREATE OR REPLACE VIEW public.montantordersurcarte
AS  SELECT 
    dt.idorder , sum( cast(p.price as double precision)) as montant
   FROM detailsorder dt
     JOIN plat p ON dt.idplat ::text = p.id::text
     where dt.etat = 'pret'
     group by dt.idorder 


     CREATE OR REPLACE VIEW public.additionnonpayesurcarte
AS SELECT o.daty AS date,
    po.montant AS total,
        CASE
            WHEN pe.prix IS NULL THEN 0::double precision
            ELSE pe.prix
        END AS dejapayer,
        CASE
            WHEN pe.prix IS NULL THEN po.montant
            ELSE po.montant - pe.prix
        END AS restant,
    it.numero,
    o.id AS idorder,
    o.lieulivraison
   FROM montantordersurcarte po
     LEFT JOIN payementeffectue pe ON po.idorder::text = pe.idorder::text
     JOIN orderr o ON o.id::text = po.idorder::text
     LEFT JOIN idtable it ON it.id::text = o.idtable::text;