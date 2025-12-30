CREATE OR REPLACE PROCEDURE add_new_product(
	IN p_name text,
	IN p_category text,
	IN p_price numeric)
LANGUAGE plpgsql
AS $$
    DECLARE
    prod_exis BOOLEAN;
    BEGIN

    SELECT EXISTS (SELECT 1 FROM PRODUTOS WHERE name = p_name) INTO prod_exis;

    IF prod_exis THEN
        RAISE NOTICE 'Produto % já existe!', p_name;
    ELSE
        INSERT INTO PRODUTOS (name, category, price)
        VALUES (p_name, p_category, p_price);
        RAISE NOTICE 'Produto % adicionado com sucesso!', p_name;
    END IF;
    

END;
$$;



CALL add_new_product('Livro A', 'Livros', 45.50);
CALL add_new_product('O Alquimista', 'Livros', 45.50);