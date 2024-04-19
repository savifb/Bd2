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
    MATRICULA INT PRIMARY KEY, 
    INSTRUMENTO VARCHAR(60), 
    dt_ingresso datetime, 
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
    codigo_produto int, 
    descricao varchar(60), 
    valor_unitario int, 
    qtd_estoque integer
);
CREATE TABLE PEDIDO (
    NUMERO_PEDIDO INT, 
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