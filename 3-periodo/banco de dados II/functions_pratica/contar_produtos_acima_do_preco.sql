CREATE OR REPLACE FUNCTION contar_produtos_acima_do_preco(
    valor DECIMAL(10, 2)
)
RETURNS INT AS $$
DECLARE
    qtd_p_total INT := 0;
BEGIN

    SELECT COUNT(id) INTO qtd_p_total FROM produtos WHERE preco_unitario > valor;

    RETURN qtd_p_total;

END;
$$ LANGUAGE plpgsql;



SELECT contar_produtos_acima_do_preco(1000.00);
SELECT contar_produtos_acima_do_preco(5000.00);
SELECT contar_produtos_acima_do_preco(100.00);