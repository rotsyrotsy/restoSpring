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

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (9,'24','I2',0.1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (10,'24','I4',0.5);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (11,'24','I5',1);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (12,'26','I3',0.3);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (13,'26','I4',1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (14,'26','I5',2);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (15,'27','I2',0.1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (16,'27','I4',0.5);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (17,'27','I5',1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (18,'27','I1',0.2);


INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (19,'28','I2',0.5);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (20,'28','I4',3);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (21,'28','I5',2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (22,'28','I3',1);


INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (23,'29','I3',1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (24,'29','I4',0.1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (25,'29','I5',0.2);


INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (27,'30','I2',0.2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (28,'30','I4',0.3);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (29,'30','I5',0.2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (30,'30','I3',0.1);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (33,'31','I5',2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (34,'31','I3',0.5);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (35,'32','I1',2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (37,'32','I5',0.1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (38,'32','I3',0.1);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (41,'33','I5',0.2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (42,'33','I3',1);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (44,'34','I4',0.3);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (45,'34','I2',0.2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (46,'34','I1',1);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (48,'35','I1',2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (49,'35','I5',0.2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (50,'35','I3',1);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (53,'36','I1',0.5);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (54,'36','I3',0.9);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (55,'37','I2',0.5);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (57,'37','I5',0.2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (58,'37','I3',1.5);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (59,'38','I2',1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (62,'38','I3',1);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (65,'39','I5',0.2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (66,'39','I3',1.5);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (67,'40','I2',1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (68,'40','I4',0.5);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (69,'40','I5',2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (70,'40','I3',1);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (73,'41','I5',3);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (74,'41','I3',1);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (75,'42','I2',0.1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (76,'42','I1',2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (78,'42','I3',0.2);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (79,'43','I1',0.5);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (81,'43','I5',2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (82,'43','I3',1);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (83,'45','I2',1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (84,'45','I4',0.3);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (85,'45','I5',1);

INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (87,'46','I2',1);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (99,'46','I5',0.2);
INSERT INTO platingredient (id,idplat,idingredient,quantity) VALUES (100,'46','I3',1);

CREATE OR REPLACE VIEW additionnonpaye 
AS
 SELECT o.daty AS date,
    po.prix AS total,
    case 
    	when pe.prix is null then 0
    	else pe.prix 
    end dejapayer,
     case 
    	when pe.prix is null then po.prix
    	else po.prix - pe.prix 
    end restant,
    it.numero,
    o.id AS idorder
   from prixorder po 
     LEFT JOIN payementeffectue pe ON po.idorder::text = pe.idorder::text  
     JOIN orderr o ON o.id::text = po.idorder::text
     JOIN idtable it ON it.id::text = o.idtable::text;

CREATE OR REPLACE VIEW public.prixdevente
AS SELECT p.id,
    p.label,
    pa.price + pa.price * m.pourcentage / 100::double precision AS prixvente,
    m.pourcentage,
    pa.price AS prixderevient,
    p.image 
   FROM prixachatplat pa
     JOIN marge m ON pa.price >= m.minimum AND pa.price < m.maximum
     JOIN plat p ON p.id::text = pa.idplat::text;