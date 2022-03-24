create table plat
(
	id varchar(15) primary key,
	label varchar(50),
	price float,
	id_categorie varchar(10)
);

create table categorie
(
	id varchar(15) primary key,
	label varchar(50)
);


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

insert into ingredient(id,label,labelUnity,price) values ('I1','tomate','kg',200);
insert into ingredient(id,label,labelUnity,price) values ('I2','oignon','kg',200);
insert into ingredient(id,label,labelUnity,price) values ('I3','salade','kg',500);
insert into ingredient(id,label,labelUnity,price) values ('I4','farine','kg',1000);
insert into ingredient(id,label,labelUnity,price) values ('I5','huile','l',1000);

insert into platIngredient (id,idPlat,idIngredient,quantity) values ('1','24','I1',1);
insert into platIngredient (id,idPlat,idIngredient,quantity) values ('2','24','I2',5);
insert into platIngredient (id,idPlat,idIngredient,quantity) values ('3','24','I5',1);
insert into platIngredient (id,idPlat,idIngredient,quantity) values ('4','25','I1',0.5);
insert into platIngredient (id,idPlat,idIngredient,quantity) values ('5','26','I3',0.1);
insert into platIngredient (id,idPlat,idIngredient,quantity) values ('6','26','I1',0.5);
insert into platIngredient (id,idPlat,idIngredient,quantity) values ('7','26','I4',1);
insert into platIngredient (id,idPlat,idIngredient,quantity) values ('8','27','I4',1);

create view prixAchatPlat as
	select idPlat,sum(quantity*price) as price from platIngredient pi
		join ingredient i on i.id = pi.idIngredient
		group by idPlat ;

create view prixRevient as
	select idPlat,label,p.price as prixVente,pap.price as prixDeRevient from prixAchatPlat pap
		 join plat p on pap.idPlat = p.id;



create view platDetail as
	select p.id,p.label,p.price,cat.label as categorie
	from plat p join categorie cat on p.id_categorie = cat.id;



create sequence seqPlat;
create sequence seqCat;




insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'nem',5000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'monPlat',8000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'tacos',10000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'sambos',5000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'cheesecake',8000,2);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'ice cream',7000,2);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'flaming banana',12000,2);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'strawberry',12000,2);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'french fries',5000,2);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'salad',20000,3);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'fajitas',25000,3);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'jambalaya',30000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'steak',12000,4);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'enchiladas',35000,4);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'buffalo wings',15000,4);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'caesar Salad',15000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'pizza',22000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'chicken biryani',22000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'chicken tikka',7000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'beef ribs',28000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'fish',15000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'cioppino',20000,1);
insert into plat (id,label,price,id_categorie) values(nextval('seqPlat'),'roast chicken',40000,1);



insert into Categorie (id,label) values(nextval('seqCat'),'dessert');
insert into Categorie (id,label) values(nextval('seqCat'),'soupe');
insert into Categorie (id,label) values(nextval('seqCat'),'entree');
insert into Categorie (id,label) values(nextval('seqCat'),'resistance');