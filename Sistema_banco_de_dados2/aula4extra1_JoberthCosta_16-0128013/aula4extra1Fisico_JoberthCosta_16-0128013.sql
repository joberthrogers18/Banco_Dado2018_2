/*
-- --------            Aula 4 exer 1                      ------------       --
--                                                                   			   --
--                    SCRIPT DE CRIACAO (DDL)                        			   --
--                                                                   			   --
-- Data Criacao ..........: 04/09/2019                              			    --
-- Autor(es) .............: Jobert Rogers Tavares Costa                             --
--                          
-- Banco de Dados ........: MySQL                                   			    --
-- Base de Dados(nome) ...: aula4extra1                     							            --
--        ..: Criando script de criação                                                           			   --
-- Data Ultima Alteracao ..: 04/09/2019                                        			   --
--                                                                    			  --
-- PROJETO => 1 Base de Dados                                        			   --
--         => 2 Tabelas                                              			  --
--                                                                   			   --
-- -------------------------------------------------------------------------- --
*/


CREATE DATABASE IF NOT EXISTS aula4extra1;
USE aula4extra1;

CREATE TABLE ESTADO (
    sigla VARCHAR(2) NOT NULL,
    nome VARCHAR(20) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT ESTADO_PK PRIMARY KEY (sigla)
)ENGINE= InnoDB;

CREATE TABLE CIDADE (
    codigo INTEGER NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sigla VARCHAR(2) NOT NULL,
    habitantes INTEGER NOT NULL,
    sigla_estado VARCHAR(2) NOT NULL,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT CIDADE_PK PRIMARY KEY (codigo),
    CONSTRAINT CIDADE_ESTADO_FK 
        FOREIGN KEY (sigla_estado) 
        REFERENCES ESTADO (sigla) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT CIDADE_nome_UK UNIQUE (nome),
    CONSTRAINT CIDADE_sigla_UK UNIQUE(sigla),
    CONSTRAINT CIDADE_CK CHECK (habitantes > 0)
) ENGINE= InnoDB;

