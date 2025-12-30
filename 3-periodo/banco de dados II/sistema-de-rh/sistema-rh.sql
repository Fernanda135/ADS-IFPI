-- SISTEMA DE RH (FUNCIONÁRIOS)

CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(25) NOT NULL
);


CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(25) NOT NULL,
    departamento_id INT REFERENCES departamentos (id),
    salario NUMERIC(10,2) NOT NULL
);


CREATE TABLE auditoria_rh (
    id SERIAL PRIMARY KEY,
    func_id INTEGER NOT NULL,
    operacao VARCHAR(10) NOT NULL,
    antigo_nome VARCHAR(100),
    novo_nome VARCHAR(100),
    antigo_salario NUMERIC(10,2),
    novo_salario NUMERIC(10,2),
    antigo_departamento INTEGER,
    novo_departamento INTEGER,
    usuario VARCHAR(50) DEFAULT CURRENT_USER,
    data_hora TIMESTAMP DEFAULT NOW()
);





CREATE OR REPLACE FUNCTION auditar_rh()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO auditoria_rh (
        func_id, operacao, novo_nome, novo_salario, novo_departamento, usuario, data_hora
        ) VALUES (
        NEW.id, TG_OP, NEW.nome, NEW.salario, NEW.departamento_id, current_user, now()
        );
        RETURN NEW;


    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO auditoria_rh (
        func_id, operacao,
        antigo_nome, novo_nome,
        antigo_salario, novo_salario,
        antigo_departamento, novo_departamento,
        usuario, data_hora
        ) VALUES (
        NEW.id, TG_OP,
        OLD.nome, NEW.nome,
        OLD.salario, NEW.salario,
        OLD.departamento_id, NEW.departamento_id,
        current_user, now()
        );
        RETURN NEW;


    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO auditoria_rh (
        func_id, operacao, antigo_nome, antigo_salario, antigo_departamento, usuario, data_hora
        ) VALUES (
        OLD.id, TG_OP, OLD.nome, OLD.salario, OLD.departamento_id, current_user, now()
        );
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER auditoria_rh_trigger
AFTER INSERT OR UPDATE OR DELETE ON funcionarios
FOR EACH ROW
EXECUTE FUNCTION auditar_rh();




-- Ajusta o salario de um funcionário
CREATE OR REPLACE PROCEDURE ajustar_salario_funcionario(
    func_id INT,
    percentual NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    taxa NUMERIC;
    salario_antigo NUMERIC;
    salario_novo NUMERIC;
    nome_func VARCHAR(100);
BEGIN


    taxa := 1 + (percentual / 100.0);


    SELECT nome, salario
    INTO nome_func, salario_antigo
    FROM funcionarios
    WHERE id = func_id;


    UPDATE funcionarios
    SET salario = salario * taxa
    WHERE id = func_id;


    SELECT salario INTO salario_novo
    FROM funcionarios
    WHERE id = func_id;


    RAISE NOTICE 'Salario de % reajustado de % para: %.', nome_func, salario_antigo, salario_novo;


END;
$$;


-- Ajusta o salario de todos os funcionários de um departamento
CREATE OR REPLACE PROCEDURE ajustar_salario_departamento(
    dept_id INT,
    percentual NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    taxa NUMERIC;
    qtd INT;
    nome_dpt TEXT;
BEGIN


    taxa := 1 + (percentual / 100.0);


    SELECT nome INTO nome_dpt
    FROM departamentos
    WHERE id = dept_id;


    UPDATE funcionarios
    SET salario = salario * taxa
    WHERE departamento_id = dept_id;


    RAISE NOTICE 'Os funcionários do departamento % receberam % %% de ajuste no salario.', nome_dpt, percentual;


END;
$$;



-- Lista todos os funcionários de um departamento
CREATE OR REPLACE FUNCTION listar_departamento(
    nome_dept TEXT
)
RETURNS TABLE (
    id INT,
    nome VARCHAR(25),
    salario NUMERIC
) AS $$
BEGIN


    RETURN QUERY
    SELECT f.id, f.nome, f.salario
    FROM funcionarios f
    JOIN departamentos d ON d.id = f.departamento_id
    WHERE d.nome = nome_dept
    ORDER BY f.salario DESC;


END;
$$ LANGUAGE plpgsql;


-- Gera um tabela ordenando os funcionarios com salarios mais altos
CREATE OR REPLACE FUNCTION ranking_salarial()
RETURNS TABLE (
    nome VARCHAR(25),
    salario NUMERIC(10,2),
    departamento VARCHAR(25)
)
AS $$
BEGIN


    RETURN QUERY
    SELECT f.nome, f.salario, d.nome
    FROM funcionarios f
    JOIN departamentos d
    ON d.id = f.departamento_id
    ORDER BY f.salario DESC;


END;
$$ LANGUAGE plpgsql;





-- -- inserir departamentos
-- INSERT INTO departamentos (nome) VALUES ('Financeiro'), ('RH'), ('TI'), ('Marketing'), ('Jurídico');

-- -- inserir funcionários

-- -- Funcionários do departamento id = 1 -> Financeiro
-- INSERT INTO funcionarios (nome, departamento_id, salario) VALUES
-- ('Ana Souza', 1, 4500.00),
-- ('Carla Pereira', 1, 5200.00),
-- ('Reanata Lima', 1, 4800.00);

-- -- Funcionários do departamento id = 2 -> RH
-- INSERT INTO funcionarios (nome, departamento_id, salario) VALUES
-- ('João Almeida', 2, 4000.00),
-- ('Mariana Santos', 2, 4300.00),
-- ('Patrícia Gomes', 2, 4100.00);

-- -- Funcionários do departamento id = 3 -> TI 
-- INSERT INTO funcionarios (nome, departamento_id, salario) VALUES
-- ('João Souza', 3, 7500.00),
-- ('Lucas Luz', 3, 6800.00),
-- ('Sabrina Costa', 3, 7200.00);

-- -- Funcionários do departamento id = 4 -> Marketing
-- INSERT INTO funcionarios (nome, departamento_id, salario) VALUES
-- ('Aline Torres', 4, 3900.00),
-- ('Diego Martins', 4, 4200.00),
-- ('Gabriela Santos', 4, 4100.00);

-- -- Funcionários do departamento id = 5 -> Jurídico
-- INSERT INTO funcionarios (nome, departamento_id, salario) VALUES
-- ('Luiza Monteiro', 5, 6800.00),
-- ('Laura Barros', 5, 7100.00),
-- ('Vinícius Montes', 5, 6900.00);


-- SELECT * FROM funcionarios;
-- SELECT * FROM departamentos;


-- -- Gera uma linha com operacao = 'DELETE' na tabela auditoria_rh
-- DELETE FROM funcionarios
-- WHERE id = 15;


-- -- aumentar 10% do funcionário com id = 3
-- CALL ajustar_salario_funcionario(3, 10);

-- -- reduzir 5% do funcionário com id = 4
-- CALL ajustar_salario_funcionario(4, -5);


-- -- aplicar 8% para todos do departamento id = 1 -> Financeiro
-- CALL ajustar_salario_departamento(1, 8);

-- -- aplicar -2% (redução) para departamento id = 2 -> RH
-- CALL ajustar_salario_departamento(2, -2);


-- -- listar funcionários do departamento 'Financeiro'
-- SELECT * FROM listar_departamento('Financeiro');


-- -- obter ranking dos salarios mais altos
-- SELECT * FROM ranking_salarial();


-- -- consultar auditoria
-- SELECT * FROM auditoria_rh;
