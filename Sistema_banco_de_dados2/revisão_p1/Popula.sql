-- --------     << P1 >>     ------------
-- 
--                    SCRIPT DE POPULA (DDL)
-- 
-- Data Criacao ...........: 16/10/2019
-- Autor(es) ..............: Jobert Rogers
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdSistema
-- 
-- Data Ultima Alteracao ..: 16/10/2019
--   => Criacao de script de popula
-- 
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 03 Usuarios
--         => 02 Visoes
-- 
-- -----------------------------------------------------------------

USE bdSistema;

INSERT INTO PESSOA (nome, senha, matricula) VALUES('Vitor', 'j12345', '123456'),
                                            ('Karen', 'a789456', '654321'),
                                            ('Maria', 'v223344', '159236'),
                                            ('Alonso', 'b159357', '147258'),
                                            ('Irineu', 's852369', '147853'),
                                            ('Maluna', 'x741258', '356125');

INSERT INTO ADMINISTRADOR (bairro, rua, numero, telefone, matricula) VALUES('cabral', 'Peixada', 13, 82756899, '123456'),
                                                                    ('Vila Lobos', 'Augusta', 11, 96840965, '654321'),
                                                                    ('Rios de souza', 'Palmares', 23, 96840965, '159236'),;

INSERT INTO USUARIO ( dataDeNascimento, cpf, matricula) VALUES("1996-02-02", '04974498118', '147258'),
                                                                 ("1996-03-02", '04978789822', '147853'),
                                                                 ("1995-02-02", '04978789333', '356125');

INSERT INTO email (email, matricula) VALUES('vitor@hotmail.com', '147258'),
                                          ('karen@gmail.com', '147853'),
                                          ('teste@gmail.com', '356125');

INSERT INTO atende (matriculaUsuario, matriculaAdmin) VALUES('147258', '123456'),
                                                            ('147853', '654321'),
                                                            ('356125', '159236');

INSERT INTO SERVICO (codigo, dataInicial,preco, matricula) VALUES(115, "2015-03-11", 1200.30, '147258'),
                                                                    (123, "2016-03-11", 120.30,'147853' ),
                                                                    ( 134, "2017-03-11", 500.30, '356125');

INSERT INTO DEPENDENTE (nome, sexo) VALUES ('Alana do Santos', 'F'),
                                          ('Carla Alonso', 'F'),
                                          ('Marco Silva', 'M');

INSERT INTO contem (idDependente, matricula) VALUES (1, '147258'),
                                                    (2, '147853'),
                                                    (3, '356125');