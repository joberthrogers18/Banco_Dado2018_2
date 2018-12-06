/*-- --------            Trabalho Final  - Tema 1            ------------     --
--                                                                   			   --
--                    SCRIPT DE CONSULTAS (DML)                        			  --
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
*/

USE tf1;

-- Select que mostra todos os funcionários de uma certa coopertativa 

SELECT f.nome 
AS 'Nome do Funcnionário', tel.telefone 
AS 'Telefone do funcionário', c.nome 
AS 'Nome da cooperativa'
FROM FUNCIONARIO f 
JOIN trabalha trab 
JOIN COOPERATIVA c 
JOIN telefone_f tel 
WHERE tel.cpf = f.cpf 
AND f.cpf = trab.cpf 
AND c.cnpj = trab.cnpj;

-- Mostra todos os plantões entre tecnicos e pacientes onde os pacientes tem complexidade alta 
-- No select é mostrado o no do paciente e do tecnico no plantão
-- hora e data que acotenceu o plantão e a complexidade do proprio paciente 
SELECT p.nome 
AS 'Nome do Paciente', p.complexidade 
AS 'Complexidade do paciente', f.nome  
AS 'Nome do Técnico', pa.horaPlantao
AS 'Hora do plantão', pa.dataPlantao
AS 'Data do Plantao'
FROM PACIENTE p 
JOIN FUNCIONARIO f 
JOIN PLANTAO_atende pa 
JOIN TECNICO t 
WHERE pa.coren = t.coren 
AND pa.corenUf = t.corenUf 
AND pa.cpf = t.cpf 
AND p.idPaciente = pa.idPaciente
AND f.cpf = t.cpf
AND p.complexidade = 'Alta';

-- View que mostra todas as consultas entre os dias 05/12/2017 e 12/07/2018
-- Os dados mostrados são data da consulta, nome do paciente, 
-- pressão arterial do paciente relatado na visita, nome do médico e a especialidade do médico que está visitando  

CREATE VIEW  CONSULTA_PACI_MEDICO (dataConsulta,nomeMedico, pressaoArterialPaciente, nomePaciente, especialidadeMedico) AS
SELECT  cv.dataConsulta , pa.nome ,pe.pressaoArterial, pr.nome,  e.tipoEspecialidade 
FROM PROFISSIONALSAUDE pr 
JOIN MEDICO m 
JOIN CONSULTA_visita cv 
JOIN PACIENTE pa 
JOIN PRESCRICAO pe 
JOIN ESPECIALIDADE e
WHERE pr.cpf = m.cpf 
AND e.idEspecialidade = m.idEspecialidade 
AND cv.cpf = pr.cpf 
AND cv.idPaciente = pa.idPaciente 
AND cv.idConsulta = pe.idConsulta 
AND cv.dataConsulta 
BETWEEN '2017-05-12' 
AND '2018-12-07';