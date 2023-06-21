/*
TeSP_PSI_22_23_CDBD
Base de dados de inscrição em exames
Cláudio Moreira, estudade nº 2220881
Hugo Gonçalves, estudante nº 2220891
Rafael Teodoso, estudante nº 2220886
*/

-- Criação de utilizadores
create user 'admin'@'localhost' identified by 'admin';
create user 'aluno'@'localhost' identified by 'aluno';

-- gestão de acessos nos utilizadores
select host,user From mysql.user;

Grant all privileges on bdinscrições_em_exames.* to 'admin'@'localhost' with grant option;

Grant select on v_exame_duracao to 'aluno'@'localhost';
Grant select on v_Pessoa_idade to 'aluno'@'localhost';


Create or replace view v_exame_duracao as
SELECT Id, (TIME_TO_SEC(Hora_Final_Exame) - TIME_TO_SEC(Hora_Inicio_Exame)) AS Duracao
from Exame;

Create or replace view v_Pessoa_idade as
SELECT Id, YEAR(CURRENT_DATE()) - YEAR(DtaNascimento) AS Idade
from Pessoa;

