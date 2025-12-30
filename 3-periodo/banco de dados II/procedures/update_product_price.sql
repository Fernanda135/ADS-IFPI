CREATE OR REPLACE PROCEDURE update_product_price(
    p_id INTEGER,
    p_new_price NUMERIC(10, 2)
) 
LANGUAGE plpgsql
AS $$
DECLARE
    prod_name TEXT;
    current_price NUMERIC(10, 2);
BEGIN

    SELECT name, price 
    INTO prod_name, current_price 
    FROM PRODUTOS 
    WHERE productId = p_id;

    IF NOT FOUND THEN
        RAISE NOTICE 'Produto com ID % não encontrado.', p_id;
    ELSE
        UPDATE PRODUTOS 
        SET price = p_new_price 
        WHERE productId = p_id;
        RAISE NOTICE 'Preço do produto % atualizado de R$ % para R$ %.', prod_name, current_price, p_new_price;
    END IF;
    
END;
$$;


CALL update_product_price(1, 2000);

SELECT * from produtos;
