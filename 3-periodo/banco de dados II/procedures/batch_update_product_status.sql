CREATE OR REPLACE PROCEDURE batch_update_product_status(
    p_product_ids INT[],
    p_new_statuses TEXT[]
)
LANGUAGE plpgsql
AS $$
DECLARE
    i INT;
    current_product_id INT;
    current_new_status TEXT;
    product_exists BOOLEAN;
BEGIN

    FOR i IN 1..array_length(p_product_ids, 1) LOOP
        current_product_id := p_product_ids[i];
        current_new_status := p_new_statuses[i];
        SELECT EXISTS (SELECT 1 FROM PRODUTOS WHERE productId =
        current_product_id) INTO product_exists;
        IF NOT product_exists THEN
            RAISE EXCEPTION 'Produto com ID % não encontrado.
            Revertendo todas as alterações.', current_product_id;
        END IF;
        UPDATE PRODUTOS
        SET status = current_new_status
        WHERE productId = current_product_id;
    END LOOP;
    RAISE NOTICE 'Todos os status dos produtos foram atualizados em
lote.';
    EXCEPTION
    WHEN OTHERS THEN
    RAISE NOTICE 'Ocorreu um erro durante a atualização em lote.
    Todas as alterações foram revertidas. Detalhes: %', SQLERRM;


END;
$$;


CALL batch_update_product_status(ARRAY[1,4], ARRAY['zzzz','desativado']);
CALL batch_update_product_status(ARRAY[2,999], ARRAY['desativado','disponivel']);

SELECT * FROM produtos;