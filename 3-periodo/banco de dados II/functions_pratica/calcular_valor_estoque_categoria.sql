CREATE OR REPLACE FUNCTION calcular_valor_estoque_categoria(
	p_categoria TEXT
)
RETURNS DECIMAL(10, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    val_total DECIMAL(10, 2) := 0.00;
BEGIN

    IF p_categoria = 'Computadores' THEN
        SELECT SUM(preco_unitario) 
        INTO val_total 
        FROM produtos 
        WHERE nome IN ('Notebook Gamer', 'Monitor UltraWide');

    ELSIF p_categoria = 'Periféricos' THEN
        SELECT SUM(preco_unitario) 
        INTO val_total
        FROM produtos
        WHERE nome IN ('Teclado Mecânico', 'Mouse Sem Fio', 'Webcam Full HD');
    END IF;

    IF val_total IS NULL THEN
        val_total := 0.00;
    END IF;

    RETURN val_total;
END;
$$;



SELECT calcular_valor_estoque_categoria('Computadores'); -- Deve retornar 6500.00
SELECT calcular_valor_estoque_categoria('Periféricos'); -- Deve retornar 670.00
SELECT calcular_valor_estoque_categoria('Celulares'); -- Deve retornar 00.00