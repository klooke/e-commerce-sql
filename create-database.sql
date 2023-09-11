-- Cria e acessa o banco de dados
CREATE DATABASE e_commerce;
USE e_commerce;

-- Cria as tabelas
CREATE TABLE Cadastro (
	ID int NOT NULL AUTO_INCREMENT,
    Nome varchar(150) NOT NULL,
    Endereco varchar(255) NOT NULL,
    CEP char(8) NOT NULL,
    Telefone varchar(11) NOT NULL,
    IsPJ boolean DEFAULT false,
    
    PRIMARY KEY (ID)
);

CREATE TABLE PJ (
	IdPessoa int,
    NomeFantasia varchar(150) NOT NULL,
    CNPJ char(14) NOT NULL UNIQUE,
    
    FOREIGN KEY (IdPessoa) REFERENCES Cadastro(ID) ON DELETE CASCADE
);

CREATE TABLE PF (
	IdPessoa int,
    CPF char(11) NOT NULL UNIQUE,
    
    FOREIGN KEY (IdPessoa) REFERENCES Cadastro(ID) ON DELETE CASCADE
);

CREATE TABLE Produto (
	ID int NOT NULL AUTO_INCREMENT,
    IdFornecedor int,
    Nome varchar(150) NOT NULL,
    Descricao varchar(255),
    
    PRIMARY KEY (ID),
    FOREIGN KEY (IdFornecedor) REFERENCES PJ(IdPessoa) ON DELETE CASCADE
);

CREATE TABLE Estoque (
	IdProduto int,
    IdVendedor int,
    Quantidade int UNSIGNED DEFAULT 0,
    valorUnitario float UNSIGNED DEFAULT 0.0,
    
    FOREIGN KEY (IdProduto) REFERENCES Produto(ID) ON DELETE CASCADE,
    FOREIGN KEY (IdVendedor) REFERENCES PJ(IdPessoa) ON DELETE CASCADE
);

CREATE TABLE Pedido (
	ID int NOT NULL AUTO_INCREMENT,
    IdComprador int,
    IdVendedor int,
    IdProduto int,
    Quantidade int UNSIGNED DEFAULT 0,
    Data date NOT NULL,
    Status enum("Processando", "Concluído", "Cancelado") NOT NULL DEFAULT "Processando",
    
    PRIMARY KEY (ID),
    FOREIGN KEY (IdComprador) REFERENCES Cadastro(ID) ON DELETE CASCADE,
    FOREIGN KEY (IdVendedor) REFERENCES Estoque(IdVendedor),
    FOREIGN KEY (IdProduto) REFERENCES Estoque(IdProduto)
);

CREATE TABLE Pagamento (
	IdPedido int,
    Tipo enum("Pix", "Cartão") NOT NULL DEFAULT "Pix",
    Parcelamento int UNSIGNED DEFAULT 1,
    Juros float UNSIGNED DEFAULT 1.0,
    
    FOREIGN KEY (IdPedido) REFERENCES Pedido(ID) ON DELETE CASCADE,
    CONSTRAINT CHK_Parcelas CHECK (Parcelamento > 1),
    CONSTRAINT CHK_Juros CHECK (Juros > 1.0)
);

CREATE TABLE Frete (
	IdPedido int,
    CodigoRastreio char(13),
    Valor float UNSIGNED DEFAULT 0.0,
    Status enum("Não enviado", "Preparando o pacote", "A caminho", "Saiu pra Entrega", "Entregue") NOT NULL DEFAULT "Não enviado",
    DataEnvio date,
    DataChegada date,
    
    FOREIGN KEY (IdPedido) REFERENCES Pedido(ID) ON DELETE CASCADE
);