 alter table plat add column image varchar(255);

update plat set image = CONCAT(id,'.jpg');