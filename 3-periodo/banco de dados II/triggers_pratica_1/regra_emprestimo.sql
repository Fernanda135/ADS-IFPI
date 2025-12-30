CREATE OR REPLACE FUNCTION regra_emprestimo()
RETURNS TRIGGER AS $$
DECLARE
    v_qtd INT;
BEGIN
    IF NEW.data_devolucao IS NOT NULL AND NEW.data_devolucao <= NEW.data_emprestimo THEN
        RAISE EXCEPTION 'data_devolucao (%) precisa ser posterior a data_emprestimo (%)',
        NEW.data_devolucao, NEW.data_emprestimo;
    END IF;

    UPDATE livros
    SET quantidade_disponivel = quantidade_disponivel - 1
    WHERE id = NEW.livro_id AND quantidade_disponivel > 0
    RETURNING quantidade_disponivel INTO v_qtd;


    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS regra_emprestimo_trigger ON emprestimos;

CREATE TRIGGER regra_emprestimo_trigger
BEFORE INSERT ON emprestimos
FOR EACH ROW
EXECUTE FUNCTION regra_emprestimo();
