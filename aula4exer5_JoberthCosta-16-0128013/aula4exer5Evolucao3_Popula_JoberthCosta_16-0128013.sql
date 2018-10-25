/*
-- --------            << aula4exer5Evolucao3 >>        ------------ --
--                                                                   --
--                    SCRIPT POPULAR                                 --
--                                                                   --
-- Data Criacao ..........: 27/09/2018                               --
-- Autor(es) .............: Joberth Rogers Tavares Costa            --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: aula4exer5Evolucao3                      --
--                                                                   --
-- Data Ultima Alteracao ..: 27/09/2018                              --
--    + Criacao Base de Dados                                        --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 10 Tabelas                                             --
--                                                                   --
-- ----------------------------------------------------------------- --
 */

INSERT INTO PACIENTE (cpf,nome,idade,sexo,cep,cidade,rua) VALUES ("06577058105","Eric",54,"Masculino","412408","Belfast","Ulster"),("44456402156","Vaughan",52,"Feminino","428301","Basildon","Essex"),("28353783420","Derek",27,"Masculino","9862","Nelson","SI");

INSERT INTO telefone (cpf, numero) VALUES ("06577058105","35624748"), ("44456402156","93150824"), ("28353783420","91058607");

INSERT INTO MEDICO (crm,nome) VALUES ("12345DF","Boris"),("1053RS","Amal"),("997GO","Veda");

INSERT INTO ESPECIALIDADE (tipo) VALUES ("Cardiologista"), ("Dermatologista"), ("Infectologista");

INSERT INTO possui (tipo, crm) VALUES ("Cardiologista", "12345DF"), ("Dermatologista", "1053RS"), ("Infectologista", "997GO");

INSERT INTO CONSULTA_atende (idConsulta, crm, cpf) VALUES (1, "12345DF", "06577058105"), (2, "1053RS", "44456402156"), (5,"997GO","28353783420");

INSERT INTO RECEITA (idReceita,dataEmissao,idConsulta) VALUES (2,"2018-7-04",2),(1,"2019-3-03",1),(7,"2018-7-05",5);

INSERT INTO MEDICAMENTO (nome, dose) VALUES ("Bactril",12.5), ("Amoxilina",25.3), ("Torcilax", 45.5);

INSERT INTO contem (idReceita, nome) VALUES (2, "Bactril"),(7,"Amoxilina"),(1, "Torcilax");
