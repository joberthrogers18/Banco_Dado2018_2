-- --------            Trabalho Final  - Tema 1            ------------       --
--                                                                   			   --
--                    SCRIPT DE C0NTROLE (DDL)                        			   --
--                                                                   			   --
-- Data Criacao ..........: 04/12/2018                              			    --
-- Autor(es) .............: Jobert Rogers Tavares Costa e Natalia Rodrigues   --
-- Banco de Dados ........: MySQL                                   			    --
-- Base de Dados(nome) ...: tf1                     							            --
--                                                                   			   --
-- Data Ultima Alteracao ..:                                         			   --
--                                                                    			  --
-- PROJETO => 1 Base de Dados                                        			   --
--         => 29 Tabelas                                              			  --
--                                                                   			   --
-- -------------------------------------------------------------------------- --

USE tf1;

CREATE USER IF NOT EXISTS 'admin1'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON tf1.* TO 'admin1'@'localhost';