/*-- --------            << P1 correção >>            ------------ --
--                                                                   --
--                    SCRIPT DE POPULA (DML)                        --
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

USE correcaoP1;

INSERT INTO REGIAO (idRegiao, nomeRegiao, tamanhoRegiao) VALUES (51, 'Vale do silicio', 23.5), (52,'ponte alta', 100.5);
INSERT INTO SUPERVISOR (matricula, nomeCompleto, sexo, dataNascimento) VALUES ('111113', 'Andre da Silva Goncalves', 'M', '1998-06-05'),('153205', 'Ana Carla dos Santos', 'F', '1975-10-05');
INSERT INTO PLANTONISTA (cpf, matricula, nomeCompleto,sexo, dataNascimento, matriculaSupervisor) VALUES ('14924293334', '12345678', 'Carlos dos Santos Cunha','M', '1976-01-03', '153205'), ('06577058105', '87456321', 'Andreia lara da Silva', 'F', '1996-12-05', '111113');
INSERT INTO HABILIDADE (idHabilidade, nomeHabilidade) VALUES (1, 'Cabeamento'), (2,'Estruturação');
INSERT INTO trabalha (idRegiao, matricula, dataPlantao) VALUES (51,'12345678', '2018-06-01'),(52,'87456321', '2018-01-02');
INSERT INTO possui (matricula, idHabilidade) VALUES ('12345678',1), ('87456321',2);
