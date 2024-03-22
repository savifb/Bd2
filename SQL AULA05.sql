--> Consulta 1: Selecione todos os registros da tabela "Livro" onde o g�nero seja "Fic��o" e o ano de publica��o seja posterior a 2000.

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
    (2, 'A Menina que Roubava Livros', 'Markus Zusak', 'Editora B', 2005, 'Fic��o', '9876543210', 8),
    (3, 'O Senhor dos An�is: A Sociedade do Anel', 'J.R.R. Tolkien', 'Editora C', 1954, 'Fantasia', '5678901234', 3),
    (4, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Editora D', 1997, 'Fantasia', '4321098765', 10),
    (5, '1984', 'George Orwell', 'Editora E', 1949, 'Fic��o Dist�pica', '8765432109', 6),
    (6, 'OPequeno Pr�ncipe', 'Antoine de Saint-Exup�ry', 'Editora F', 1943, 'F�bula', '5432109876', 12),
    (7, 'Orgulho e Preconceito', 'Jane Austen', 'Editora G', 1813, 'Romance Cl�ssico', '2109876543', 4),
    (8, 'A Revolu��o dos Bichos', 'George Orwell', 'Editora H', 1945, 'Fic��o Pol�tica', '1098765432', 7),
    (9, 'O Hobbit', 'J.R.R. Tolkien', 'Editora C', 1937, 'Fantasia', '0987654321', 9),
    (10, 'Cem Anos de Solid�o', 'Gabriel Garc�a M�rquez', 'Editora I', 1967, 'Realismo M�gico', '4567890123', 3),
    (11, 'Crime e Castigo', 'Fi�dor Dostoi�vski', 'Editora J', 1866, 'Romance Psicol�gico', '7654321098', 11),
    (12, 'A Montanha M�gica', 'Thomas Mann', 'Editora K', 1924, 'Romance Filos�fico', '5432109876', 5),
    (13, 'A Revolta de Atlas', 'Ayn Rand', 'Editora L', 1957, 'Romance Filos�fico', '9876543210', 2),
    (14, 'Admir�vel Mundo Novo', 'Aldous Huxley', 'Editora M', 1932, 'Fic��o Dist�pica', '2109876543', 6),
    (15, 'O Retrato de Dorian Gray', 'Oscar Wilde', 'Editora N', 1890, 'Fic��o G�tica', '6543210987', 4);

SELECT*,1 as teste
from Livro
WHERE genero = 'Fic��o'
and ano_publicacao > 2000;

-->  Consulta 2: Selecione todos os registros da tabela "Livro" onde o g�nero seja "Romance" ou "F�bula".
SELECT*
from Livro
WHERE 
	genero = 'Romance'
	or genero = 'F�bula'
;

-->   Consulta 3: Selecione todos os registros da tabela "Livro" onde a editora seja "Editora A", "Editora B" ou "Editora C".
SELECT*
from Livro
WHERE
	editora = 'Editora A' or 
	editora = 'Editora B' or
	editora = 'Editora C';

--> Consulta 4: Selecione todos os registros da tabela "Livro" onde o ano de publica��o esteja entre 1950 e 1990, inclusive.

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

-->  Consulta 7: Selecione todos os registros da tabela "Livro" onde o ano de publica��o seja um m�ltiplo de 5.
SELECT*
from Livro
WHERE ano_publicacao like '%5' or ano_publicacao like '%0';

--> Consulta 8: Selecione todos os registros da tabela "Livro" onde o g�nero seja "Fantasia" ou "Fic��o Dist�pica" e a quantidade de exemplares em estoque seja maior que 5.
SELECT*
from Livro
WHERE ( genero = 'Fantasia' or genero = 'Fic��o Dist�pica' ) and quantidade_estoque > 5;

-->  Consulta 9: titulo, autor, editora, ano_publicacao dos Livros de Fic��o Publicados ap�s 2005 e com estoque dispon�vel
SELECT titulo, autor, editora, ano_publicacao 
FROM Livro
WHERE ano_publicacao > 2005 and quantidade_estoque > 0;

--> Consulta 10:  titulo, autor, genero, isbn dos Livros de Romance ou Drama da Editora X e que possuem ISBN cadastrado
SELECT Titulo, autor, genero, isbn
FROM Livro
Where editora = 'Editora X' and isbn is not null;

--> Consulta 11: titulo, autor, genero, quantidade_estoque dos Livros de Fantasia com mais de 5 unidades em estoque e ano de publica��o entre 2000 e 2010
SELECT Titulo, autor, genero, quantidade_estoque
FROM Livro
WHERE quantidade_estoque > 5 and ano_publicacao between 2000 and 2010;


select from livro;


select *
from Livro;