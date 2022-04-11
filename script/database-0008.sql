
create view payementEffectue as
	select sum(valeur) as prix from payement p group by idOrder