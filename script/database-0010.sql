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

create or replace view prixdevente as
SELECT p.id,
    p.label,
    pa.price + pa.price * m.pourcentage / 100::double precision AS prixvente,
    m.pourcentage,
    pa.price AS prixderevient
   FROM prixachatplat pa
     JOIN marge m ON pa.price >= m.minimum AND pa.price < m.maximum
     JOIN plat p ON p.id::text = pa.idplat::text;



create or replace view stockRestant as
SELECT mouv.idingredient,
    i.label,
    i.labelunity,
    mouv.sum + ivd.qte AS reste
   FROM mouvementstockapresinventaire mouv
     JOIN inventairedetails ivd ON mouv.idingredient = ivd.idingredient
     JOIN ingredient i ON mouv.idingredient::text = i.id::text;
