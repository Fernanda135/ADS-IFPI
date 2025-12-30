CREATE OR REPLACE FUNCTION buscar_vendas_por_periodo(
    data_inicio DATE,
    data_fim DATE
)
RETURNS SETOF vendas
LANGUAGE plpgsql
AS $$
BEGIN

    RETURN QUERY 
    SELECT *
    FROM Vendas 
    WHERE DataVenda BETWEEN data_inicio AND data_fim;

END;
$$;


SELECT * FROM buscar_vendas_por_periodo('2024-03-01', '2024-03-31');