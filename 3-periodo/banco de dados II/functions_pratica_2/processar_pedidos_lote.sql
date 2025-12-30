CREATE OR REPLACE FUNCTION somar_valores_array(
    p_array NUMERIC[]
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    soma_total NUMERIC := 0;
    elemento NUMERIC;
BEGIN

    FOREACH elemento IN ARRAY p_array LOOP

        soma_total := soma_total + elemento;

    END LOOP;

    RETURN soma_total;

END;
$$;




CREATE OR REPLACE PROCEDURE processar_pedidos_lote(
    p_id_arr INT[], 
    p_qtd_arr INT[]
)
LANGUAGE plpgsql
AS $$
DECLARE
    i int;
    id INT;
    qtd INT;
    p_preco NUMERIC;
    valor_item NUMERIC;
    valores_itens NUMERIC[] := '{}';
    valor_total NUMERIC;
BEGIN

    FOR i IN 1..array_length(p_id_arr, 1) LOOP

        id := p_id_arr[i];
        qtd := p_qtd_arr[i];

        SELECT preco INTO p_preco
        FROM produtos
        WHERE produtoid = id;

        valor_item := p_preco * qtd;

        valores_itens := array_append(valores_itens, valor_item);

    END LOOP;

    valor_total := somar_valores_array(valores_itens);

    
    RAISE NOTICE '=== RESUMO DO LOTE ===';
    RAISE NOTICE 'Valores individuais dos itens: %', valores_itens;
    RAISE NOTICE 'Valor total do lote: R$ %', valor_total;
    RAISE NOTICE 'Quantidade de itens processados: %', array_length(p_id_arr, 1);

END;
$$;




-- Chamada da procedure com arrays de exemplo
CALL processar_pedidos_lote(
    ARRAY[1, 2, 3],      -- IDs dos produtos
    ARRAY[2, 1, 3]       -- Quantidades respectivas
);