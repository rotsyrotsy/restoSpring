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