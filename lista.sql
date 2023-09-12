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