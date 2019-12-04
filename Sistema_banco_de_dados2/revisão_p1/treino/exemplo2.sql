

CREATE DATABASE IF NOT EXISTS escola;
USE escola;

CREATE TABLE aluno (
  mat VARCHAR(50) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  cidade VARCHAR(50) NOT NULL,

  CONSTRAINT aluno_pk PRIMARY KEY (mat)
)ENGINE=INNODB;

CREATE TABLE disciplina (
  cod_dis CHAR(4) NOT NULL,
  nome_disc VARCHAR(50) NOT NULL,
  carga_hor INT NOT NULL,
  CONSTRAINT DISCIPLINA_PK PRIMARY KEY (cod_dis)
)ENGINE=INNODB;

CREATE TABLE professor (
  cod_prof VARCHAR(50) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  CONSTRAINT professor_pk PRIMARY KEY (cod_prof)
)ENGINE=INNODB;

CREATE TABLE turma (
  cod_dis CHAR(4) NOT NULL,
  cod_prof VARCHAR(50) NOT NULL,
  cod_turma VARCHAR(10) NOT NULL,
  ano INT NOT NULL,
  horario VARCHAR(10) NOT NULL,
  CONSTRAINT turma_pk PRIMARY KEY (cod_dis, cod_prof, cod_turma, ano),
  CONSTRAINT turma_professor_fk FOREIGN KEY (cod_prof) REFERENCES professor (cod_prof)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT,
  CONSTRAINT turma_disciplina_fk FOREIGN KEY (cod_dis) REFERENCES disciplina (cod_dis)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT
)ENGINE=INNODB;

CREATE TABLE historico (
  mat VARCHAR(50) NOT NULL,
  cod_dis CHAR(4) NOT NULL,
  cod_turma VARCHAR(10) NOT NULL,
  cod_prof VARCHAR(50) NOT NULL,
  ano INT NOT NULL,
  frequencia INT NOT NULL,
  nota INT NOT NULL,

  CONSTRAINT historico_pk PRIMARY KEY (mat, cod_dis, cod_turma, cod_prof, ano),
  CONSTRAINT historico_aluno_fk FOREIGN KEY (mat) REFERENCES aluno (mat),
  CONSTRAINT hitorico_turma_fk FOREIGN KEY (cod_dis, cod_turma, cod_prof, ano) REFERENCES turma (cod_dis, cod_turma, cod_prof, ano)
)ENGINE=INNODB;