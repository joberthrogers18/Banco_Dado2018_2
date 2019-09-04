/*
-- --------     << Aula 4 exercício 1 >>     ------------
-- 
--                    SCRIPT DE CONSULTAS (DML)
-- 
-- Data Criacao ...........: 04/09/2019
-- Autor(es) ..............: Joberth Rogers Tavares Costa
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4extra1
-- 
-- Data Ultima Alteracao ..: 04/09/2019
--   => Desenvolvendo o script de consulta
-- 
-- PROJETO => 01 Base de Dados
--         => 2 Tabelas
-- 
-- -----------------------------------------------------------------
*/

USE aula4extra1;

/* A) Projeção de sigla e nome do estado de sigla SP e DF; */

SELECT nome, sigla FROM ESTADO WHERE sigla = 'SP' OR sigla = 'DF';

/* B) Selecione somente o nome e a sigla das cidades que são dos estados RJ, DF e GO; */

SELECT c.nome, c.sigla 
	FROM CIDADE c
	INNER JOIN ESTADO e 
    ON e.sigla = c.sigla_estado
    WHERE e.sigla = 'DF' 
    OR e.sigla = 'RJ' 
    OR e.sigla = 'GO';
    
/*C) Selecione todas as cidades do primeiro estado que você cadastrou mostrando somente o nome da cidade, o nome do estado e sua sigla;*/
    
SELECT c.nome AS `Nome da cidade`, e.sigla AS `Sigla do estado`, e.nome AS `Nome do estado`
	FROM CIDADE c
    INNER JOIN (
		SELECT * 
        FROM ESTADO 
        ORDER BY data_criacao ASC
        LIMIT 1
    ) AS e ON e.sigla = c.sigla_estado;
    
/* D) Selecione somente o nome e a sigla do estado que você cadastrou por último e todas as cidades cadastradas nele, mostrando o seu nome e a quantidade de habitantes em ordem crescente de nome de estado e nome de cidade. */
    
SELECT c.nome AS `Nome da cidade`, 
	c.habitantes AS `Quantidade de habitantes`,
    e.sigla AS `Sigla do estado`,
    e.nome AS `Nome do estado`
	FROM CIDADE c
    INNER JOIN (
		SELECT * 
        FROM ESTADO 
        ORDER BY data_criacao DESC
        LIMIT 1
    ) AS e ON e.sigla = c.sigla_estado
	ORDER BY e.nome AND c.nome;
    
