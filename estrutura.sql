/*
TeSP_PSI_22_23_CDBD
Sistema de Informação para a Gestão de Arrendamentos da Empresa 
Imobiliária "Casa de Sonho"
Carlos Ribeiro Alves Fictício, estudante n.º 2120012
Rita Maria Carreira Hipotética, estudante n.º 2120013
*/

-- Create database
DROP DATABASE IF EXISTS `bdinscrições_em_exames`;
CREATE DATABASE `bdinscrições_em_exames`;
-- usa database
USE `bdinscrições_em_exames`;

-- Create table Entidade_Pessoa
DROP TABLE if exists Pessoa;
CREATE TABLE Pessoa (
  Id INT unsigned AUTO_INCREMENT,
  Nome VARCHAR(100) NOT NULL CHECK (LENGTH(Nome) >= 2),
  Morada VARCHAR(500),
  Telemovel INT NOT NULL CHECK (Telemovel <= 999999999),
  Email VARCHAR(100) NOT NULL CHECK (LENGTH(Email) >= 4 AND Email LIKE '%@%' AND Email LIKE '%.%'),
  Nif INT NOT NULL CHECK (Nif <= 999999999),
  DtaNascimento DATETIME,
  PRIMARY KEY (Id)
) engine=innoDB;

-- Create table Entidade_Aluno
DROP TABLE if exists Aluno;
CREATE TABLE Aluno (
  Id INT unsigned AUTO_INCREMENT,
  Estatuto VARCHAR(100) NOT NULL CHECK (LENGTH(Estatuto) >= 2),
  Necessidades_esp BOOLEAN,
  Valor_Inscricao INT CHECK (Valor <= 300),
  Data_Inscricao DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id),
  CONSTRAINT fk_aluno_pessoa FOREIGN KEY (Id) REFERENCES Pessoa (Id)
)engine=innoDB;

-- Create table Entidade_Docente
DROP TABLE if exists Docente;
CREATE TABLE Docente (
  Id INT UNSIGNED AUTO_INCREMENT,
  Habilitacoes VARCHAR(300) NOT NULL CHECK (LENGTH(Habilitacoes) >= 2),
  Cacifo INT,
  PRIMARY KEY(Id),
  CONSTRAINT fk_docente_pessoa FOREIGN KEY (Id) REFERENCES Pessoa (Id)
)engine=innoDB;

-- Create table Entidade_Curso
DROP TABLE if exists Curso;
CREATE TABLE Curso (
  Id INT UNSIGNED AUTO_INCREMENT,
  DescricaoCurso VARCHAR(100) NOT NULL CHECK (LENGTH(DescricaoCurso) >= 3),
  Sigla VARCHAR(100) NOT NULL CHECK (LENGTH(Sigla) >= 2),
  PRIMARY KEY (Id)
)engine=innoDB;

-- Create table Entidade_UC
DROP TABLE if exists UC;
CREATE TABLE UC (
  Id INT UNSIGNED AUTO_INCREMENT,
  DescricaoUC VARCHAR(300) NOT NULL CHECK (LENGTH(DescricaoUC) >= 2),
  Sigla VARCHAR(100) NOT NULL CHECK (LENGTH(Sigla) >= 2),
  ETCS INT CHECK (ETCS <= 99),
  Ano ENUM('1', '2', '3'),
  Semestre ENUM('1', '2'),
  IdCurso INT unsigned  NOT NULL,
  PRIMARY KEY (Id),
  CONSTRAINT fk_UC_Curso FOREIGN KEY (IdCurso) REFERENCES Curso(Id)
)engine=innoDB;

-- Create table Entidade_Registo_UC
DROP TABLE if exists Inscricao_UC;
CREATE TABLE Inscricao_UC (
  Id INT UNSIGNED AUTO_INCREMENT,
  Status ENUM('aprovado', 'nao aprovado'),
  Ano_Letivo INT CHECK (Ano_Letivo <= 9999),
  Data DATETIME DEFAULT CURRENT_TIMESTAMP,
  IdUC INT unsigned NOT NULL,
  IdAluno INT unsigned NOT NULL,
  Primary KEY (Id),
  CONSTRAINT fk_Incricao_UC_UC FOREIGN KEY (IdUC) REFERENCES UC (Id),
  CONSTRAINT fk_Incricao_UC_Aluno FOREIGN KEY (IdAluno) REFERENCES Aluno (Id)
)engine=innoDB;

-- Create table Entidade_Exame
DROP TABLE if exists Exame;
CREATE TABLE Exame (
  Id INT UNSIGNED AUTO_INCREMENT,
  Epoca VARCHAR(100) NOT NULL CHECK (LENGTH(Epoca) >= 3),
  Hora_Inicio_Exame DATETIME,
  Hora_Final_Exame DATETIME,
  Duracao FLOAT,
  Nome_UC VARCHAR(100) NOT NULL CHECK (LENGTH(Nome_UC) >= 3),
  IdUC INT unsigned NOT NULL,
  PRIMARY KEY (Id),
  CONSTRAINT fk_Exame_UC FOREIGN KEY (IdUC) REFERENCES UC (Id)
)engine=innoDB;

-- Create table Entidade_Registo_Exame
DROP TABLE if exists Inscricao_Exame;
CREATE TABLE Incricao_Exame (
  Id INT UNSIGNED AUTO_INCREMENT,
  Nota INT CHECK (Nota >= 0 AND Nota <= 20),
  Valor INT CHECK (Valor <= 100),
  Data DATETIME DEFAULT CURRENT_TIMESTAMP,
  IdExame INT unsigned NOT NULL,
  IdAluno INT unsigned NOT NULL,
  PRIMARY KEY (Id),
  CONSTRAINT fk_Incricao_Exame_Exame FOREIGN KEY (IdExame) REFERENCES Exame (Id),
  CONSTRAINT fk_Incricao_Exame_Aluno FOREIGN KEY (IdAluno) REFERENCES Aluno (Id)
  
)engine=innoDB;

-- Create table Entidade_DSD_Docente
DROP TABLE if exists DSD_Docente;
CREATE TABLE DSD_Docente (
  Id INT UNSIGNED AUTO_INCREMENT,
  Data DATETIME,
  IdDocente INT unsigned NOT NULL,
  PRIMARY KEY (Id),
  CONSTRAINT fk_DSD_DOCENTE_DOCENTE FOREIGN KEY (IdDocente) REFERENCES Docente (ID)
)engine=innoDB;

-- Create Table UC_DSD_DOCENTE
DROP TABLE if exists UC_DSD_Docente;
CREATE TABLE UC_DSD_Docente (
  IdUC INT UNSIGNED NOT NULL,
  IdDSD_Docente INT unsigned NOT NULL,
  CONSTRAINT fk_UC_DSD_Docente_DSD_Docente FOREIGN KEY (IdDSD_Docente) REFERENCES DSD_Docente (ID),
CONSTRAINT fk_UC_DSD_Docente_UC FOREIGN KEY (IdUC) REFERENCES UC (ID)
)engine=innoDB;


