-- CRIAÇÃO DE TABELAS
CREATE TABLE Departamentos (
                departamento_id INTEGER NOT NULL,
                area VARCHAR(100) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                descricao VARCHAR(255) NOT NULL,
                CONSTRAINT departamentos_pk PRIMARY KEY (departamento_id)
);
COMMENT ON TABLE Departamentos IS 'Tabela que armazena informações sobre os departamentos';


CREATE TABLE Grupos (
                grupo_id INTEGER NOT NULL,
                nome VARCHAR(255) NOT NULL,
                descricao VARCHAR(255) NOT NULL,
                data_criacao DATE NOT NULL,
                quantidade_membros INTEGER NOT NULL,
                assunto VARCHAR(255) NOT NULL,
                CONSTRAINT grupos_pk PRIMARY KEY (grupo_id)
);
COMMENT ON TABLE Grupos IS 'Tabela que armazena informações sobre os grupos';


CREATE TABLE Talentos (
                talento_id INTEGER NOT NULL,
                nome VARCHAR(255) NOT NULL,
                area VARCHAR(100) NOT NULL,
                CONSTRAINT talentos_pk PRIMARY KEY (talento_id)
);
COMMENT ON TABLE Talentos IS 'Tabela que armazena informações sobre os talentos';


CREATE TABLE Funcionarios (
                funcionario_id INTEGER NOT NULL,
                nome VARCHAR(255) NOT NULL,
                cargo VARCHAR(255) NOT NULL,
                sexo VARCHAR(9) NOT NULL,
                departamento_id INTEGER NOT NULL,
                CONSTRAINT funcionarios_pk PRIMARY KEY (funcionario_id)
);
COMMENT ON TABLE Funcionarios IS 'Tabela que armazena dados sobre os funcionários';


CREATE TABLE Emails (
                funcionario_id INTEGER NOT NULL,
                cpf NUMERIC(11) NOT NULL,
                email1 VARCHAR(255) NOT NULL,
                email2 VARCHAR(255),
                email3 VARCHAR(255) NOT NULL,
                CONSTRAINT emails_pk PRIMARY KEY (funcionario_id)
);
COMMENT ON TABLE Emails IS 'Tabela que armazena os emails dos funcionarios';


CREATE TABLE Telefones (
                funcionario_id INTEGER NOT NULL,
                telefone1 VARCHAR(20) NOT NULL,
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20) NOT NULL,
                CONSTRAINT telefones_pk PRIMARY KEY (funcionario_id)
);
COMMENT ON TABLE Telefones IS 'Tabela que armazena os telefones dos funcionários';


CREATE TABLE Publicacoes (
                id_publicacao INTEGER NOT NULL,
                data DATE NOT NULL,
                funcionario_id INTEGER NOT NULL,
                descricao VARCHAR(255),
                CONSTRAINT publicacoes_pk PRIMARY KEY (id_publicacao)
);
COMMENT ON TABLE Publicacoes IS 'tabela que armazena informações sobre as publicações';


CREATE TABLE Amigos (
                id_amizade INTEGER NOT NULL,
                funcionario_id INTEGER NOT NULL,
                nivel VARCHAR(100) NOT NULL,
                ultima_interacao DATE,
                CONSTRAINT amigos_pk PRIMARY KEY (id_amizade)
);
COMMENT ON TABLE Amigos IS 'Tabela que armazena informaçoes sobre as amizades entre os funcionarios na plataforma';
COMMENT ON COLUMN Amigos.nivel IS 'Nivel de amizade, melhores amigos, etc';


CREATE TABLE Grupo_Funcionario (
                funcionario_id INTEGER NOT NULL,
                grupo_id INTEGER NOT NULL,
                funcao VARCHAR(100) NOT NULL,
                data_saida DATE,
                data_entrada DATE NOT NULL,
                CONSTRAINT grupo_funcion_rio_pk PRIMARY KEY (funcionario_id, grupo_id)
);
COMMENT ON TABLE Grupo_Funcionario IS 'Tabela que armazena as informações entre grupo e usuário';


CREATE TABLE Talento_Funcionario (
                funcionario_id INTEGER NOT NULL,
                talento_id INTEGER NOT NULL,
                nivel_proficiencia NUMERIC(20) NOT NULL,
                data_atribuicao DATE NOT NULL,
                CONSTRAINT talento_funcionario_pk PRIMARY KEY (funcionario_id, talento_id)
);
COMMENT ON TABLE Talento_Funcionario IS 'Tabela intermediaria entre talentos e funcionarios';
COMMENT ON COLUMN Talento_Funcionario.nivel_proficiencia IS 'nivel de proficiencia no talento';


CREATE TABLE Enderecos (
                funcionario_id INTEGER NOT NULL,
                CEP VARCHAR(9) NOT NULL,
                UF VARCHAR(2) NOT NULL,
                complemento VARCHAR(100) NOT NULL,
                logradouro VARCHAR(100) NOT NULL,
                numero INTEGER NOT NULL,
                Municipio VARCHAR(50) NOT NULL,
                bairro VARCHAR(50) NOT NULL,
                CONSTRAINT endere_os_pk PRIMARY KEY (funcionario_id, CEP)
);
COMMENT ON TABLE Enderecos IS 'Tabela que armazena os endereços dos funcionarios';

-- FKS
ALTER TABLE Funcionarios ADD CONSTRAINT departamentos_funcion_rios_fk
FOREIGN KEY (departamento_id)
REFERENCES Departamentos (departamento_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Grupo_Funcionario ADD CONSTRAINT grupos_grupo_funcionrio_fk
FOREIGN KEY (grupo_id)
REFERENCES Grupos (grupo_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Talento_Funcionario ADD CONSTRAINT talentos_talento_funcionrio_fk
FOREIGN KEY (talento_id)
REFERENCES Talentos (talento_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Enderecos ADD CONSTRAINT funcion_rios_endere_os_fk
FOREIGN KEY (funcionario_id)
REFERENCES Funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Talento_Funcionario ADD CONSTRAINT funcionarios_talento_funcionrio_fk
FOREIGN KEY (funcionario_id)
REFERENCES Funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Grupo_Funcionario ADD CONSTRAINT funcionarios_grupo_funcionrio_fk
FOREIGN KEY (funcionario_id)
REFERENCES Funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Amigos ADD CONSTRAINT funcionarios_amigos_fk
FOREIGN KEY (funcionario_id)
REFERENCES Funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Publicacoes ADD CONSTRAINT funcionarios_publicacoes_fk
FOREIGN KEY (funcionario_id)
REFERENCES Funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Telefones ADD CONSTRAINT funcionarios_telefones_fk
FOREIGN KEY (funcionario_id)
REFERENCES Funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Emails ADD CONSTRAINT funcionarios_emails_fk
FOREIGN KEY (funcionario_id)
REFERENCES Funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;