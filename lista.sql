-- primeiro 

 select * from livros;

 -- segundo

 select nome
 from autores 
 where nascimento < '1900-01-01';

 -- 3

select  titulo, autor_id, nome
from livros jkr 
join autores a on a.id = jkr.autor_id
where a.nome = 'J.K. Rowling';

-- 4

select aluno_id, nome, curso
from alunos e
left join matriculas m on m.id  = e.id
where curso = "Engenharia de Software";

-- 5

select produto, sum(receita) as receita_t
from vendas
group by produto;

-- 6

select nome, count(autor_id) as total_livros_do_autor
from livros jkr
join autores a on a.id =   jkr.autor_id
group by nome;

