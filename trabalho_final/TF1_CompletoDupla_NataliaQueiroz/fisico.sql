-- --------            Trabalho Final  - Tema 1            ------------       --
--                                                                   			   --
--                    SCRIPT DE CRIACAO (DDL)                        			   --
--                                                                   			   --
-- Data Criacao ..........: 04/12/2018                              			    --
-- Autor(es) .............: Jobert Rogers Tavares Costa e Natalia Rodrigues   --
--                          Lucas Martins	e Luciano
-- Banco de Dados ........: MySQL                                   			    --
-- Base de Dados(nome) ...: tf1                     							            --
--                                                                   			   --
-- Data Ultima Alteracao ..:                                         			   --
--                                                                    			  --
-- PROJETO => 1 Base de Dados                                        			   --
--         => 29 Tabelas                                              			  --
--                                                                   			   --
-- -------------------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS tf1

DEFAULT CHARACTER SET utf8

DEFAULT COLLATE utf8_general_ci;

USE tf1;

CREATE TABLE PACIENTE (
	idPaciente INT(11) AUTO_INCREMENT,--
    peso DECIMAL(5,2) NOT NULL, --
    altura DECIMAL(3,2) NOT NULL, --
    complexidade VARCHAR(20) NOT NULL, --
    nome VARCHAR(100) NOT NULL,--
    cpf CHAR(11),--
    dataNascimento DATE NOT NULL, --
    cep CHAR(8) NOT NULL, --
    logradouro VARCHAR(100) NOT NULL, --
    numero INT(10) NOT NULL, --
    rg VARCHAR(30),--

    CONSTRAINT PACIENTE_PK PRIMARY KEY (idPaciente),
    CONSTRAINT PACIENTE_UK UNIQUE (cpf)
)ENGINE=InnoDB;

CREATE TABLE patologia (
    idPaciente INT(11) NOT NULL,
    patologia VARCHAR(30),

    CONSTRAINT patologia_PACIENTE_FK FOREIGN KEY (idPaciente) REFERENCES PACIENTE (idPaciente)
)ENGINE=InnoDB;

-- tirar restrição alimentar do popula

CREATE TABLE alergia (
    idPaciente INT(11) NOT NULL PRIMARY KEY,
    alergia VARCHAR(30),

    CONSTRAINT alergia_PACIENTE_FK FOREIGN KEY (idPaciente) REFERENCES PACIENTE (idPaciente)
)ENGINE=InnoDB;

CREATE TABLE telefone (
    idPaciente INT(11) NOT NULL,
    telefone VARCHAR(11),

    CONSTRAINT telefone_PACIENTE_FK FOREIGN KEY (idPaciente) REFERENCES PACIENTE (idPaciente)
)ENGINE=InnoDB;

CREATE TABLE PROFISSIONALSAUDE (
    cpf CHAR(11) NOT NULL,
    rg VARCHAR(30) NOT NULL,
    dataNascimento DATE NOT NULL,
    carteiraTrabalho VARCHAR(20) NOT NULL,
    numero INT(10) NOT NULL,
    cep CHAR(8) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    CONSTRAINT PROFISSIONALSAUDE_PK PRIMARY KEY (cpf)
)ENGINE=InnoDB;

CREATE TABLE telefone_p (
    telefone VARCHAR(11),
    cpf CHAR(11),

    CONSTRAINT telefone_p_PROFISSIONALSAUDE_FK FOREIGN KEY (cpf) REFERENCES PROFISSIONALSAUDE (cpf)
)ENGINE=InnoDB;

CREATE TABLE ESPECIALIDADE (
    idEspecialidade INT(11) AUTO_INCREMENT,
    tipoEspecialidade VARCHAR(30) NOT NULL,

    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY (idEspecialidade)
)ENGINE=InnoDB;

CREATE TABLE MEDICO (
    crm VARCHAR(10) NOT NULL,
    crmUf CHAR(2) NOT NULL,
    cpf CHAR(11) NOT NULL,
    idEspecialidade INT(11) NOT NULL,

    CONSTRAINT MEDICO_PK PRIMARY KEY (crm, crmUf, cpf),
    CONSTRAINT MEDICO_PROFISSIONALSAUDE_FK FOREIGN KEY (cpf) REFERENCES PROFISSIONALSAUDE (cpf) ON DELETE CASCADE,
	  CONSTRAINT MEDICO_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade) REFERENCES ESPECIALIDADE (idEspecialidade) ON DELETE RESTRICT
)ENGINE=InnoDB;

CREATE TABLE FISIOTERAPEUTA (
    crefito VARCHAR(10) NOT NULL,
    crefitoUf CHAR(2) NOT NULL,
    cpf CHAR(11) NOT NULL,

    CONSTRAINT FISIOTERAPEUTA_PK PRIMARY KEY (crefito, crefitoUf, cpf),
    CONSTRAINT FISIOTERAPEUTA_PROFISSIONALSAUDE_FK FOREIGN KEY (cpf) REFERENCES PROFISSIONALSAUDE (cpf) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE ENFERMEIRO (
    coren VARCHAR(10) NOT NULL,
    corenUf CHAR(2) NOT NULL,
    cpf CHAR(11) NOT NULL,

    CONSTRAINT ENFERMEIRO_PK PRIMARY KEY (coren, corenUf, cpf),
    CONSTRAINT ENFERMEIRO_PROFISSIONALSAUDE_FK FOREIGN KEY (cpf) REFERENCES PROFISSIONALSAUDE (cpf) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE FONOAUDIOLOGO (
    crefono VARCHAR(10) NOT NULL,
    crefonoUf CHAR(2) NOT NULL,
    cpf CHAR(11) NOT NULL,

    CONSTRAINT FONOAUDIOLOGO_PK PRIMARY KEY (crefono, crefonoUf, cpf),
    CONSTRAINT FONOAUDIOLOGO_PROFISSIONALSAUDE_FK FOREIGN KEY (cpf) REFERENCES PROFISSIONALSAUDE (cpf) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE CONSULTA_visita (
    idConsulta INT(11) AUTO_INCREMENT,
    horaInicioConsulta TIME NOT NULL,
    horaFimConsulta TIME NOT NULL, 
    dataConsulta DATE NOT NULL,
    cpf CHAR(11) NOT NULL,
    idPaciente INT(11) NOT NULL,

    CONSTRAINT CONSULTA_visita_PK PRIMARY KEY (idConsulta),
    CONSTRAINT CONSULTA_visita_PROFISSIONALSAUDE_FK FOREIGN KEY (cpf) REFERENCES PROFISSIONALSAUDE (cpf),
    CONSTRAINT CONSULTA_visita_PACIENTE_FK FOREIGN KEY (idPaciente) REFERENCES PACIENTE (idPaciente)
)ENGINE=InnoDB;

-- modificação

CREATE TABLE PRESCRICAO (
    idPrescricao INT(11) AUTO_INCREMENT,
    pressaoArterial VARCHAR(10) NOT NULL,
    glicemia DECIMAL(5,2) NOT NULL,
    dosagem VARCHAR(40) NOT NULL, 
    horarioMedicamento TIME NOT NULL, 
    idConsulta INT(11),

    CONSTRAINT PRESCRICAO_PK PRIMARY KEY (idPrescricao),
    CONSTRAINT PRESCRICAO_CONSULTA_FK FOREIGN KEY (idConsulta) REFERENCES CONSULTA_visita (idConsulta) ON DELETE CASCADE
)ENGINE=InnoDB;

-- modificação

CREATE TABLE MEDICAMENTO (
    codigoMedicamento INT(11),
    nome VARCHAR(30) NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    dataValidade DATE NOT NULL,
    loteFabricacao VARCHAR(20) NOT NULL,

    CONSTRAINT MEDICAMENTO_PK PRIMARY KEY (codigoMedicamento)
)ENGINE=InnoDB;

CREATE TABLE possui (
    idPrescricao INT(11),
    codigoMedicamento INT(11),

    CONSTRAINT possui_PRESCRICAO_FK FOREIGN KEY (idPrescricao) REFERENCES PRESCRICAO (idPrescricao) ON DELETE RESTRICT,
    CONSTRAINT possui_MEDICAMENTO_FK FOREIGN KEY (codigoMedicamento) REFERENCES MEDICAMENTO (codigoMedicamento) ON DELETE RESTRICT
)ENGINE=InnoDB;

CREATE TABLE COOPERATIVA (
    cnpj CHAR(14) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cep CHAR(8) NOT NULL,
    numero INT(10) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,

    CONSTRAINT COOPERATIVA_PK PRIMARY KEY (cnpj)
)ENGINE=InnoDB;

CREATE TABLE FUNCIONARIO (
    cpf CHAR(11) NOT NULL,
    rg VARCHAR(30) NOT NULL,
    dataNascimento DATE NOT NULL,
    carteiraTrabalho VARCHAR(20) NOT NULL,
    cep CHAR(8) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero INT(10) NOT NULL,
    nome VARCHAR(100) NOT NULL,

    CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (cpf)
)ENGINE=InnoDB;

CREATE TABLE telefone_f (
    cpf CHAR(11) NOT NULL,
    telefone VARCHAR(11),

    CONSTRAINT telefone_f_FUNCIONARIO_FK FOREIGN KEY (cpf) REFERENCES FUNCIONARIO (cpf)
)ENGINE=InnoDB;

CREATE TABLE trabalha (
    cpf CHAR(11),
    cnpj CHAR(14),

    CONSTRAINT trabalha_FUNCIONARIO_FK FOREIGN KEY (cpf) REFERENCES FUNCIONARIO (cpf) ON DELETE RESTRICT,
	  CONSTRAINT trabalha_COOPERATIVA_FK FOREIGN KEY (cnpj) REFERENCES COOPERATIVA (cnpj) ON DELETE RESTRICT
)ENGINE=InnoDB;

CREATE TABLE GESTOR (
	cpf CHAR(11) NOT NULL,
    formacao VARCHAR(50) NOT NULL,

    CONSTRAINT GESTOR_PK PRIMARY KEY (cpf),
	  CONSTRAINT GESTOR_FUNCIONARIO_FK FOREIGN KEY (cpf) REFERENCES FUNCIONARIO (cpf) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE TECNICO (
    coren VARCHAR(6) NOT NULL,
    corenUf CHAR(2) NOT NULL,
    tituloEleitor VARCHAR(20) NOT NULL,
    comprovanteResidencia VARCHAR(50) NOT NULL,
    comprovanteCurso VARCHAR(50) NOT NULL,
    cnh CHAR(11),
    nConta VARCHAR(10),
    agencia VARCHAR(10),
    certidaoNadaConsta VARCHAR(50),
    cpf CHAR(11) NOT NULL,
    estadoCivil VARCHAR(50),

    CONSTRAINT TECNICO_PK PRIMARY KEY (coren, corenUf, cpf),
    CONSTRAINT TECNICO_UK UNIQUE (cnh),
    CONSTRAINT TECNICO_FUNCIONARIO_FK FOREIGN KEY (cpf) REFERENCES FUNCIONARIO (cpf) ON DELETE CASCADE

)ENGINE=InnoDB;

CREATE TABLE DISPOSITIVO (
    idDispositivo INT(11) NOT NULL AUTO_INCREMENT,
    tipoDispositivo VARCHAR(50) NOT NULL,

    CONSTRAINT DISPOSITIVO_PK PRIMARY KEY (idDispositivo)
)ENGINE=InnoDB;

CREATE TABLE manipula (
    coren VARCHAR(6) NOT NULL,
    corenUf CHAR(2) NOT NULL,
    cpf CHAR(11) NOT NULL,
    idDispositivo INT(11) NOT NULL,

    CONSTRAINT manipula_TECNICO_FK FOREIGN KEY (coren, corenUF, cpf) REFERENCES TECNICO (coren, corenUF, cpf),
    CONSTRAINT manipula_DISPOSITIVO_FK FOREIGN KEY (idDispositivo) REFERENCES DISPOSITIVO (idDispositivo)
)ENGINE=InnoDB;

CREATE TABLE PLANTAO_atende (
    idPaciente INT(11) NOT NULL,
    coren VARCHAR(6) NOT NULL,
    corenUf CHAR(2) NOT NULL,
    cpf CHAR(11) NOT NULL,
    horaInicioPlantao TIME NOT NULL,
    horaFimPlantao TIME NOT NULL,
    dataPlantao DATE NOT NULL,
    turno ENUM('Diurno', 'Noturno') NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    idPlantao INT(11) NOT NULL AUTO_INCREMENT,
    cpfGestor VARCHAR(11) NOT NULL, 

    CONSTRAINT PLANTAO_atende_PK PRIMARY KEY (idPlantao),
    CONSTRAINT PLANTAO_atende_PACIENTE_FK FOREIGN KEY (idPaciente) REFERENCES PACIENTE (idPaciente) ON DELETE RESTRICT,
    CONSTRAINT PLANTAO_atende_TECNICO_FK FOREIGN KEY (coren, corenUf, cpf) REFERENCES TECNICO (coren, corenUf, cpf) ON DELETE RESTRICT,
    CONSTRAINT PLANTAO_atende_FK FOREIGN KEY (cpfGestor) REFERENCES GESTOR (cpf)
)ENGINE=InnoDB;

-- MODIFICAÇÃO

CREATE TABLE AVALIACAOTECNICO (
	
    idAvaliacao INT(11) AUTO_INCREMENT,
    classificacao VARCHAR(100),
    critica VARCHAR(100),
    elogios VARCHAR(100),
    idPlantao INT(11) NOT NULL,
    
    CONSTRAINT AVALIACAOTECNICO_PK PRIMARY KEY (idAvaliacao),
    CONSTRAINT AVALIACAO_PLANTAO_atende_FK FOREIGN KEY (idPlantao) REFERENCES PLANTAO_atende (idPlantao)
)ENGINE=InnoDB;

-- modificação

CREATE TABLE EVOLUCAO (
    idEvolucao INT(11) NOT NULL AUTO_INCREMENT,
    descricao TEXT(1000) NOT NULL,
    idPlantao INT(11) NOT NULL,

    CONSTRAINT EVOLUCAO_PK PRIMARY KEY (idEvolucao),
    CONSTRAINT EVOLUCAO_PLANTAO_atende_FK FOREIGN KEY (idPlantao) REFERENCES PLANTAO_atende (idPlantao) ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE necessita (
	idPaciente INT(11) NOT NULL,
	idDispositivo INT(11) NOT NULL,
    
    CONSTRAINT necessita_PACIENTE_FK FOREIGN KEY (idPaciente) REFERENCES PACIENTE (idPaciente),
    CONSTRAINT necessita_DISPOSITIVO_FK FOREIGN KEY (idDispositivo) REFERENCES DISPOSITIVO (idDispositivo)
)ENGINE=InnoDB;
-- modificação
