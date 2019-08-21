/*
-- --------            Aula 1 Exercício 2  Evolução 2                      ------------       --
--                                                                   			   --
--                    SCRIPT DE CRIACAO (DDL)                        			   --
--                                                                   			   --
-- Data Criacao ..........: 20/08/2019                              			    --
-- Autor(es) .............: Jobert Rogers Tavares Costa                             --
--                          
-- Banco de Dados ........: MySQL                                   			    --
-- Base de Dados(nome) ...: aula1exer2Evolucao2                     							            --
--                                                                   			   --
-- Data Ultima Alteracao ..: 20/08/2019                                        			   --
--                                                                    			  --
-- PROJETO => 1 Base de Dados                                        			   --
--         => 9 Tabelas                                              			  --
--                                                                   			   --
-- -------------------------------------------------------------------------- --
*/

CREATE DATABASE IF NOT EXISTS aula1exer2Evolucao2;

USE aula1exer2Evolucao2;

CREATE TABLE PESSOA (
    cpf BIGINT,
    senha VARCHAR(50) NOT NULL,
    nome VARCHAR(100) NOT NULL,

    CONSTRAINT PESSOA PRIMARY KEY (cpf)
)ENGINE=InnoDB;

CREATE TABLE EMPREGADO (
    rua VARCHAR(100) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    matricula VARCHAR(30) NOT NULL,
    cpf BIGINT NOT NULL,

    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matricula),
    CONSTRAINT EMPREGADO_UK UNIQUE (cpf),
    CONSTRAINT EMPREGADO_PESSOA_FK FOREIGN KEY (cpf) REFERENCES PESSOA (cpf) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE GERENTE (
    cpf BIGINT NOT NULL,
    formacao VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,

    CONSTRAINT GERENTE_PK PRIMARY KEY (cpf),
    CONSTRAINT GERENTE_PESSOA_FK FOREIGN KEY (cpf) REFERENCES PESSOA (cpf) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE AREA (
    idArea BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf BIGINT NOT NULL,

    CONSTRAINT AREA_PK PRIMARY KEY (idArea),
    CONSTRAINT AREA_GERENTE FOREIGN KEY (cpf) REFERENCES GERENTE (cpf) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE PRODUTO (
    codigo BIGINT AUTO_INCREMENT,
    precoUnitario FLOAT NOT NULL,
    idArea BIGINT NOT NULL,

    CONSTRAINT PRODUTO_PK PRIMARY KEY (codigo),
    CONSTRAINT PRODUTO_AREA_FK FOREIGN KEY (idArea) REFERENCES AREA (idArea) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE VENDA (
    idVenda BIGINT AUTO_INCREMENT,
    dataVenda  DATE NOT NULL,

    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda)
)ENGINE=InnoDB;

CREATE TABLE telefone (
    matricula VARCHAR(30) NOT NULL,
    telefone VARCHAR(30)  NOT NULL,

    CONSTRAINT telefone_FK FOREIGN KEY (matricula) REFERENCES EMPREGADO (matricula) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE realiza (
    matricula VARCHAR(30) NOT NULL,
    cpf BIGINT NOT NULL,
    idVenda BIGINT NOT NULL,

    CONSTRAINT realiza_EMPREGADO_FK FOREIGN KEY (matricula) REFERENCES EMPREGADO (matricula) ON DELETE CASCADE,
    CONSTRAINT realiza_EMPREGADO_FK2 FOREIGN KEY (cpf) REFERENCES EMPREGADO (cpf) ON DELETE CASCADE,
    CONSTRAINT realiza_VENDA_FK FOREIGN KEY (idVenda) REFERENCES VENDA (idVenda) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE contem (
    codigo BIGINT,
    idVenda BIGINT,
    quantidade INT,

    CONSTRAINT contem_PRODUTO FOREIGN KEY (codigo) REFERENCES PRODUTO (codigo) ON DELETE CASCADE,
    CONSTRAINT contem_VENDA FOREIGN KEY (idVenda) REFERENCES VENDA (idVenda) ON DELETE CASCADE
)ENGINE=InnoDB;