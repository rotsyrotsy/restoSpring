create view qteIngredientParOrder as (
    select q.*, d.idOrder, d.daty
    from qteParPlatParIngredient q join detailsOrder d on q.idplat = d.idPlat
    order by idOrder
);

select nomIngredient, sum(quantity) as quantity,unite
 from qteIngredientParOrder where daty>'2022-04-03'
and daty<'2022-04-05' group by nomIngredient,unite