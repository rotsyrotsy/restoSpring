create view qteIngredientParOrder as (
    select q.*, d.idOrder, d.daty
    from qteParPlatParIngredient q join detailsOrder d on q.idplat = d.idPlat
    order by idOrder
);

