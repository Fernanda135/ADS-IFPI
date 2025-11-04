CREATE OR REPLACE PROCEDURE batch_update_product_status(
    product_ids INTEGER[],
    new_statuses TEXT[]
) 
    LANGUAGE plpgsql
    AS $$
    DECLARE
    idx integer := 0;
    p_id integer;
    st text;
    updated_count integer;
    BEGIN

    IF array_length(product_ids,1) <> array_length(new_statuses,1) THEN
        RAISE EXCEPTION 'Os arrays devem ter a mesma quantidade de elementos.';
    END IF;

    FOREACH p_id IN ARRAY product_ids LOOP
        idx := idx + 1;
        st := new_statuses[idx];

        UPDATE PRODUTOS SET status = st WHERE productid = p_id;
        GET DIAGNOSTICS updated_count = ROW_COUNT;

        IF updated_count = 0 THEN
        RAISE EXCEPTION 'Produto com id % não encontrado.', p_id;
        END IF;
    END LOOP;
    
END;
$$;


CALL batch_update_product_status(ARRAY[1,4], ARRAY['esgotado','desativado']);
CALL batch_update_product_status(ARRAY[2,999], ARRAY['desativado','disponivel']);
