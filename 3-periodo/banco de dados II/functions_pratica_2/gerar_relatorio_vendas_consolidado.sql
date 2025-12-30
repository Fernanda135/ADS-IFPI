CREATE OR REPLACE PROCEDURE gerar_relatorio_vendas_consolidado(
    
)
LANGUAGE plpgsql
AS $$
DECLARE
    cli RECORD;
    categ RECORD;
BEGIN

    RAISE NOTICE 'Gerando relatório consolidado de vendas por cliente e categoria...';
    RAISE NOTICE 'Relatório gerado:';
    RAISE NOTICE '';
    RAISE NOTICE '--- Detalhes do Relatório ---';

    FOR cli IN 
        SELECT c.clienteid, c.nomecliente 
        FROM clientes c
        JOIN vendas v ON c.clienteid = v.clienteid
        ORDER BY c.nomecliente 
    LOOP

        RAISE NOTICE 'Cliente: %', cli.nomecliente;

        FOR categ IN 
            SELECT 
                p.categoria,
                COUNT(*) as quantidade,
                SUM(v.valortotal) as valor_total
            FROM vendas v
            JOIN produtos p ON v.produtoid = p.produtoid
            WHERE v.clienteid = cli.clienteid
            GROUP BY p.categoria
            ORDER BY p.categoria
        LOOP

            RAISE NOTICE '- Categoria: % (Quant: %, Valor: %)', categ.categoria, categ.quantidade, categ.valor_total;

        END LOOP;

        RAISE NOTICE '';

    END LOOP;

    RAISE NOTICE 'Geração do relatório concluída.';

END;
$$;




CALL gerar_relatorio_vendas_consolidado();