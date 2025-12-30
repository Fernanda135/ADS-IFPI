CREATE OR REPLACE FUNCTION ajustar_preco(
    p_id INT,
    p_percentual DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    taxa DECIMAL(10, 2);
    preco_atual DECIMAL(10, 2);
    preco_novo DECIMAL(10, 2);
BEGIN

    taxa := 1 + (p_percentual / 100.0);

    SELECT preco
    INTO preco_atual
    FROM produtos
    WHERE produtoid = p_id;

    preco_novo := preco_atual * taxa;

    UPDATE produtos
    SET preco = preco_novo
    WHERE produtoid = p_id;


    RETURN preco_novo;

END;
$$;




CREATE OR REPLACE FUNCTION verificar_e_ajustar_preco(
    p_id INT,
    p_percentual DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    preco_atual DECIMAL(10, 2);
    preco_novo DECIMAL(10, 2);
BEGIN

    SELECT preco
    INTO preco_atual
    FROM produtos
    WHERE produtoid = p_id;

    IF preco_atual < 500 THEN
        preco_novo := ajustar_preco(p_id, 10.0);

    ELSE
        preco_novo := ajustar_preco(p_id, p_percentual);

    END IF;


    RAISE NOTICE 'Preco atualizado de % para %.', preco_atual, preco_novo;

    RETURN preco_novo;

END;
$$;



SELECT verificar_e_ajustar_preco(4, 5);