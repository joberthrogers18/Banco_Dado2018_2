
-- --------     << Aula 4 exercício 1 >>     -----------
-- 
--                    SCRIPT DE CONSULTAS (DML)
-- 
-- Data Criacao ...........: 04/09/2019
-- Autor(es) ..............: Joberth Rogers Tavares Costa
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4extra1
-- 
-- Data Ultima Alteracao ..: 04/09/2019
--   => Desenvolvendo o script de consulta
-- 
-- PROJETO => 01 Base de Dados
--         => 2 Tabelas
-- 
-- -----------------------------------------------------------------

USE aula4extra1;

INSERT INTO ESTADO (sigla, nome) VALUES ('DF', 'Distrito Federal');
INSERT INTO ESTADO (sigla, nome) VALUES ('MG', 'Minas Gerais');
INSERT INTO ESTADO (sigla, nome) VALUES ('RJ', 'Rio de Janeiro');
INSERT INTO ESTADO (sigla, nome) VALUES ('GO', 'Goiais');
INSERT INTO ESTADO (sigla, nome) VALUES ('SP', 'São Paulo');
INSERT INTO ESTADO (sigla, nome) VALUES ('MA', 'Marenhão'); 
 

INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (1234, 'Taboquinha', 'TA', 1000, 'GO');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (3215, 'Goiania', 'GN', 500, 'GO');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (15923, 'TaguaDisney', 'TD', 700, 'DF');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (12336, 'CeiLondres', 'CL', 600, 'DF');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (45624, 'Copacabana', 'CP', 4863, 'RJ');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (02315, 'Leblon', 'LB', 1599, 'RJ');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (23456, 'Patos de Minas', 'PM', 500, 'MG');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (98765, 'Ouro Preto', 'OP', 750, 'MG');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (35624, 'Riberão Preto', 'RP', 5560, 'SP');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (86574, 'Campos do Jordão', 'CJ', 4456, 'SP');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (36241, 'Santos', 'ST', 1234, 'SP');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (13561, 'São Luis', 'SL', 1458, 'MA');
INSERT INTO CIDADE (codigo, nome, sigla, habitantes, sigla_estado) VALUES (74862, 'Barreiras', 'BR', 1111, 'MA');