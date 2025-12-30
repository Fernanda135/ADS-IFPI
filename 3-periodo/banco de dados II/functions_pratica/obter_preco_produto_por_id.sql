CREATE OR REPLACE FUNCTION obter_preco_produto_por_id(
	id_p INTEGER
)
RETURNS DECIMAL(10, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    preco_p DECIMAL(10, 2);
BEGIN

    SELECT preco_unitario 
    INTO preco_p 
    FROM produtos 
    WHERE id = id_p;

RETURN preco_p;

END;
$$;


SELECT obter_preco_produto_por_id(2); -- Deve retornar 1500.00
SELECT obter_preco_produto_por_id(99); -- Deve retornar NULL
