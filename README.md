# aulas-banco

Exercícios de Banco de Dados, um diretório por aula, na ordem das datas.

## Aulas

| Pasta | Data | Conteúdo |
|---|---|---|
| `aula-02-modelagem/` | 2026-03-02 | Exemplo `Cliente`, cardinalidades 1:1 / 1:N / N:N e os 6 cenários da atividade |
| `aula-03-modelagem/` | 2026-03-09 | DER universidade / turmas / professores / salas |
| `aula-04-modelagem/` | 2026-03-16 | DER funcionário–dependente–curso e relacionamento ternário |
| `aula-05-der-estendido/` | 2026-03-30 | Empresa XWZ, especialização de `conta` e hierarquia de limpeza |
| `aula-09-introducao-sql/` | 2026-05-05 | `CREATE DATABASE`, `CREATE TABLE` e chave estrangeira |
| `aula-12-dml/` | 2026-06-08 | Atividade EMPRESA3: insert 10, select, update 5, delete 6 |
| `aula-13-funcoes/` | 2026-08-10 | `SUM`/`COUNT`/`AVG`, `GROUP BY`, `HAVING` |
| `aula-14-joins/` | 2026-08-31 | Exercícios 1 a 7 com `INNER JOIN` e `LEFT JOIN` |
| `aula-15-views/` | 2026-09-15 | As 5 views pedidas, a partir dos joins |
| `aula-16-tcl/` | 2026-09-29 | `COMMIT`, `ROLLBACK` e `SAVEPOINT` |

As aulas 01, 06, 07 e 08 (modelagem/dicionário) e 10/11 (revisão) ainda não
têm pasta: o trabalho delas foi desenhado na ferramenta BRModelo, não em SQL,
e a maior parte dos enunciados só existe como imagem no slide.

Os diagramas são fonte `.dot` (Graphviz). Para renderizar:

```ksh
mkdir -p aula-05-der-estendido/build
dot -Tpdf aula-05-der-estendido/01-der-empresa-xwz.dot \
    -o aula-05-der-estendido/build/01-der-empresa-xwz.pdf
```

A pasta `build/` é ignorada pelo git — só a fonte vale.


## Projeto 1

Entrega de 05/10/2026 (prazo do Classroom). Tudo em `projeto-1/`:

```
projeto-1/
  projeto-1.pdf        entrega em PDF (gerado de projeto-1.tex)
  projeto-1.tex        fonte LaTeX do documento
  modelo-fisico.sql    script físico: 11 tabelas x 5 registros (testado)
  diagramas/
    conceitual.dot     modelo conceitual (Graphviz)
    logico.dot         modelo lógico (tipos, PK, FK)
```


## Arquivos soltos da home

```
sql/
  01-criar-tabela-empresa.sql      CREATE TABLE + INSERT (MySQL)
  02-sexo-como-boolean.sql         mesma tabela, sexo como 0/1 + CASE (MySQL)
  03-relacionamentos-e-joins.sql   3 tabelas com FK (SQLite)
  04-agregacao-ger-vendas.sql      COUNT/SUM/AVG/GROUP BY/HAVING (MySQL)
dados/
  empresa.db                       banco SQLite ja com o script 03 aplicado
```

| No repo | Original | Dialeto |
|---|---|---|
| `sql/01` | `~/atividade.sql` | MySQL |
| `sql/02` | `~/atividade_bool.sql` | MySQL |
| `sql/03` | `~/empresa_joins.sql` | SQLite |
| `sql/04` | `~/ger_verndas.sql` | MySQL |
| `dados/empresa.db` | `~/empresa.db` | SQLite |

Os originais continuam na home. Este repo é cópia organizada, nada foi apagado.

## Como rodar

```ksh
# MySQL / MariaDB (todas as pastas aula-XX)
mysql < aula-12-dml/01-atividade-empresa3.sql
mysql < aula-16-tcl/01-atividade-tcl.sql

# SQLite
sqlite3 dados/empresa.db < sql/03-relacionamentos-e-joins.sql
```

## Cuidado com o dialeto

A aula mistura MySQL e SQLite, e os dois primeiros scripts da pasta `sql/`
**não são o mesmo exercício do `empresa.db`**:

- `01`/`02` criam a tabela `funcionarios` (colunas `Codfunc`, `nomefunc`, `salfunc`…)
- `03` cria `departamento` / `funcionario` / `dependente` (colunas `idfun`, `funnome`…)

`dados/empresa.db` é o resultado do `03`, não do `01`.

Os scripts das pastas `aula-XX` seguem o dialeto do slide do professor:
`integer`, `varchar(n)`, `numeric`, `FOREIGN KEY` no fim do `CREATE`, sem
`BOOLEAN`, sem `CASE` e sem `AUTO_INCREMENT` — rodam no MySQL/MariaDB sem
reclamar.

## Pendências

- **`sql/04` tem dado perdido.** O `~/ger_verndas.sql` original estava cortado no
  meio de um `INSERT` (`('produto `) e num `SELECT` sem fim. As 5 linhas de `vendas`
  que estavam inteiras foram preservadas; a 6ª linha e o último `SELECT` estão
  marcados com comentários no arquivo e precisam ser reconstruídos.
- **`sql/03` não tem nenhuma consulta.** O script só cria e popula. Faltam os
  `SELECT` com `JOIN` — que é justamente o assunto do arquivo.
- Dialeto misto: se a aula é MySQL, o `03` precisa ser portado
  (`AUTOINCREMENT` → `AUTO_INCREMENT`).
- Faltam as pastas das aulas 01, 06, 07 e 08 (modelagem/dicionário) e 10/11 (revisão).
