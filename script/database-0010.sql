 alter table plat add column image varchar(255);

update plat set image = CONCAT(id,'.jpg');


create or replace view platDetail as
	select p.id,p.label,p.price,cat.label as categorie,p.image
	from plat p join categorie cat on p.id_categorie = cat.id;

DROP VIEW lastorderbytable;

CREATE OR REPLACE VIEW public.lastorderbytable
AS SELECT o.id as idorder, o.idserveur , o.daty, t.id as idtable , t.numero 
   FROM orderr o
     JOIN idtable t ON o.idtable::text = t.id::text
  WHERE o.daty = (( SELECT max(od.daty) AS max
           FROM orderr od
          WHERE od.idtable::text = o.idtable::text));

CREATE OR REPLACE VIEW public.prixplatorder
AS SELECT dt.id,
    dt.idorder,
    dt.idplat,
    pv.label AS plat,
    dt.idserveur,
    dt.daty AS date,
    pv.prixvente,
    p.image
   FROM detailsorder dt
     JOIN prixdevente pv ON dt.idplat::text = pv.id::text
     join plat p on pv.id = p.id;
