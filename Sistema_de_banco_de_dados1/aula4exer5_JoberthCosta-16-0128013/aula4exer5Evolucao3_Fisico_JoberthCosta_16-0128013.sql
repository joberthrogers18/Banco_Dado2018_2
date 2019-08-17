/*
-- --------            << aula4exer5Evolucao3 >>        ------------ --
--                                                                   --
--                    SCRIPT Criação                                 --
--                                                                   --
-- Data Criacao ..........: 27/09/2018                               --
-- Autor(es) .............: Joberth Rogers Tavares Costa             --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: aula4exer5Evolucao3                      --
--                                                                   --
-- Data Ultima Alteracao ..: 27/09/2018                              --
--    + Criacao Base de Dados                                        --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 10 Tabelas                                             --
--                                                                   --
-- ----------------------------------------------------------------- --
 */

CREATE TABLE MEDICO (
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR (12) NOT NULL,
    PRIMARY KEY(crm)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PACIENTE (
    sexo VARCHAR (100) NOT NULL,
    idade INT(3) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    rua VARCHAR(20) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    PRIMARY KEY(cpf)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE CONSULTA_atende (
    idConsulta INT(10) NOT NULL AUTO_INCREMENT,
    crm VARCHAR(12) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    PRIMARY KEY(idConsulta)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE RECEITA (
    idReceita INT(10) NOT NULL AUTO_INCREMENT,
    dataEmissao DATE NOT NULL,
    idConsulta INT(10) NOT NULL,
    PRIMARY KEY(idReceita)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE MEDICAMENTO (
    nome VARCHAR(50) NOT NULL,
    dose FLOAT(5) NOT NULL,
    PRIMARY KEY(nome)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE ESPECIALIDADE (
    tipo VARCHAR(100),
    PRIMARY KEY(tipo)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE telefone (
    numero VARCHAR(12) NOT NULL,
    cpf VARCHAR(14) NOT NULL
)ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE contem (
    idReceita INT(10) NOT NULL,
    nome VARCHAR(50) NOT NULL
)ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE possui (
    tipo VARCHAR(100) NOT NULL,
    crm VARCHAR(12) NOT NULL
)ENGINE = InnoDB AUTO_INCREMENT = 1 ;

ALTER TABLE CONSULTA_atende ADD CONSTRAINT FK_CONSULTA_atende_1
    FOREIGN KEY (crm)
    REFERENCES MEDICO (crm);

ALTER TABLE CONSULTA_atende ADD CONSTRAINT FK_CONSULTA_atende_2
    FOREIGN KEY (cpf)
    REFERENCES PACIENTE (cpf);

ALTER TABLE RECEITA ADD CONSTRAINT FK_RECEITA_1
    FOREIGN KEY (idConsulta)
    REFERENCES CONSULTA_atende (idConsulta)
    ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE telefone ADD CONSTRAINT FK_telefone_0
    FOREIGN KEY (cpf)
    REFERENCES PACIENTE (cpf);

ALTER TABLE contem ADD CONSTRAINT FK_contem_0
    FOREIGN KEY (idReceita)
    REFERENCES RECEITA (idReceita)
    ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE contem ADD CONSTRAINT FK_contem_1
    FOREIGN KEY (nome)
    REFERENCES MEDICAMENTO (nome)
    ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE possui ADD CONSTRAINT FK_possui_0
    FOREIGN KEY (tipo)
    REFERENCES ESPECIALIDADE (tipo)
    ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (crm)
    REFERENCES MEDICO (crm)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
