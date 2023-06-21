-- Populate table Pessoa
INSERT INTO Pessoa (Nome, Morada, Telemovel, Email, Nif, DtaNascimento)
VALUES
  ('João Silva', 'Rua A, Lisboa', 987654123, 'joao@exemplo.com', 923456789, '1990-01-01'),
  ('Maria Santos', 'Rua B, Porto', 987654321, 'maria@exemplo.com', 987654321, '1995-05-10'),
  ('Pedro Almeida', 'Rua C, Coimbra', 987654555, 'pedro@exemplo.com', 956123789, '1998-12-15'),
  ('Ana Pereira', 'Rua D, Faro', 987654001, 'ana@exemplo.com', 989456123, '1993-09-20'),
  ('Miguel Fernandes', 'Rua E, Braga', 987654456, 'miguel@exemplo.com', 954789321, '1992-07-25'),
  ('Sofia Santos', 'Rua F, Setúbal', 987321654, 'sofia@exemplo.com', 987321654, '1996-04-05'),
  ('Ricardo Costa', 'Rua G, Évora', 987654000, 'ricardo@exemplo.com', 921654987, '1991-11-30'),
  ('Carla Mendes', 'Rua H, Aveiro', 987654876, 'carla@exemplo.com', 941852963, '1994-08-12');

-- Populate table Aluno
INSERT INTO Aluno (Estatuto, Necessidades_esp, Valor_Inscricao, Data_Inscricao)
VALUES
  ('Estudate', 0, 200, NOW()),
  ('Estudante Trabalhador', 0, 150, NOW()),
  ('Estudate', 0, 250, NOW()),
  ('Estudate', 0, 200, NOW()),
  ('Estudante Trabalhador', 0, 300, NOW()),
  ('Estudate', 1, 150, NOW()),
  ('Estudante Trabalhador', 0, 200, NOW()),
  ('Estudate', 1, 250, NOW());

-- Populate table Docente
INSERT INTO Docente (Habilitacoes, Cacifo)
VALUES
  ('Licenciatura', 101),
  ('Mestrado', 102),
  ('Doutoramento', 103),
  ('Licenciatura', 104),
  ('Mestrado', 105),
  ('Doutoramento', 106),
  ('Licenciatura', 107),
  ('Mestrado', 108);

-- Populate table Curso
INSERT INTO Curso (DescricaoCurso, Sigla, IdAluno)
VALUES
  ('Engenharia Informática', 'EI', 1),
  ('Gestão de Empresas', 'GE', 2),
  ('Arquitetura', 'ARQ', 3),
  ('Engenharia Civil', 'EC', 4),
  ('Psicologia', 'PSI', 5),
  ('Marketing', 'MK', 6),
  ('Medicina', 'MED', 7),
  ('Design Gráfico', 'DG', 8);

-- Populate table UC
INSERT INTO UC (DescricaoUC, Sigla, ETCS, Ano, Semestre, IdCurso)
VALUES
  ('Programação', 'PRG', 6, '1', '1', 1),
  ('Contabilidade', 'CONT', 6, '1', '1', 2),
  ('Desenho Técnico', 'DT', 4, '1', '1', 3),
  ('Mecânica dos Materiais', 'MM', 6, '2', '2', 4),
  ('Psicologia Experimental', 'PSI EXP', 6, '2', '2', 5),
  ('Marketing Digital', 'MK DIG', 4, '2', '2', 6),
  ('Anatomia', 'ANAT', 6, '3', '1', 7),
  ('Design de Comunicação', 'DC', 4, '3', '1', 8);

-- Populate table Inscricao_UC
INSERT INTO Inscricao_UC (Status, Ano_Letivo, Data, IdUC, IdAluno)
VALUES
  ('aprovado', 2022, NOW(), 1, 1),
  ('aprovado', 2022, NOW(), 2, 2),
  ('aprovado', 2022, NOW(), 3, 3),
  ('nao aprovado', 2022, NOW(), 4, 4),
  ('nao aprovado', 2022, NOW(), 5, 5),
  ('aprovado', 2022, NOW(), 6, 6),
  ('aprovado', 2022, NOW(), 7, 7),
  ('nao aprovado', 2022, NOW(), 8, 8);

-- Populate table Exame
INSERT INTO Exame (Epoca, Hora_Inicio_Exame, Hora_Final_Exame, Nome_UC, IdUC)
VALUES
  ('Época Normal', '2023-05-15 09:00:00', '2023-05-15 12:00:00', 'Programação', 1),
  ('Época Normal', '2023-06-10 14:00:00', '2023-06-10 16:00:00',  'Contabilidade', 2),
  ('Época Especial', '2023-05-20 10:00:00', '2023-05-20 12:00:00',  'Desenho Técnico', 3),
  ('Época Normal', '2023-06-25 09:30:00', '2023-06-25 12:30:00',  'Mecânica dos Materiais', 4),
  ('Época Especial', '2023-05-30 14:30:00', '2023-05-30 17:30:00',  'Psicologia Experimental', 5),
  ('Época Normal', '2023-06-15 09:00:00', '2023-06-15 12:00:00',  'Marketing Digital', 6),
  ('Época Especial', '2023-06-05 10:30:00', '2023-06-05 11:30:00',  'Anatomia', 7),
  ('Época Normal', '2023-06-20 14:00:00', '2023-06-20 17:00:00',  'Design de Comunicação', 8);

-- Populate table Inscricao_Exame
INSERT INTO incricao_exame (Nota, Valor, Data, IdExame, IdAluno)
VALUES
  (15, 0, NOW(), 1, 1),
  (16, 0, NOW(), 2, 2),
  (12, 25, NOW(), 3, 3),
  (0, 0, NOW(), 4, 4),
  (0, 25, NOW(), 5, 5),
  (18, 0, NOW(), 6, 6),
  (14, 25, NOW(), 7, 7),
  (0, 0, NOW(), 8, 8);

-- Populate table DSD_Docente
INSERT INTO dsd_docente (Data, IdDocente)
VALUES
  (NOW(), 1),
  (NOW(), 2),
  (NOW(), 3),
  (NOW(), 4),
  (NOW(), 5),
  (NOW(), 6),
  (NOW(), 7),
  (NOW(), 8);

-- Populate table UC_DSD_Docente
INSERT INTO uc_dsd_docente (IdUC, IdDSD_Docente)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8);
