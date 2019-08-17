/*-- --------            Aula 1 Exercício 2                     ------------    --
--                                                                   			   --
--                    SCRIPT DE POPULA (DML)                        			    --
--                                                                   			   --
-- Data Criacao ..........: 16/08/2019                              			    --
-- Autor(es) .............: Jobert Rogers Tavares Costa                              --
-- Banco de Dados ........: MySQL                                   			    --
-- Base de Dados(nome) ...: aula1exer2                     							            --
--                                                                   			   --
-- Data Ultima Alteracao ..: 16/08/2019                                        			   --
--                                                                    			  --
-- PROJETO => 1 Base de Dados                                        			   --
--         => 6 Tabelas                                              			  --
--                                                                   			   --
-- -------------------------------------------------------------------------- --
*/

USE aula1exer2;

INSERT INTO EMPREGADO VALUES ('Rua da Misericordia', '72015570', 'Setor de chacaras', 'Taguatinga sul', '160128013', '06577058105', 'André Barros', 'j12345');
INSERT INTO EMPREGADO VALUES ('Rua da Concordia', '63015570', 'Setor Residencial', 'Samambaia sul', '150573613', '12345678910', 'Gabrielly Bruna Regina Melo', 'u8LMMP0aHu');
INSERT INTO EMPREGADO VALUES ('Rua daos Pinhais', '72012340', 'Condominio Irado', 'Gama Sul', '172356891', '01987654321', 'Renata Elisa Vera Silveira', 'npecJQCfmZ');
INSERT INTO EMPREGADO VALUES ('Rua da Serra Norte', '71234560', 'Praça da Serra', 'Planaltina', '579715362', '14924293334', 'Jorge Noah da Mota', 'qfs2pXlE9S');
INSERT INTO EMPREGADO VALUES ('Rua do Mississipi', '87654321', 'Setor de chacaras', 'Sobradinho', '783456913', '55037117003', 'Bento Gael Brito', 'GkwWf8fPD6');

INSERT INTO telefone VALUES ( '55037117003', '35624748' );
INSERT INTO telefone VALUES ( '06577058105', '84028922' );
INSERT INTO telefone VALUES ( '12345678910', '33598236' );
INSERT INTO telefone VALUES ( '01987654321', '86012271' );
INSERT INTO telefone VALUES ( '14924293334', '95843459' );

INSERT INTO GERENTE VALUES ( 'médio', 'louise98@vogados.com', '92540856004', 'Sabrina Sueli Corte Real',  'gTp2O0ceTd' );
INSERT INTO GERENTE VALUES ( 'primário', 'daniela@marine.com.br', '47143085057', 'Benjamin Erick Gonçalves',  'kRCqhcGDAM' );
INSERT INTO GERENTE VALUES ( 'superior', 'castro-86@jetstar.com.br', '97098702030', 'Tânia Emanuelly Mendes', 'hQPnJFfydc' );
INSERT INTO GERENTE VALUES ( 'superior', 'murilo.pires@seg.com.br', '68497929039', 'Calebe Severino Manoel da Cruz', 'A44OcslJdm' );
INSERT INTO GERENTE VALUES ( 'primário', 'yassis@damha.com.br', '61789704049', 'Louise Mirella Aragão',  '65bE3PKn3K' );

INSERT INTO PRODUTO VALUES ( 12345, 25.3 );
INSERT INTO PRODUTO VALUES ( 54321, 65.2 );
INSERT INTO PRODUTO VALUES ( 15935, 9.9 );
INSERT INTO PRODUTO VALUES ( 35789, 300.00 );
INSERT INTO PRODUTO VALUES ( 36952, 82.1 );

INSERT INTO supervisiona VALUES ( '92540856004', '06577058105' );
INSERT INTO supervisiona VALUES ( '47143085057', '12345678910' );
INSERT INTO supervisiona VALUES ( '97098702030', '01987654321' );
INSERT INTO supervisiona VALUES ( '97098702030', '14924293334' );
INSERT INTO supervisiona VALUES ( '92540856004', '55037117003' );

INSERT INTO vende VALUES ( '06577058105', 12345, '2005-07-17', 6 );
INSERT INTO vende VALUES ( '12345678910', 54321, '2019-03-16', 15 );
INSERT INTO vende VALUES ( '01987654321', 15935, '2015-06-07', 32 );
INSERT INTO vende VALUES ( '14924293334', 35789, '2009-01-03', 5 );
INSERT INTO vende VALUES ( '55037117003', 36952, '2018-03-03', 100 );



