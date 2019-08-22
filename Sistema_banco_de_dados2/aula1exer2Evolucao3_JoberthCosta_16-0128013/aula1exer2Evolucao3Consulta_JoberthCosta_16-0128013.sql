-- --------     << Aula 1 Exercício 2 Evolução 3 >>     ------------
-- 
--                    SCRIPT DE CONSULTAS (DML)
-- 
-- Data Criacao ...........: 23/08/2019
-- Autor(es) ..............: Joberth Rogers Tavares Costa
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula1exer2Evolucao3
-- 
-- Data Ultima Alteracao ..: 23/08/2019
--   => Desenvolvendo o script de consulta
-- 
-- PROJETO => 01 Base de Dados
--         => 9 Tabelas
-- 
-- -----------------------------------------------------------------

USE aula1exer2Evolucao3;

/* A) Consultar todas as vendas feitas por um empregado específico definido pela sua chave primária na pesquisa;*/

SELECT e.matricula, e.cpf, v.idVenda AS `Id da venda`, v.dataVenda AS `Data da venda`
FROM EMPREGADO e
INNER JOIN realiza r ON (e.matricula = r.matricula)
INNER JOIN VENDA v ON (r.idVenda = v.idVenda)
WHERE e.matricula = '160128013';

/* B)	Relacionar todos os dados de uma venda com todas as informações dos produtos comercializados por esta venda específica; */

SELECT v.idVenda AS `Id da venda`, v.dataVenda `Data da venda`, p.codigo, c.quantidade, p.precoUnitario AS `Preço unitário`
FROM VENDA v
INNER JOIN contem c ON ( v.idVenda = c.idVenda )
INNER JOIN PRODUTO p ON ( c.codigo = p.codigo )
WHERE v.idVenda = 2;

/* C)	Mostrar todos os empregados da empresa que não sejam gerentes em ordem alfabética crescente; */

SELECT p.nome, e.matricula, e.cpf, e.rua, e.cep, e.bairro, e.logradouro
FROM EMPREGADO e
JOIN PESSOA p ON (e.cpf = p.cpf)
WHERE e.cpf NOT IN (
        SELECT cpf
        FROM GERENTE
      )
ORDER BY p.nome ASC;

/* D)	Consultar e mostrar a quantidade de CADA produto que foi vendido por esta empresa. */


SELECT codigo, SUM(quantidade) AS Quantidade
FROM contem
GROUP BY codigo;