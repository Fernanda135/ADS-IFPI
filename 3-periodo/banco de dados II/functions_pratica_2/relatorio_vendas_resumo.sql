CREATE OR REPLACE PROCEDURE relatorio_vendas_resumo(
    data_inicial DATE,
    data_final DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    info_rela RECORD;
BEGIN

    RAISE NOTICE '--- Relatório de Vendas Resumido (Período: % a %) ---', data_inicial, data_final;
    RAISE NOTICE '';

    FOR info_rela IN
        SELECT p.nomeproduto, SUM(v.quantidade) AS qtd, SUM(v.valortotal) as val_total
        FROM vendas v
        JOIN produtos p
        ON v.produtoid = p.produtoid
        WHERE datavenda BETWEEN data_inicial AND data_final
        GROUP BY p.nomeproduto
    LOOP

        RAISE NOTICE '- Produto: %. Unidades vendidas: %. Valor total arrecadado: R$%', info_rela.nomeproduto, info_rela.qtd, info_rela.val_total;

    END LOOP;

END;
$$;




CALL relatorio_vendas_resumo('2024-01-10', '2024-02-10');