CREATE TABLE CLIENTE (
    codigo int primary key,
    dt_nascimento DATE, 
    nome varchar(50), 
);
CREATE TABLE TELEFONE (
    codigo int primary key,
    tipo varchar(10),
    numero int,
);
CREATE TABLE POSSUIR(
    cod_cliente int,
    cod_telefone int,
    FOREIGN KEY(cod_cliente) REFERENCES CLIENTE (codigo),
    FOREIGN KEY(cod_telefone) REFERENCES TELEFONE(codigo),
);

CREATE TABLE CONTA(
    codigo int primary key,
    saldo float,
    tipo varchar(45),
);
CREATE TABLE PESSOA_FISICA(
    codigo int, 
    cpf varchar(15),
    nome varchar(100),
    FOREIGN key (codigo) REFERENCES CONTA (codigo)
);
CREATE TABLE PESSOA_JURIDICA(
    codigo int, 
    cnpj varchar(15),
    razao_social varchar(100),
    FOREIGN key (codigo) REFERENCES CONTA (codigo)
);
CREATE TABLE ESTOQUE(
    id int primary key, 
    produto varchar(50),
    qtd int,
);
CREATE TABLE CLIENTE(
    id int PRIMARY key, 
    cpf varchar(14), 
    telefone int, 
    endereco varchar(100), 
    nome varchar(100), 
);
CREATE TABLE PEDIDO(
    ID INT PRIMARY KEY, 
    CLIENTE VARCHAR(100), 
    PRODUTO VARCHAR(100), 
    VALOR FLOAT, 
    FORMPAGAMENTO VARCHAR(100), 
    Data_pag date
); 

CREATE TABLE ALUNO (
    matricula int primary key, 
    nome varchar(100),
    rua varchar(200), 
);

CREATE TABLE ALUNOS_DA_BANDA(
    MATRICULA INT, 
    INSTRUMENTO VARCHAR(60), 
    dt_ingresso datetime, 
    FOREIGN KEY(MATRICULA) REFERENCES ALUNO(matricula)
); 


INSERT INTO ALUNO (MATRICULA, NOME) VALUES
(1, 'Naruto'),
(2, 'Sasuke'),
(3, 'Sakura'),
(4, 'Kakashi'),
(5, 'Hinata');

INSERT INTO ALUNOS_DA_BANDA (MATRICULA, INSTRUMENTO, dt_ingresso) VALUES
(1, 'Piano', '2022-01-01'),
(2, 'Bateria', '2022-01-01'),
(3, 'Guitarra', '2022-01-01'),
(4, 'Baixo', '2022-01-01'),
(5, 'Violino', '2022-01-01');

UPDATE ALUNOS_DA_BANDA SET dt_ingresso = '2023-01-01';

SELECT * FROM ALUNOS_DA_BANDA WHERE INSTRUMENTO IN ('Piano', 'Bateria');

SELECT * FROM ALUNO ORDER BY NOME ASC;

CREATE TABLE PRODUTO(
    codigo_produto int primary key, 
    descricao varchar(60), 
    valor_unitario int, 
    qtd_estoque integer
);
CREATE TABLE PEDIDO (
    NUMERO_PEDIDO INT PRIMARY KEY, 
    data_pedido date, 
    valor float
);
CREATE TABLE DETALHES_PEDIDOS(
    numero_pedido int, 
    cod_produto int, 
    qtd int, 
    FOREIGN KEY (numero_pedido) REFERENCES PEDIDO(NUMERO_PEDIDO),
    FOREIGN KEY (cod_produto) REFERENCES PRODUTO(codigo_produto)
);
INSERT INTO PRODUTO (codigo_produto, descricao, valor_unitario, qtd_estoque) VALUES
(1, 'Bola de Futebol', 50, 100),
(2, 'Raquete de Tênis', 120, 50),
(3, 'Bicicleta', 500, 30),
(4, 'Tênis de Corrida', 200, 80),
(5, 'Luvas de Boxe', 75, 60);

INSERT INTO PEDIDO (NUMERO_PEDIDO, data_pedido, valor) VALUES
(1, '2023-01-01', 500.00),
(2, '2023-02-01', 600.00),
(3, '2023-03-01', 700.00),
(4, '2023-04-01', 800.00),
(5, '2023-05-01', 900.00);

INSERT INTO DETALHES_PEDIDOS (numero_pedido, cod_produto, qtd) VALUES
(1, 1, 10),
(2, 2, 5),
(3, 3, 2),
(4, 4, 4),
(5, 5, 6);

UPDATE PRODUTO SET valor_unitario = valor_unitario * 1.1;

DELETE FROM DETALHES_PEDIDOS WHERE numero_pedido IN (SELECT NUMERO_PEDIDO FROM PEDIDO WHERE data_pedido < '2023-01-01');
DELETE FROM PEDIDO WHERE data_pedido < '2023-01-01';

SELECT * FROM PRODUTO WHERE descricao LIKE 'A%';

SELECT * FROM PEDIDO WHERE YEAR(data_pedido) = 2023 ORDER BY data_pedido ASC;

SELECT * FROM PEDIDO WHERE data_pedido BETWEEN '2023-01-01' AND '2023-04-30';

CREATE TABLE PROFESSOR (
    cod_professor int primary key, 
    nome varchar(150) not NULL
);

CREATE TABLE CURSO(
    Cod_Curso int primary key, 
    Cod_Professor int not null,
    descricao varchar (100) not null, 
    qtd_alunos int not NULL, 
    FOREIGN KEY (Cod_Professor) REFERENCES PROFESSOR(Cod_Professor)
);

ALTER TABLE ALUNO ADD Cod_Curso int NOT NULL;

ALTER TABLE ALUNO ADD Cod_Professor int not null;

ALTER TABLE ALUNO ADD data_nascimento date not null;

ALTER TABLE ALUNO ADD CONSTRAINT FK_ALUNO_PROFESSOR FOREIGN KEY (cod_professor) REFERENCES PROFESSOR(Cod_professor);

ALTER TABLE ALUNO ADD CONSTRAINT FK_ALUNO_CURSO FOREIGN KEY (Cod_Curso) REFERENCES CURSO(Cod_Curso);


INSERT INTO ALUNO (matricula, nome, data_nascimento, Cod_Curso, Cod_Professor)
VALUES 
(11, 'Yuji Itadori', '2003-01-01', 1, 1),
(21, 'Megumi Fushiguro', '2002-01-01', 1, 1),
(31, 'Nobara Kugisaki', '2003-01-01', 1, 1),
(41, 'Satoru Gojo', '2000-01-01', 2, 2),
(51, 'Sukuna', '1999-01-01', 2, 2),
(61, 'Maki Zenin', '2003-01-01', 1, 1),
(71, 'Toge Inumaki', '2002-01-01', 1, 1),
(81, 'Panda', '2003-01-01', 1, 1),
(91, 'Yuta Okkotsu', '2000-01-01', 2, 2),
(101, 'Aoi Todo', '1999-01-01', 2, 2);


INSERT INTO PROFESSOR (cod_professor, nome)
VALUES 
(1, 'Masamichi Yaga'),
(2, 'Yoshinobu Gakuganji'),
(3, 'Utahime Iori'),
(4, 'Shoko Ieiri'),
(5, 'Kiyotaka Ijichi');


INSERT INTO CURSO (Cod_Curso, Cod_Professor, descricao, qtd_alunos)
VALUES 
(1, 1, 'Curso de Jujutsu', 5),
(2, 2, 'Curso Avançado de Jujutsu', 5);

DELETE FROM ALUNO WHERE matricula = 10;


UPDATE CURSO SET qtd_alunos = qtd_alunos - 1 
WHERE Cod_Curso IN (SELECT Cod_Curso FROM ALUNO WHERE matricula = 10);

SELECT * FROM ALUNO WHERE DATEDIFF(year, data_nascimento, GETDATE()) > 18;

SELECT * FROM ALUNO WHERE Cod_Curso IN (8, 40);

CREATE TABLE PRODUTO(
    IDPRODUTO INT PRIMARY KEY, 
    DESCRICAO VARCHAR(100),
);

CREATE TABLE ITEMPEDIDO(
    idItemPedido int PRIMARY KEY, 
    id_produto int, 
    precoUnitario float, 
    qtd int, 
    precoTotal float,
    FOREIGN KEY(id_produto) REFERENCES PRODUTO(cod_produto),
);

CREATE TABLE CLIENTE(
    idCliente int primary key,
    usuario varchar(8), 
    senha varchar(12), 
    email varchar (70),
);
CREATE TABLE PEDIDO(
    idPedido int primary key,
    itemPedido_id int,
    cliente_id int, 
    dt_pedido date,
    valor_total float,
    FOREIGN KEY(itemPedido_idPedido) REFERENCES ITEMPEDIDO(idItemPedido),
    FOREIGN KEY (Cliente_id) REFERENCES CLIENTE(idCliente)
)


ALTER TABLE CLIENTE ADD DataCadastro int; 
ALTER TABLE CLIENTE ADD DataUltimaAtualização int;  
ALTER TABLE CLIENTE ADD SENHA VARCHAR(36);


ALTER TABLE PEDIDO ADD NumeroNotaFiscal int; 

ALTER TABLE PRODUTO ADD DataCadastro date; 


INSERT INTO CLIENTE (idCliente, usuario, senha, email)
VALUES 
(1, 'Ninja1', 'senha1', 'ninja1@yahoo.com'),
(2, 'Samurai1', 'senha2', 'samurai1@gmail.com'),
(3, 'Ninja2', 'senha3', 'ninja2@yahoo.com'),
(4, 'Samurai2', 'senha4', 'samurai2@gmail.com'),
(5, 'Ninja3', 'senha5', 'ninja3@yahoo.com');

INSERT INTO PRODUTO (IDPRODUTO, DESCRICAO)
VALUES 
(1, 'Katana'),
(2, 'Shuriken'),
(3, 'Nunchaku'),
(4, 'Kunai'),
(5, 'Tanto'),
(6, 'Sai');

INSERT INTO PEDIDO (idPedido, itemPedido_id, cliente_id, dt_pedido, valor_total)
VALUES 
(1, 1, 1, '2022-01-01', 10),
(2, 2, 2, '2022-01-02', 20),
(3, 3, 3, '2022-01-03', 30),
(4, 4, 4, '2022-01-04', 40),
(5, 5, 5, '2022-01-05', 50),
(6, 6, 1, '2022-01-06', 60);


INSERT INTO ITEMPEDIDO (idItemPedido, id_produto, precoUnitario, qtd, precoTotal)
VALUES 
(1, 1, 10, 1, 10),
(2, 2, 10, 2, 20),
(3, 3, 10, 3, 30),
(4, 4, 10, 4, 40),
(5, 5, 10, 5, 50),
(6, 6, 10, 6, 60);

SELECT * FROM CLIENTE WHERE email LIKE '%@yahoo.com' OR email LIKE '%@gmail.com';

SELECT * FROM PEDIDO WHERE valor_total < 10 AND dt_pedido BETWEEN '2022-01-01' AND '2022-12-31';

SELECT id_produto, COUNT(*) as count FROM ITEMPEDIDO GROUP BY id_produto ORDER BY count DESC;

SELECT * FROM PRODUTO WHERE DESCRICAO NOT LIKE 'A%' AND DESCRICAO LIKE '%O';

CREATE TABLE TIPODEIMOVEL(
    IDTIPOIMOVEL INT PRIMARY KEY,
    TIPOIMOVEL VARCHAR(50)
);
CREATE TABLE CIDADE(
    CODCIDADE INT PRIMARY KEY, 
    CIDADE VARCHAR(20), 
    CAMPO VARCHAR(50)
)
CREATE TABLE PRAIA(
    IDPRAIA INT PRIMARY KEY, 
    NMPRAIA INT
);
CREATE TABLE PROPRIETARIO(
    IDPROPRIETARIO INT PRIMARY KEY, 
    NOME VARCHAR(100),
    RG INT
);
CREATE TABLE IMOVEL(
    NRIMOVEL INT PRIMARY KEY, 
    qtd_quartos int,
    qtd_banheiro int, 
    VistaParaMar boolean, 
    endereco varchar(100),
    IDTIPOIMOVEL INT, 
    CODCIDADE INT, 
    IDPRAIA INT, 
    IDPROPRIETARIO INT
    FOREIGN KEY(IDTIPOIMOVEL) REFERENCES TIPODEIMOVEL(IDTIPOIMOVEL)
    FOREIGN KEY(CODCIDADE) REFERENCES CIDADE(CODCIDADE)
    FOREIGN KEY(IDPRAIA) REFERENCES PRAIA(IDPRAIA)
    FOREIGN KEY(IDPROPRIETARIO) REFERENCES PROPRIETARIO(IDPROPRIETARIO)
);
CREATE TABLE INQUILINO(
    CODINQUILINO INT PRIMARY KEY, 
    nome varchar(100),
    cpf varchar(15)
);
CREATE TABLE MOBILIA(
    CODMOBILIA INT PRIMARY KEY, 
    DESCRICAO VARCHAR(100)
);
CREATE TABLE CONTRATOALUGUE(
    NRCONTRATO INT PRIMARY KEY, 
    NRIMOVEL INT, 
    CODINQUILINO INT, 
    FOREIGN KEY(NRIMOVEL) REFERENCES IMOVEL(NRIMOVEL),
    FOREIGN KEY(CODINQUILINO) REFERENCES INQUILINO(CODINQUILINO),
    DataContrato date, 
    cpf varchar(15),
    dt_inicio date, 
    dt_fim date,
    valoraluguel FLOAT
);
CREATE TABLE ITENSMOBILIA(
    CODITENSMOBILIA INT PRIMARY KEY, 
    CODMOBILIA INT, 
    NRIMOVEL INT, 
    FOREIGN KEY(CODMOBILIA) REFERENCES MOBILIA(CODMOBILIA),
    FOREIGN KEY(NRIMOVEL) REFERENCES IMOVEL(NRIMOVEL)
);
INSERT INTO MOBILIA (CODMOBILIA, DESCRICAO)
VALUES 
(1, 'QUADRO'),
(2, 'ESTANTE'),
(3, 'TV');

INSERT INTO CONTRATOALUGUE (NRCONTRATO, NRIMOVEL, CODINQUILINO, DataContrato, cpf, dt_inicio, dt_fim, valoraluguel)
VALUES 
(1, 1, 1, '2022-01-01', '123.456.789-00', '2022-01-01', '2023-01-01', 1000),
(2, 2, 2, '2022-02-01', '999.537.323-20', '2022-02-01', '2023-02-01', 2000),
(3, 3, 3, '2022-03-01', '887.829.742-34', '2022-03-01', '2023-03-01', 3000);

INSERT INTO ITENSMOBILIA (CODITENSMOBILIA, CODMOBILIA, NRIMOVEL)
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

SELECT * 
FROM IMOVEL i
JOIN CONTRATOALUGUE c ON i.NRIMOVEL = c.NRIMOVEL
WHERE i.CIDADE = 'Goiânia' 
AND c.dt_inicio <= CURRENT_DATE
AND c.dt_fim >= CURRENT_DATE 
AND i.IDPRAIA IS NOT NULL;