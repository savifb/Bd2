
CREATE TABLE categoria(
	codigo int primary key,
	nome varchar(50),

);
CREATE TABLE fornecedor(
	codigo int primary key,
	nome varchar(80) not null,
	endereco varchar(200) null,
	telefone varchar(20) not null
);

CREATE TABLE produto(
	codigo int primary key identity,
	nome varchar(80) not null,
	precoUnitario decimal(10, 2),
	codigo_fornecedor int,
	codigo_categoria int,
	foreign key (codigo_fornecedor) references fornecedor(codigo),
	foreign key (codigo_categoria) references categoria(codigo)
);



