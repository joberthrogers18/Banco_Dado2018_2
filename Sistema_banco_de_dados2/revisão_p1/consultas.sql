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
--         => 03 Usuarios
--         => 02 Visoes
-- 
-- -----------------------------------------------------------------

USE bdSistema;

-- View para ver todos os dependente de usuários que tem data de nascimento
-- maior que 1996-02-02, que agiliza o administrador ter que checar todos os dependentes
-- que pertencem a um usuário, evitando uma enorme consulta toda hora

CREATE VIEW USUARIO_DEPENDENTE_V AS
    SELECT p.nome, p.matricula, d.nome AS 'nome_dependente'
    FROM PESSOA p
    INNER JOIN USUARIO u ON u.matricula = p.matricula
    INNER JOIN contem c ON c.matricula = u.matricula
    INNER JOIN DEPENDENTE d ON d.idDependente = c.idDependente
    WHERE u.dataDeNascimento > '1996-02-02';

-- Como a estrutura com o tempo terá uma grande quantidade de dados
-- será necessário criar um indice para pesquisa de nome que ajudará
-- na tabela pessoa quando for recuperar algum dados referente a essa coluna
-- o indice criará uma nova tabela em disco que apontará para uma referência perto
-- ou mesmo a do próprio registro na tabela que estará ordenada 

CREATE INDEX USUARIO_SERVICO_IDX PESSOA(nome);

-- Consulta todos os serviços que o usuário Irineu contratou

SELECT u.matricula, p.nome, s.codigo AS 'codigo_servico', s.preco, s.dataInicial
    FROM USUARIO u
    INNER JOIN SERVICO s ON s.matricula = u.matricula
    INNER JOIN PESSOA p ON p.matricula = u.matricula
    WHERE p.name = 'Irineu';