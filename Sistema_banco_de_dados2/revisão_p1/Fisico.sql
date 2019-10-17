-- --------     << P1 >>     ------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 16/10/2019
-- Autor(es) ..............: Jobert Rogers
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdSistema
-- 
-- Data Ultima Alteracao ..: 16/10/2019
--   => Criacao de nova tabela
-- 
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 03 Usuarios
--         => 02 Visoes
-- 
-- -----------------------------------------------------------------


CREATE DATABASE IF NOT EXISTS bdSistema;
USE bdSistema;

CREATE TABLE PESSOA (
  nome varchar(50) NOT NULL,
  senha varchar(20) NOT NULL,
  matricula varchar(20) NOT NULL,
  CONSTRAINT PESSOA_PK PRIMARY KEY (matricula)
)ENGINE=InnoDB;

CREATE TABLE ADMINISTRADOR (
  bairro varchar(30) NOT NULL,
  rua varchar(30) NOT NULL,
  numero int(5) NOT NULL,
  telefone int(11) NOT NULL,
  matricula varchar(20) NOT NULL,
  CONSTRAINT ADMINISTRADOR_PK PRIMARY KEY (matricula),
  CONSTRAINT PESSOA_ADMINISTRADOR_FK FOREIGN KEY(matricula) REFERENCES PESSOA (matricula) 
  ON DELETE RESTRICT
  ON UPDATE RESTRICT
)ENGINE=InnoDB;

CREATE TABLE USUARIO (
  matricula varchar(20) NOT NULL,
  dataDeNascimento date NOT NULL,
  cpf varchar(15) NOT NULL,
  CONSTRAINT USUARIO_PK PRIMARY KEY (identificador),
  CONSTRAINT USUARIO_UK UNIQUE (cpf),
  CONSTRAINT PESSOA_USUARIO_FK FOREIGN KEY(matricula) REFERENCES PESSOA (matricula)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT
)ENGINE=InnoDB;

CREATE TABLE email (
  email varchar(30) NOT NULL,
  matricula varchar(20) NOT NULL,
  CONSTRAINT USUARIO_email_FK FOREIGN KEY(matricula) REFERENCES USUARIO (matricula)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT
)ENGINE=InnoDB;

CREATE TABLE atende (
  matriculaUsuario VARCHAR(20) NOT NULL,
  matriculaAdmin VARCHAR(20) NOT NULL,
  CONSTRAINT USUARIO_atende_FK FOREIGN KEY(matriculaUsuario) REFERENCES USUARIO (matricula)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT,
  CONSTRAINT ADMINISTRADOR_atende_FK FOREIGN KEY(matriculaAdmin) REFERENCES ADMINISTRADOR (matricula)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT
)ENGINE=InnoDB;

CREATE TABLE SERVICO (
  codigo int(3) NOT NULL,
  dataInicial date NOT NULL,
  preco float NOT NULL,
  matricula varchar(20) NOT NULL,
  CONSTRAINT SERVICO_PK PRIMARY KEY (codigo),
  CONSTRAINT USUARIO_SERVICO FOREIGN KEY(matricula) REFERENCES USUARIO (matricula)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT
)ENGINE=InnoDB;


CREATE TABLE DEPENDENTE (
  idDependente INT AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  sexo ENUM('M', 'F') NOT NULL,
  CONSTRAINT DEPENDENTE_PK PRIMARY KEY (idDependente)
)ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE contem (
  idDependente INT NOT NULL,
  matricula VARCHAR(20) NOT NULL,
  CONSTRAINT cotem_USUARIO_FK FOREIGN KEY (matricula) REFERENCES USUARIO (matricula)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT,
  CONSTRAINT cotem_USUARIO_FK FOREIGN KEY (idDependente) REFERENCES DEPENDENTE (idDependente)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT
)ENGINE=InnoDB;