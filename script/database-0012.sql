select idplat,
    i.label as nomPlat,
    quantity,
    unite,
    nomingredient,
    s.idingredient,
    s.label as nomIng,
    reste from ingredientplat i
        join stockrestant s on i.idingredient = s.idingredient where idplat ='24' and reste > quantity 


--select * from ingredientplat i where idplat ='24'