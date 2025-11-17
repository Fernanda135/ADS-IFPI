CREATE OR REPLACE FUNCTION gerar_codigo_produto_abreviado(
    nome_p VARCHAR
)
RETURNS VARCHAR AS $$
DECLARE
    codigo VARCHAR;
BEGIN

    codigo := REPLACE(UPPER(nome_p), ' ', '-');

    IF LENGTH(codigo) > 15 THEN
        codigo := SUBSTRING(codigo, 1, 15);
    END IF;

    RETURN codigo;

END;
$$ LANGUAGE plpgsql;



SELECT gerar_codigo_produto_abreviado('Notebook Gamer');
SELECT gerar_codigo_produto_abreviado('Monitor UltraWide');
SELECT gerar_codigo_produto_abreviado('Mouse Sem Fio');