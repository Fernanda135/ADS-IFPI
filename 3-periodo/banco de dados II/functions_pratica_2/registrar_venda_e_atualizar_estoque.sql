CREATE OR REPLACE FUNCTION calcular_valor_total(
    p_quantidade INT,
    p_preco NUMERIC
)
RETURNS DECIMAL(10, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    valor_transacao_total NUMERIC(10, 2);
BEGIN

    valor_transacao_total := p_preco * p_quantidade;

    
    RETURN valor_transacao_total;

END;
$$;




CREATE OR REPLACE PROCEDURE registrar_venda_e_atualizar_estoque(
    p_id INTEGER,
    c_id INTEGER,
    v_qtd INTEGER,
    v_data DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    valor_total DECIMAL(10, 2);
    p_preco DECIMAL(10, 2);
BEGIN

    SELECT preco INTO p_preco FROM produtos WHERE produtoid = p_id;

    valor_total := calcular_valor_total(v_qtd, p_preco);

    INSERT INTO
        vendas (produtoid, clienteid, datavenda, quantidade, valortotal)
    VALUES
        (p_id, c_id, v_data, v_qtd, valor_total);

    UPDATE produtos
    SET estoque = estoque - v_qtd
    WHERE produtoid = p_id;

    RAISE NOTICE 'Venda do produto realizada';


END;
$$;



CALL registrar_venda_e_atualizar_estoque(5, 2, 2, '2025-11-10');