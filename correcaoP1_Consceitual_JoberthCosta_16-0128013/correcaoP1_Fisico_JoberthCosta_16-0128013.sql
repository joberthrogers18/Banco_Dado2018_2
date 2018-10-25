/*-- --------            << P1 correção >>            ------------ --
--                                                                   --
--                    SCRIPT DE CRIAÇÃO (DDL)                        --
--                                                                   --
-- Data Criacao ..........: 25/10/2018                              --
-- Autor(es) .............: Joberth Rogers Tavares Costa             --
-- Banco de Dados ........: MySQL                                   --
-- Base de Dados(nome) ...: correcaoP1                            --
--                                                                   --
--                                                                   --
-- PROJETO => 1 base de dados                                             --
--            6 tabelas                                                       --
-- -----------------------------------------------------------------
*/
﻿/*-- --------            << P1 correção >>            ------------ --
--                                                                   --
--                    SCRIPT DE CRIACAO (DDL)                        --
--                                                                   --
-- Data Criacao ..........: 25/10/2018                              --
-- Autor(es) .............: Joberth Rogers Tavares Costa             --
-- Banco de Dados ........: MySQL                                   --
-- Base de Dados(nome) ...: correcaoP1                            --
--                                                                   --
--                                                                   --
-- PROJETO => 1 base de dados                                             --
--            6 tabelas                                                       --
-- -----------------------------------------------------------------
*/

CREATE DATABASE IF NOT EXISTS correcaoP1;

USE correcaoP1;


CREATE TABLE REGIAO (
    idRegiao INTEGER AUTO_INCREMENT,
    nomeRegiao VARCHAR(50) NOT NULL,
    tamanhoRegiao FLOAT,
    CONSTRAINT REGIAO_PK PRIMARY KEY (idRegiao)
);

CREATE TABLE SUPERVISOR (
    matricula VARCHAR(20) NOT NULL,
    nomeCompleto VARCHAR(80) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    dataNascimento DATE NOT NULL,
    CONSTRAINT SUPERVISOR_PK PRIMARY KEY (matricula)
);

CREATE TABLE PLANTONISTA (
    cpf VARCHAR(11) NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    nomeCompleto VARCHAR(80) NOT NULL,
    sexo enum('M', 'F') NOT NULL,
    dataNascimento DATE NOT NULL,
    matriculaSupervisor VARCHAR (20),
    CONSTRAINT PLANTONISTA_UK UNIQUE (cpf),
    CONSTRAINT PLANTONISTA_PK PRIMARY KEY (matricula),
    CONSTRAINT PLANTONISTA_SUPERVISOR_FK FOREIGN KEY (matriculaSupervisor) REFERENCES SUPERVISOR(matricula)
);

CREATE TABLE HABILIDADE (
    idHabilidade INTEGER AUTO_INCREMENT,
    nomeHabilidade VARCHAR(80) NOT NULL,
    CONSTRAINT HABILIDADE_PK PRIMARY KEY (idHabilidade)
);

CREATE TABLE trabalha (
    idRegiao INTEGER NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    dataPlantao DATE NOT NULL,
    CONSTRAINT trabalha_REGIAO_FK FOREIGN KEY (idRegiao) REFERENCES REGIAO(idRegiao),
    CONSTRAINT trabalha_PLANTONISTA FOREIGN KEY (matricula) REFERENCES PLANTONISTA(matricula)
);

CREATE TABLE possui (
    matricula VARCHAR(20) NOT NULL,
    idHabilidade INTEGER NOT NULL,
    CONSTRAINT possui_PLANTONISTA_FK FOREIGN KEY (matricula) REFERENCES PLANTONISTA(matricula),
    CONSTRAINT possui_HABILIDADE_FK FOREIGN KEY (idHabilidade) REFERENCES HABILIDADE(idHabilidade)
);
 