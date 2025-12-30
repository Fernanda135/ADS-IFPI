CREATE OR REPLACE FUNCTION realizar_venda(
    p_id INTEGER,
    cli_id INTEGER,
    qtd INTEGER
)
RETURNS VOID 
LANGUAGE plpgsql
AS $$
DECLARE
    val_total DECIMAL(10, 2);
    -- prod_nome TEXT;
    -- novo_estoque INTEGER;
BEGIN

    val_total := qtd * (SELECT preco FROM produtos WHERE produtoid = p_id);

    UPDATE produtos
    SET estoque = estoque - qtd
    WHERE produtoid = p_id;

    -- prod_nome := SELECT nomeproduto FROM produtos WHERE produtoid = p_id;

    -- novo_estoque := SELECT estoque FROM produtos WHERE produtoid = p_id;

    INSERT INTO 
        vendas (produtoid, clienteid, datavenda, quantidade, valortotal)
    VALUES
        (p_id, cli_id, CURRENT_DATE, qtd, val_total);

    -- RAISE NOTICE 'Venda realizada com sucesso para o produto "%" (ID: %). Quantidade: %, Novo estoque: %.', prod_nome, prod_id, qtd, estoque;
    RAISE NOTICE 'Registro de venda adicionado á tebela Vendas';

END;
$$;


SELECT realizar_venda(3, 4, 2);