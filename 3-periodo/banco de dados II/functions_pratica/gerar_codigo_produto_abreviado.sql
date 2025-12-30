CREATE OR REPLACE FUNCTION gerar_codigo_produto_abreviado(
	nome_p TEXT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    codigo VARCHAR;
BEGIN

    codigo := REPLACE(UPPER(nome_p), ' ', '-');

    IF LENGTH(codigo) > 15 THEN
        codigo := SUBSTRING(codigo, 1, 15);
    END IF;

    RETURN codigo;

END;
$$;


SELECT gerar_codigo_produto_abreviado('Notebook Gamer'); -- Deve retornar 'NOTEBOOK-GAMER'
SELECT gerar_codigo_produto_abreviado('Monitor UltraWide'); -- Deve retornar 'MONITOR-ULTRAWI' (abreviado para 15 caracteres)
SELECT gerar_codigo_produto_abreviado('Mouse Sem Fio'); -- Deve retornar 'MOUSE-SEM-FIO'