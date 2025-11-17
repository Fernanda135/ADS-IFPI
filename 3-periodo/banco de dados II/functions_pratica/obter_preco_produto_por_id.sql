CREATE OR REPLACE FUNCTION obter_preco_produto_por_id(
    id_p INT
)

RETURNS DECIMAL(10, 2) AS $$
DECLARE
    preco_p DECIMAL(10, 2);
BEGIN

    SELECT preco_unitario INTO preco_p FROM produtos WHERE id = id_p;

RETURN preco_p;

END;
$$ LANGUAGE plpgsql;


SELECT obter_preco_produto_por_id(2);