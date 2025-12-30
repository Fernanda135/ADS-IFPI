CREATE OR REPLACE FUNCTION inflacao(
    percentual INTEGER)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE 
    taxa DECIMAL;
BEGIN

    IF percentual < 100 AND percentual > 1 THEN

        taxa := 1 + percentual / 100.0;

        UPDATE produtos
        SET preco = preco * taxa;

        RAISE NOTICE 'Todos os preços foram reajustados em %%%.', percentual;

    ELSE
        RAISE NOTICE 'Valor da inflação inválido. O valor deve estar entre 2 e 99.';
    END IF;

END;
$$;


SELECT inflacao(120);