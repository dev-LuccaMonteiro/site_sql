# Academia DB - Base de Dados para Gestão de Academia

A base de dados **academia_db** foi concebida em MySQL para gerir o registo de alunos, a oferta de planos de subscrição, o controlo de matrículas e a prescrição de treinos[cite: 1, 2, 3, 4].

---

## Estrutura da Base de Dados

O modelo relacional é constituído por 4 tabelas[cite: 1, 2, 3, 4]:

### 1. `alunos`
Armazena os dados cadastrais dos alunos da academia.
* **`id_aluno`**: Identificador único do aluno (`INT`, Auto Increment, Chave Primária)[cite: 1].
* **`nome`**: Nome completo do aluno (`VARCHAR(100)`, Não Nulo)[cite: 1].
* **`cpf`**: Documento de identificação individual (`VARCHAR(14)`, Não Nulo, Único)[cite: 1].
* **`telefone`**: Número de contacto telefónico (`VARCHAR(20)`)[cite: 1].
* **`data_cadastro`**: Data e hora de registo (`DATETIME`, Valor predefinido `CURRENT_TIMESTAMP`)[cite: 1].

### 2. `planos`
Contém a lista de planos de subscrição disponíveis.
* **`id_plano`**: Identificador único do plano (`INT`, Auto Increment, Chave Primária)[cite: 3].
* **`nome`**: Nome descritivo do plano (`VARCHAR(100)`)[cite: 3].
* **`valor`**: Preço do plano (`DECIMAL(10,2)`, Não Nulo)[cite: 3].
* **`duracao_meses`**: Duração da adesão em meses (`INT`, Não Nulo)[cite: 3].

### 3. `matriculas`
Relaciona os alunos aos respetivos planos e gere a validade dos contratos.
* **`id_matricula`**: Identificador único da matrícula (`INT`, Auto Increment, Chave Primária)[cite: 2].
* **`aluno_id`**: Chave estrangeira ligada a `alunos(id_aluno)` com eliminação em cascata (`ON DELETE CASCADE`)[cite: 2].
* **`plano_id`**: Chave estrangeira ligada a `planos(id_plano)`[cite: 2].
* **`data_inicio`**: Data de início do contrato (`DATE`, Não Nulo)[cite: 2].
* **`data_vencimento`**: Data de expiração da matrícula (`DATE`, Não Nulo)[cite: 2].
* **`status`**: Estado atual da matrícula (`ENUM('ativa', 'vencida', 'concelada')`, Valor predefinido `'ativa'`)[cite: 2].

### 4. `treinos`
Regista as rotinas de exercício recomendadas para cada aluno.
* **`id_treino`**: Identificador único do registo de treino (`INT`, Auto Increment, Chave Primária)[cite: 4].
* **`id_aluno`**: Chave estrangeira ligada a `alunos(id_aluno)` com eliminação em cascata (`ON DELETE CASCADE`)[cite: 4].
* **`divisao`**: Agrupamento ou divisão do treino (`CHAR(20)`, Não Nulo)[cite: 4].
* **`exercicio`**: Nome do exercício (`VARCHAR(100)`, Não Nulo)[cite: 4].
* **`series`**: Número de séries (`INT`, Não Nulo)[cite: 4].
* **`repeticoes`**: Número de repetições por série (`INT`, Não Nulo)[cite: 4].
* **`carga_kg`**: Carga recomendada em quilogramas (`DECIMAL(5,2)`)[cite: 4].

---

## Ficheiros do Projeto

* **`academia_db_alunos.sql`**: Script de criação da tabela `alunos` e inserção de dados iniciais[cite: 1].
* **`academia_db_planos.sql`**: Script de criação da tabela `planos` e inserção das opções de subscrição[cite: 3].
* **`academia_db_matriculas.sql`**: Script de criação da tabela `matriculas` e inserção dos registos vinculados[cite: 2].
* **`academia_db_treinos.sql`**: Script de criação da tabela `treinos` e inserção das fichas de treino[cite: 4].

---

## Instruções de Importação

### Pré-requisitos
* Servidor **MySQL** (versão 8.0.46 ou superior)[cite: 1].
* Cliente de base de dados MySQL (MySQL Workbench, DBeaver, ou linha de comandos).

### Ordem de Importação

A importação deve respeitar a integridade referencial das chaves estrangeiras[cite: 2, 4]:

1. **Criação da base de dados:**
   ```sql
   CREATE DATABASE IF NOT EXISTS academia_db;
   USE academia_db;
