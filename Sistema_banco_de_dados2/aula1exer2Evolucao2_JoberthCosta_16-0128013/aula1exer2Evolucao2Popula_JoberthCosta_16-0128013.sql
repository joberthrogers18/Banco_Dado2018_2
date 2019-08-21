/*-- --------            Aula 1 Exercício 2 Evolução 2                    ------------    --
--                                                                   			   --
--                    SCRIPT DE POPULA (DML)                        			    --
--                                                                   			   --
-- Data Criacao ..........: 20/08/2019                              			    --
-- Autor(es) .............: Jobert Rogers Tavares Costa                              --
-- Banco de Dados ........: MySQL                                   			    --
-- Base de Dados(nome) ...: aula1exer2Evolucao2                     							            --
--                                                                   			   --
-- Data Ultima Alteracao ..: 20/08/2019                                        			   --
--                                                                    			  --
-- PROJETO => 1 Base de Dados                                        			   --
--         => 9 Tabelas                                              			  --
--                                                                   			   --
-- -------------------------------------------------------------------------- --
*/

USE aula1exer2Evolucao2;

INSERT INTO PESSOA VALUES (87926327000, 'UKgXbOCGRk', 'Gael Hugo Nunes');
INSERT INTO PESSOA VALUES (47537145008, 'UKgXbOCGRk', 'Caroline Manuela');
INSERT INTO PESSOA VALUES (97404073316, 'cbW3dx8KGW', 'Hugo Giovanni Matheus Lima');
INSERT INTO PESSOA VALUES (59278084921, 'kr93az5NR2', 'Alana Aline');
INSERT INTO PESSOA VALUES (95366953243, 'UKgXbOCGRk', 'Benício Cláudio Bento Rezende');
INSERT INTO PESSOA VALUES (80106842102, 'kr93az5NR2', 'Elaine Teresinha Brenda Rezende');

INSERT INTO EMPREGADO VALUES ('Rua da Misericordia', '72015570', 'Setor de chacaras', 'Taguatinga sul', '160128013', 87926327000);
INSERT INTO EMPREGADO VALUES ('Rua da Concordia', '63015570', 'Setor Residencial', 'Samambaia sul', '150573613', 47537145008 );
INSERT INTO EMPREGADO VALUES ('Rua daos Pinhais', '72012340', 'Condominio Irado', 'Gama Sul', '172356891', 97404073316);

INSERT INTO telefone VALUES ( '160128013', '35624748' );
INSERT INTO telefone VALUES ( '160128013', '84028922' );
INSERT INTO telefone VALUES ( '150573613', '33598236' );
INSERT INTO telefone VALUES ( '172356891', '86012271' );
INSERT INTO telefone VALUES ( '172356891', '95843459' );

INSERT INTO GERENTE VALUES ( 97404073316, 'médio', 'louise98@vogados.com' );
INSERT INTO GERENTE VALUES ( 59278084921, 'primário', 'daniela@marine.com.br'  );
INSERT INTO GERENTE VALUES ( 80106842102, 'superior', 'castro-86@jetstar.com.br'  );

INSERT INTO AREA VALUES ( 1, 'esportes', 97404073316);
INSERT INTO AREA VALUES ( 2, 'Eletrodomestricos', 59278084921);
INSERT INTO AREA VALUES ( 3, 'Briquedos', 80106842102);

INSERT INTO PRODUTO VALUES ( 12345, 25.3, 1 );
INSERT INTO PRODUTO VALUES ( 54321, 65.2, 2 );
INSERT INTO PRODUTO VALUES ( 15935, 9.9, 3 );
INSERT INTO PRODUTO VALUES ( 35789, 300.00, 1 );
INSERT INTO PRODUTO VALUES ( 36952, 82.1, 2 );

INSERT INTO VENDA VALUES ( 1, '2005-07-17');
INSERT INTO VENDA VALUES ( 2,'2019-03-16');
INSERT INTO VENDA VALUES ( 3, '2015-06-07');

INSERT INTO realiza VALUES ( '160128013', 87926327000, 1);
INSERT INTO realiza VALUES ( '150573613',  47537145008, 2);
INSERT INTO realiza VALUES ( '172356891',  97404073316, 3);

INSERT INTO contem VALUES ( 12345, 1,  1 );
INSERT INTO contem VALUES ( 54321, 2, 15 );
INSERT INTO contem VALUES (  15935, 3, 32 );



