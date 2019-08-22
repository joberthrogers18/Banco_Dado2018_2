/*-- --------            Aula 1 Exercício 2 Evolução 3                    ------------    --
--                                                                   			   --
--                    SCRIPT DE POPULA (DML)                        			    --
--                                                                   			   --
-- Data Criacao ..........: 22/08/2019                              			    --
-- Autor(es) .............: Jobert Rogers Tavares Costa                              --
-- Banco de Dados ........: MySQL                                   			    --
-- Base de Dados(nome) ...: aula1exer2Evolucao3                     							            --
--                                                                   			   --
-- Data Ultima Alteracao ..: 22/08/2019                                        			   --
--                                                                    			  --
-- PROJETO => 1 Base de Dados                                        			   --
--         => 9 Tabelas                                              			  --
--                                                                   			   --
-- -------------------------------------------------------------------------- --
*/

USE aula1exer2Evolucao3;

INSERT INTO PESSOA VALUES 
    (87926327000, 'UKgXbOCGRk', 'Gael Hugo Nunes'),
    (47537145008, 'UKgXbOCGRk', 'Caroline Manuela'),
    (97404073316, 'cbW3dx8KGW', 'Hugo Giovanni Matheus Lima'),
    (59278084921, 'kr93az5NR2', 'Alana Aline'),
    (95366953243, 'UKgXbOCGRk', 'Benício Cláudio Bento Rezende'),
    (80106842102, 'kr93az5NR2', 'Elaine Teresinha Brenda Rezende');

INSERT INTO EMPREGADO VALUES 
    ('Rua da Misericordia', '72015570', 'Setor de chacaras', 'Taguatinga sul', '160128013', 87926327000),
    ('Rua da Concordia', '63015570', 'Setor Residencial', 'Samambaia sul', '150573613', 47537145008 ),
    ('Rua daos Pinhais', '72012340', 'Condominio Irado', 'Gama Sul', '172356891', 97404073316);

INSERT INTO telefone VALUES 
    ( '160128013', '35624748' ),
    ( '160128013', '84028922' ),
    ( '150573613', '33598236' ),
    ( '172356891', '86012271' ),
    ( '172356891', '95843459' );

INSERT INTO GERENTE VALUES 
    ( 97404073316, 'médio', 'louise98@vogados.com' ),
    ( 59278084921, 'primário', 'daniela@marine.com.br'  ),
    ( 80106842102, 'superior', 'castro-86@jetstar.com.br'  );

INSERT INTO AREA VALUES
    ( 1, 'esportes', 97404073316),
    ( 2, 'Eletrodomestricos', 59278084921),
    ( 3, 'Briquedos', 80106842102);

INSERT INTO PRODUTO VALUES
    ( 12345, 25.3, 1 ),
    ( 54321, 65.2, 2 ),
    ( 15935, 9.9, 3 ),
    ( 35789, 300.00, 1 ),
    ( 36952, 82.1, 2 );

INSERT INTO VENDA VALUES
    ( 1, '2005-07-17'),
    ( 2,'2019-03-16'),
    ( 3, '2015-06-07'),
    ( 4, '2017-06-07'),
    ( 5, '2015-06-07');

INSERT INTO realiza VALUES
    ( '160128013', 87926327000, 1),
    ( '150573613',  47537145008, 2),
    ( '172356891',  97404073316, 3),
    ( '160128013', 87926327000, 4),
    ( '160128013', 87926327000, 5);

INSERT INTO contem VALUES
    ( 12345, 1,  1 ),
    ( 54321, 2, 15 ),
    ( 54321, 5, 55 ),
    ( 15935, 3, 32 ),
    ( 35789, 2, 17 ),
    ( 36952, 2, 82 );


