--> Consulta 1: Selecione todos os registros da tabela "Livro" onde o gênero seja "Ficção" e o ano de publicação seja posterior a 2000.

USE Livro;
CREATE TABLE Livro (
    id INT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    editora VARCHAR(50),
    ano_publicacao INT,
    genero VARCHAR(50),
    isbn VARCHAR(20),
    quantidade_estoque INT
);
INSERT INTO Livro (id, titulo, autor, editora, ano_publicacao, genero, isbn, quantidade_estoque)
VALUES
    (1, 'Dom Casmurro', 'Machado de Assis', 'Editora A', 1899, 'Romance', '1234567890', 5),
    (2, 'A Menina que Roubava Livros', 'Markus Zusak', 'Editora B', 2005, 'Ficção', '9876543210', 8),
    (3, 'O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 'Editora C', 1954, 'Fantasia', '5678901234', 3),
    (4, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Editora D', 1997, 'Fantasia', '4321098765', 10),
    (5, '1984', 'George Orwell', 'Editora E', 1949, 'Ficção Distópica', '8765432109', 6),
    (6, 'OPequeno Príncipe', 'Antoine de Saint-Exupéry', 'Editora F', 1943, 'Fábula', '5432109876', 12),
    (7, 'Orgulho e Preconceito', 'Jane Austen', 'Editora G', 1813, 'Romance Clássico', '2109876543', 4),
    (8, 'A Revolução dos Bichos', 'George Orwell', 'Editora H', 1945, 'Ficção Política', '1098765432', 7),
    (9, 'O Hobbit', 'J.R.R. Tolkien', 'Editora C', 1937, 'Fantasia', '0987654321', 9),
    (10, 'Cem Anos de Solidão', 'Gabriel García Márquez', 'Editora I', 1967, 'Realismo Mágico', '4567890123', 3),
    (11, 'Crime e Castigo', 'Fiódor Dostoiévski', 'Editora J', 1866, 'Romance Psicológico', '7654321098', 11),
    (12, 'A Montanha Mágica', 'Thomas Mann', 'Editora K', 1924, 'Romance Filosófico', '5432109876', 5),
    (13, 'A Revolta de Atlas', 'Ayn Rand', 'Editora L', 1957, 'Romance Filosófico', '9876543210', 2),
    (14, 'Admirável Mundo Novo', 'Aldous Huxley', 'Editora M', 1932, 'Ficção Distópica', '2109876543', 6),
    (15, 'O Retrato de Dorian Gray', 'Oscar Wilde', 'Editora N', 1890, 'Ficção Gótica', '6543210987', 4);

SELECT*,1 as teste
from Livro
WHERE genero = 'Ficção'
and ano_publicacao > 2000;

-->  Consulta 2: Selecione todos os registros da tabela "Livro" onde o gênero seja "Romance" ou "Fábula".
SELECT*
from Livro
WHERE 
	genero = 'Romance'
	or genero = 'Fábula'
;

-->   Consulta 3: Selecione todos os registros da tabela "Livro" onde a editora seja "Editora A", "Editora B" ou "Editora C".
SELECT*
from Livro
WHERE
	editora = 'Editora A' or 
	editora = 'Editora B' or
	editora = 'Editora C';

--> Consulta 4: Selecione todos os registros da tabela "Livro" onde o ano de publicação esteja entre 1950 e 1990, inclusive.

SELECT*
from Livro
WHERE
	ano_publicacao BETWEEN 1950 and 1990;

--> Consulta 5: Selecione todos os registros da tabela "Livro" e inclua uma coluna adicional chamada "estoque_duplicado" que apresente o dobro da quantidade de exemplares em estoque para cada livro.
SELECT*, quantidade_estoque*2 as estoque_duplicado
from Livro;

--> Consulta 6: Selecione todos os registros da tabela "Livro" e inclua uma coluna adicional chamada "estoque_terco" que apresente a quantidade de exemplares em estoque dividida por 3 para cada livro.
SELECT*, quantidade_estoque/3 as estoque_terco
from Livro;

-->  Consulta 7: Selecione todos os registros da tabela "Livro" onde o ano de publicação seja um múltiplo de 5.
SELECT*
from Livro
WHERE ano_publicacao like '%5' or ano_publicacao like '%0';

--> Consulta 8: Selecione todos os registros da tabela "Livro" onde o gênero seja "Fantasia" ou "Ficção Distópica" e a quantidade de exemplares em estoque seja maior que 5.
SELECT*
from Livro
WHERE ( genero = 'Fantasia' or genero = 'Ficção Distópica' ) and quantidade_estoque > 5;

-->  Consulta 9: titulo, autor, editora, ano_publicacao dos Livros de Ficção Publicados após 2005 e com estoque disponível
SELECT titulo, autor, editora, ano_publicacao 
FROM Livro
WHERE ano_publicacao > 2005 and quantidade_estoque > 0;

--> Consulta 10:  titulo, autor, genero, isbn dos Livros de Romance ou Drama da Editora X e que possuem ISBN cadastrado
SELECT Titulo, autor, genero, isbn
FROM Livro
Where editora = 'Editora X' and isbn is not null;

--> Consulta 11: titulo, autor, genero, quantidade_estoque dos Livros de Fantasia com mais de 5 unidades em estoque e ano de publicação entre 2000 e 2010
SELECT Titulo, autor, genero, quantidade_estoque
FROM Livro
WHERE quantidade_estoque > 5 and ano_publicacao between 2000 and 2010;


select from livro;


select *
from Livro;