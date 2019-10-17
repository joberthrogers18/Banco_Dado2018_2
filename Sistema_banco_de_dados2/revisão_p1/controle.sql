-- --------     << P1 >>     ------------
-- 
--                    SCRIPT DE CONSULTA (DDL)
-- 
-- Data Criacao ...........: 16/10/2019
-- Autor(es) ..............: Jobert Rogers
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdSistema
-- 
-- Data Ultima Alteracao ..: 16/10/2019
--   => Criacao de script de consulta
-- 
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 02 Usuarios
--         => 02 Visoes
-- 
-- -----------------------------------------------------------------

CREATE USER 'admin' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES bdSistema.* TO 'admin';

CREATE USER 'user' IDENTIFIED BY 'user';
GRANT SELECT PRIVILEGES bdSistema.* TO 'user';