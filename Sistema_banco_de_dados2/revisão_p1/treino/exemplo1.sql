

CREATE DATABASE IF NOT EXISTS exercicio1;
USE exercicio1;

CREATE TABLE GENERAL (
  id_geral INT AUTO_INCREMENT NOT NULL,
  id_nf INT NOT NULL,
  id_item INT NOT NULL,
  cod_produto INT NOT NULL,
  valor_unit FLOAT NOT NULL,
  quantidade INT NOT NULL,
  desconto INT,
  CONSTRAINT GENERAL_PK PRIMARY KEY (id_geral)
)ENGINE=INNODB;

INSERT INTO GENERAL (id_nf, id_item, cod_produto, valor_unit, quantidade, desconto)
                            VALUES (1,1,1,25.00,10,5),
                            (1,2,2,13.50,3,NULL),
                            (1,3,3,15.00,2,NULL),
                            (1,4,4,10.00,1,NULL),
                            (1,1,5,30.00,1,NULL),

                            (2,1,3,15.00,4,NULL),
                            (2,2,4,10.00,5,NULL),
                            (2,3,5,30.00,7,NULL),

                            (3,1,1,25.00,5,NULL),
                            (3,2,4,10.00,4,NULL),
                            (3,3,5,30.00,5,NULL),
                            (3,3,2,13.50,7,NULL),

                            (4,1,5,30.00,10,15),
                            (4,2,4,10.00,12,5),
                            (4,3,1,25.00,13,5),
                            (4,3,2,13.50,15,5),

                            (5,1,3,15.00,3,NULL),
                            (5,2,5,30.00,6,NULL),

                            (6,1,1,25.00,22,15),
                            (6,2,3,15.00,25,20),

                            (7,1,1,25.00,10,3),
                            (7,2,2,13.50,10,4),
                            (7,3,3,15.00,10,4),
                            (7,4,5,30.00,10,1);


SELECT id_nf, id_item, cod_produto, valor_unit
FROM GENERAL
WHERE desconto IS NULL;

SELECT id_nf, id_item, cod_produto, valor_unit, (valor_unit * (desconto/100)) AS "valor_vendido"
FROM GENERAL
WHERE desconto IS NOT NULL;

UPDATE GENERAL
SET desconto = 0
WHERE desconto IS NULL;

SELECT id_nf, id_item, cod_produto, valor_unit, (quantidade * valor_unit) AS 'valor_total',desconto, (valor_unit - (valor_unit*(desconto/100))) AS "valor_vendido"
FROM GENERAL;

SELECT id_nf, (SUM(quantidade * valor_unit)) AS "valor_total", SUM(valor_unit - (valor_unit * (desconto / 100)))
FROM GENERAL
GROUP BY id_nf;

SELECT MAX((SELECT COUNT(*) AS 'quantidade' FROM GENERAL
GROUP BY cod_produto))
FROM
GENERAL;

SELECT  t2.cod_produto, t2.quantidade AS quantidade
    FROM (
      SELECT cod_produto, COUNT(*) AS 'quantidade' FROM GENERAL
      GROUP BY cod_produto
    )t2;

SELECT id_nf, cod_produto, SUM(quantidade) AS 'quantidade_total'
FROM GENERAL
GROUP BY id_nf, cod_produto
WHERE quantidade_total > 10;

SELECT  t2.id_nf, t2.valor_total
    FROM (
      SELECT id_nf, SUM(quantidade * valor_unit) AS "valor_total"
      FROM GENERAL
      GROUP BY id_nf
    )t2
WHERE t2.valor_total > 500;


SELECT cod_produto, AVG(desconto) AS media
FROM GENERAL
GROUP BY cod_produto;

SELECT cod_produto, MIN(desconto), MAX(desconto),AVG(desconto) AS media
FROM GENERAL
GROUP BY cod_produto;

SELECT t.id_nf, COUNT(t.cod_produto)
FROM (
    SELECT id_nf, cod_produto
  FROM GENERAL
   GROUP BY cod_produto, id_nf
)t
GROUP BY t.id_nf;

SELECT * FROM GENERAL;