
alter table orderr add column lieuLivraison varchar(50)

alter table detailsOrder drop column lieuLivraison cascade

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

