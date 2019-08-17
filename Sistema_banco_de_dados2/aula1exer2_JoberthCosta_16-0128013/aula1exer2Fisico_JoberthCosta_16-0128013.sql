/*
-- --------            Aula 1 Exercício 2                       ------------       --
--                                                                   			   --
--                    SCRIPT DE CRIACAO (DDL)                        			   --
--                                                                   			   --
-- Data Criacao ..........: 15/08/2019                              			    --
-- Autor(es) .............: Jobert Rogers Tavares Costa                             --
--                          
-- Banco de Dados ........: MySQL                                   			    --
-- Base de Dados(nome) ...: aula1exer2                     							            --
--                                                                   			   --
-- Data Ultima Alteracao ..: 15/08/2019                                        			   --
--                                                                    			  --
-- PROJETO => 1 Base de Dados                                        			   --
--         => 6 Tabelas                                              			  --
--                                                                   			   --
-- -------------------------------------------------------------------------- --
*/

CREATE DATABASE IF NOT EXISTS aula1exer2;

USE aula1exer2;

CREATE TABLE EMPREGADO (
    rua VARCHAR(50) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    logradouro VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    matricula VARCHAR(15) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(50) NOT NULL,

    CONSTRAINT EMPREGADO_PK PRIMARY KEY (cpf),
    CONSTRAINT EMPREGADO_UK UNIQUE (matricula)
)ENGINE=InnoDB;

CREATE TABLE telefone (
    cpf VARCHAR(11) NOT NULL,
    telefone VARCHAR(14) NOT NULL,

    CONSTRAINT telefone_EMPREGADO_FK FOREIGN KEY (cpf) REFERENCES EMPREGADO (cpf)
)ENGINE=InnoDB;

CREATE TABLE GERENTE (
    formacao VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(50) NOT NULL,

    CONSTRAINT GERENTE_PK PRIMARY KEY (cpf)
)ENGINE=InnoDB;

CREATE TABLE PRODUTO (
    codigo INTEGER NOT NULL,
    preco FLOAT NOT NULL, 

    CONSTRAINT PRODUTO_PK PRIMARY KEY (codigo)
)ENGINE=InnoDB;

CREATE TABLE supervisiona (
    cpf_gerente VARCHAR(11) NOT NULL,
    cpf_empregado VARCHAR(11) NOT NULL,

    CONSTRAINT supervisiona_GERENTE FOREIGN KEY (cpf_gerente) REFERENCES GERENTE (cpf),
    CONSTRAINT supervisiona_EMPREGADO FOREIGN KEY (cpf_empregado) REFERENCES EMPREGADO (cpf)
)ENGINE=InnoDB;

CREATE TABLE vende (
    cpf VARCHAR(11) NOT NULL,
    codigo INTEGER NOT NULL,
    datavenda DATE NOT NULL,
    quantidade INTEGER NOT NULL,

    CONSTRAINT vende_PRODUTO FOREIGN KEY (codigo) REFERENCES PRODUTO (codigo),
    CONSTRAINT vende_EMPREGADO FOREIGN KEY (cpf) REFERENCES EMPREGADO (cpf)

)ENGINE=InnoDB;
