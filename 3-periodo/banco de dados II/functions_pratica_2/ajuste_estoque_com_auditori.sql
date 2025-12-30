CREATE OR REPLACE PROCEDURE ajuste_estoque_com_auditori(
    p_id INT, 
    p_qtd_ajuste INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    estoque_atual INT;
    p_nome TEXT;
BEGIN

    SELECT estoque, nomeproduto
    INTO estoque_atual, p_nome
    FROM produtos
    WHERE produtoid = p_id;

    IF estoque_atual < 0 THEN
        RAISE NOTICE 'ERRO: Estoque negativo.';
        ROLLBACK;

    END IF;

    UPDATE produtos
    SET estoque = p_qtd_ajuste
    WHERE produtoid = p_id;

    RAISE NOTICE 'Estoque do produto "%" atualizado de % para % com sucesso.', p_nome, estoque_atual, p_qtd_ajuste;

    COMMIT;

END;
$$;


CALL ajuste_estoque_com_auditori(1, 25);