create view qteIngredientParOrder as (
    select q.*, d.idOrder, d.daty
    from qteParPlatParIngredient q join detailsOrder d on q.idplat = d.idPlat
    order by idOrder
);

select nomIngredient, sum(quantity) as quantity,unite
 from qteIngredientParOrder where daty>'2022-04-03'
and daty<'2022-04-05' group by nomIngredient,unite


select tab.*, i.price as pu, quantity*i.price as prixTotal from(
    select nomIngredient, sum(quantity) as quantity,unite
    from qteIngredientParOrder where daty>'2022-04-03'
    and daty<'2022-04-05' group by nomIngredient,unite
) as tab join ingredient i on i.label = tab.nomIngredient


