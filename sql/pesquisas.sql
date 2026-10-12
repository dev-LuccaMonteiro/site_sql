-- 1. Alunos com matrículas ativas (INNER JOIN, WHERE)
SELECT a.nome, a.telefone, m.data_inicio, m.data_vencimento, m.status
FROM alunos a
INNER JOIN matriculas m ON a.id_aluno = m.aluno_id
WHERE m.status = 'ativa';

-- 2. Pesquisa de alunos por nome exato (WHERE, ORDER BY)
SELECT id_aluno, nome, cpf, telefone
FROM alunos
WHERE nome = 'Lucas Silva'
ORDER BY nome ASC;

-- 3. Matrículas com início no intervalo de datas (INNER JOIN, WHERE, BETWEEN, ORDER BY)
SELECT a.nome AS aluno, p.nome AS plano, m.data_inicio, m.data_vencimento
FROM matriculas m
INNER JOIN alunos a ON m.aluno_id = a.id_aluno
INNER JOIN planos p ON m.plano_id = p.id_plano
WHERE m.data_inicio BETWEEN '2026-01-01' AND '2026-12-31'
ORDER BY m.data_inicio ASC;

-- 4. Soma do valor das matrículas ativas (INNER JOIN, WHERE, SUM)
SELECT SUM(p.valor) AS faturacao_total_ativa
FROM matriculas m
INNER JOIN planos p ON m.plano_id = p.id_plano
WHERE m.status = 'ativa';

-- 5. Quantidade de alunos por plano (INNER JOIN, GROUP BY, ORDER BY)
SELECT p.nome AS nome_plano, COUNT(m.id_matricula) AS total_alunos
FROM planos p
INNER JOIN matriculas m ON p.id_plano = m.plano_id
GROUP BY p.id_plano, p.nome
ORDER BY total_alunos DESC;

-- 6. Soma de carga exercida por exercício (GROUP BY, SUM, ORDER BY)
SELECT exercicio, SUM(carga_kg) AS carga_acumulada_kg
FROM treinos
GROUP BY exercicio
ORDER BY carga_acumulada_kg DESC;

-- 7. Faturação total por plano para aluno específico (INNER JOIN, WHERE, GROUP BY, SUM)
SELECT p.nome AS plano, SUM(p.valor) AS total_faturado
FROM matriculas m
INNER JOIN alunos a ON m.aluno_id = a.id_aluno
INNER JOIN planos p ON m.plano_id = p.id_plano
WHERE a.nome = 'Lucas Silva'
GROUP BY p.id_plano, p.nome;

-- 8. Vencimentos no intervalo de datas e valor acumulado (INNER JOIN, WHERE, BETWEEN, SUM)
SELECT SUM(p.valor) AS total_vencimentos_periodo
FROM matriculas m
INNER JOIN planos p ON m.plano_id = p.id_plano
WHERE m.data_vencimento BETWEEN '2026-10-01' AND '2026-10-31';

-- 9. Ficha de treino detalhada de aluno específico (INNER JOIN, WHERE, ORDER BY)
SELECT a.nome AS aluno, t.divisao, t.exercicio, t.series, t.repeticoes, t.carga_kg
FROM alunos a
INNER JOIN treinos t ON a.id_aluno = t.id_aluno
WHERE a.nome = 'Lucas Silva'
ORDER BY t.divisao ASC;

-- 10. Receita acumulada de um plano específico (INNER JOIN, WHERE, SUM)
SELECT SUM(p.valor) AS receita_plano_anual
FROM matriculas m
INNER JOIN planos p ON m.plano_id = p.id_plano
WHERE p.nome = 'Plano Anual';

-- 11. Total investido por aluno em intervalo específico (INNER JOIN, WHERE, BETWEEN, GROUP BY, SUM, ORDER BY)
SELECT a.nome AS aluno, SUM(p.valor) AS total_investido
FROM matriculas m
INNER JOIN alunos a ON m.aluno_id = a.id_aluno
INNER JOIN planos p ON m.plano_id = p.id_plano
WHERE m.data_inicio BETWEEN '2026-01-01' AND '2026-06-30'
GROUP BY a.id_aluno, a.nome
ORDER BY total_investido DESC;

-- 12. Treinos com carga dentro de um intervalo (INNER JOIN, WHERE, BETWEEN, ORDER BY)
SELECT a.nome AS aluno, t.exercicio, t.carga_kg
FROM treinos t
INNER JOIN alunos a ON t.id_aluno