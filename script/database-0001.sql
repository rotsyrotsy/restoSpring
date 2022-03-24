
create view prixAchatPlat as
	select idPlat,sum(quantity*price) as price from platIngredient pi
		join ingredient i on i.id = pi.idIngredient
		group by idPlat; 

create view prixRevient as
	select idPlat,label,p.price as prixVente,pap.price as prixDeRevient from prixAchatPlat pap
		 join plat p on pap.idPlat = p.id;


create table ingredient
(
	id varchar(15) primary key,
	label varchar(50),
	labelUnity varchar(20),
	price double precision
);

create table platIngredient
(
	id varchar(15) primary key,
	idPlat varchar(15),
	idIngredient varchar(15),
	quantity double precision
);


-- create table platIngredientPlat
-- (
-- 	id varchar(15) primary key,
-- 	idPlatUtilise varchar(15),
-- 	idPlatCible varchar(15),
-- 	quantity double precision
-- );

create table marge
(
	id varchar(15) primary key,
	maximum double precision,
	minimum double precision,
	pourcentage double precision
);