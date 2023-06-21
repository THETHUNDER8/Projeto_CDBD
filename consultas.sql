-- Mostra os alunos no curso com sigla EI
SELECT CONCAT(p.Nome, ' - ', a.Estatuto) AS Aluno_Estatuto, c.DescricaoCurso, c.Sigla
FROM Pessoa p
JOIN Aluno a ON p.Id = a.Id
JOIN Curso c ON a.Id = c.IdAluno
WHERE c.Sigla = 'EI'
ORDER BY p.Nome;

-- conta o numero de estudantes em cada Curso
SELECT c.DescricaoCurso AS Curso, COUNT(a.Id) AS NumStudents
FROM Curso c
JOIN Aluno a ON c.IdAluno = a.Id
GROUP BY c.DescricaoCurso
ORDER BY NumStudents DESC;

-- o numero de ucs e ets por Curso
SELECT c.DescricaoCurso AS Course, SUM(uc.ETCS) AS TotalCredits, COUNT(uc.Id) AS NumUCs
FROM Curso c
JOIN Aluno a ON c.IdAluno = a.Id
JOIN Inscricao_UC iu ON a.Id = iu.IdAluno
JOIN UC uc ON iu.IdUC = uc.Id
GROUP BY c.Id, c.DescricaoCurso
ORDER BY TotalCredits DESC;

-- Valor total por curso das incrições
SELECT c.DescricaoCurso AS Curso, SUM(a.Valor_Inscricao) AS TotalValue
FROM Curso c
JOIN Aluno a ON c.IdAluno = a.Id
GROUP BY c.Id, c.DescricaoCurso
ORDER BY TotalValue ASC;

-- mostra numero de estudantes em cada uc e o sumatorio das respectivas ets
SELECT uc.DescricaoUC AS UC, SUM(uc.ETCS) AS TotalCredits, COUNT(DISTINCT iu.IdAluno) AS NumStudents
FROM UC uc
JOIN Inscricao_UC iu ON uc.Id = iu.IdUC
GROUP BY uc.Id, uc.DescricaoUC
ORDER BY TotalCredits DESC;

-- mosra nota minima e maxima em cada UC
SELECT uc.DescricaoUC AS UC, MAX(ie.Nota) AS Max_Grade, MIN(ie.Nota) AS Min_Grade
FROM UC uc
JOIN Exame e ON uc.Id = e.IdUC
JOIN Incricao_Exame ie ON e.Id = ie.IdExame
GROUP BY uc.Id, uc.DescricaoUC;

-- mpstra alunos com notas acima de 10
SELECT p.Nome AS Aluno, ie.Nota AS Nota
FROM Pessoa p
JOIN Aluno a ON p.Id = a.Id
JOIN Incricao_Exame ie ON a.Id = ie.IdAluno
WHERE ie.Nota > 10;




-- --------------
-- Sub queries	|
-- --------------
-- Alunos aprovados nas UC_inscritas
SELECT p.Nome, a.Estatuto
FROM Pessoa p
JOIN Aluno a ON p.Id = a.Id
WHERE a.Id IN (SELECT IdAluno FROM Inscricao_UC WHERE Status = 'aprovado')
ORDER BY p.Nome;

-- numero de uc que cada aluno esta incrito
SELECT p.Nome, (SELECT COUNT(*) FROM Inscricao_UC WHERE IdAluno = a.Id) AS Num_UC_Inscritas
FROM Pessoa p
JOIN Aluno a ON p.Id = a.Id
ORDER BY Num_UC_Inscritas DESC;

-- aluno que pagou o maior valor de inscrição
SELECT p.Nome, a.Estatuto
FROM Pessoa p
JOIN Aluno a ON p.Id = a.Id
WHERE a.Valor_Inscricao = (SELECT MAX(Valor_Inscricao) FROM Aluno)
ORDER BY p.Nome;

-- Alunos que não estejam inscritos em nehuma UC
SELECT Nome
FROM Pessoa
WHERE Id NOT IN (
  SELECT DISTINCT IdAluno
  FROM Inscricao_UC
);
-- --------------
-- Grupos		|
-- --------------
-- numero de alunos por Estatuto
SELECT a.Estatuto, COUNT(*) AS Num_Alunos
FROM Aluno a
GROUP BY a.Estatuto;

-- o valor de incrição por curso
SELECT c.DescricaoCurso, SUM(a.Valor_Inscricao) AS Total_Inscricao
FROM Curso c
JOIN Aluno a ON c.IdAluno = a.Id
GROUP BY c.DescricaoCurso
HAVING Total_Inscricao > 1;

-- media de nota por UC
SELECT u.DescricaoUC, ROUND(AVG(ie.Nota), 2) AS Media_Nota
FROM UC u
JOIN incricao_exame ie ON u.Id = ie.Id
GROUP BY u.DescricaoUC;


SELECT d.Habilitacoes, COUNT(*) AS Num_Alunos
FROM Docente d
GROUP BY d.Habilitacoes;






