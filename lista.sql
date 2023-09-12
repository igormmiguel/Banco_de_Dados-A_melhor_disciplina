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

-- 7 

select curso,count(a.id) as quantidade_alunos
from alunos a
join matriculas m on m.id  = a.id
group by curso;

-- 8

select produto,avg(receita) as media_produto
from vendas
group by produto;

-- 9

create VIEW receita_total as 
select produto, sum(receita) as receita_t
from vendas
group by produto;
select *
from receita_total
where receita_t >= "10000.00";

-- 10

create VIEW quantidade_livros as
select nome, count(autor_id) as total_livros_do_autor
from livros jkr
join autores a on a.id = jkr.autor_id
group by nome;
select * 
from quantidade_livros
where total_livros_do_autor >= 2;

-- 11

CREATE VIEW livros_autores as
select titulo,nome
from livros jkr
join autores a on a.id = jkr.autor_id;
select *
from livros_e_autores;

-- 12

create VIEW curso_aluno as
select nome, curso
from alunos a
right join matriculas m on m.id  = a.id;
select * 
from aluno_curso;

-- 13

insert into autores(id, nome, nascimento)
values (null,"JONAS","2002-12-05");
select nome, titulo
from  autores a
left join  livros jkr  on a.id = jkr.autor_id;

-- 14

select nome, curso
from alunos a
right join matriculas m on m.id  = a.id;

-- 15

select nome, curso
from alunos a
inner join matriculas m on m.id  = a.id;

-- 16

select nome as nome_autor, count(livros.id) as quantidade_livros
from autores
left join livros on autores.id = livros.autor_id
group by autores.id
order by quantidade_livros desc
LIMIT 1;

-- 17

select produto, sum(receita) as soma_da_receita
from vendas 
group by produto
having sum(receita) = (
	select min(total_da_receita)
    from (
		select produto, sum(receita) as total_da_receita
        from vendas 
        group by produto 
    ) as receita_produto
);

-- 19

select alunos.id as Aluno_ID,alunos.nome as Nome_Aluno,count(matriculas.id) as Numero_de_Matriculas
from alunos
left join  matriculas on alunos.id = matriculas.aluno_id
group by alunos.id, alunos.nome;

-- 20

select produto,count(produto) as transacoes
from vendas 
group by produto
order by transacoes desc
limit 1
;