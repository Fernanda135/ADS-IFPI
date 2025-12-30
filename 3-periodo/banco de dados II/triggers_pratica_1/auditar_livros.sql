CREATE OR REPLACE FUNCTION auditar_livros()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'INSERT' THEN
        INSERT INTO log_livros (
            livro_id,
            operacao,
            detalhes_novos,
            usuario_operacao,
            data_hora_operacao
        ) VALUES (
            NEW.id,
            TG_OP,
            to_jsonb(NEW),
            CURRENT_USER,
            NOW()
        );
        RETURN NEW;

    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO log_livros (
            livro_id,
            operacao,
            detalhes_antigos,
            detalhes_novos,
            usuario_operacao,
            data_hora_operacao
        ) VALUES (
            OLD.id,
            TG_OP,
            to_jsonb(OLD),
            to_jsonb(NEW),
            CURRENT_USER,
            NOW()
        );
        RETURN NEW;
        
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO log_livros (
            livro_id,
            operacao,
            detalhes_antigos,
            usuario_operacao,
            data_hora_operacao
        ) VALUES (
            OLD.id,
            TG_OP,
            to_jsonb(OLD),
            CURRENT_USER,
            NOW()
        );
        RETURN OLD;
    
    END IF;


END;
$$ LANGUAGE plpgsql;



CREATE TRIGGER auditar_livros_trigger
AFTER INSERT OR UPDATE OR DELETE ON livros
FOR EACH ROW
EXECUTE FUNCTION auditar_livros();