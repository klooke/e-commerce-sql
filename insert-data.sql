USE e_commerce;

-- Clientes
INSERT INTO Cadastro(Nome, Endereco, CEP, Telefone) VALUES 
	("Samuel McMinn", "Quadra QR 323 Conjunto 13, 492 Samambaia-DF", "72309613", "6150348119"), -- id 1
	("Riley Stanton", "Avenida Robert Kennedy, 594 São Paulo-SP", "04768000", "1145528435"), -- id 2
	("Tomás Gomes Almeida", "Rua do José Inácio, 232 Guarulhos-SP", "07244070", "1156405276"), -- id 3
	("Julian Carvalho Costa", "Rua Joaquim Leitão, 802 Fortaleza-CE", "60360840", "8553839770"), -- id 4
	("Raissa Barros Ferreira", "Rua Correio Brasiliense, 1516 Rio de Janeiro-RJ", "22715190", "2124403279"); -- id 5
    
INSERT INTO PF VALUES
	(1, "74846121038"),
	(2, "80512008299"),
	(3, "70776905805"),
	(4, "11663998183"),
	(5, "28363520195");
    
-- Fornecedores/Vendedores
INSERT INTO Cadastro(Nome, Endereco, CEP, Telefone, IsPJ) VALUES 
	("Giovana Santos Cavalcanti", "Alameda José Caetano Ferreira Munhoz, 744 Taubaté-SP", "12086050", "1227487506", true), -- id 6
	("Mateus Gomes Alves", "Avenida Marginal, 684 Jundiaí-SP", "13209420", "1126709884", true), -- id 7
	("Aline Correia Melo", "Rua Pietro Lotti, 599 São Paulo-SP", "04455110", "1138620137", true), -- id 8
	("Vinicius Melo Almeida", "Avenida Doutor Roberto Moreira km 1, 360 Paulínia-SP", "13148904", "1936065373", true), -- id 9
	("Davi Oliveira Dias", "Rua Mananga, 580 Itaquaquecetuba-SP", "08598313", "1135400926", true); -- id 10
    
INSERT INTO PJ VALUES
	(6, "Josefa e Hadassa Padaria ME", "99604076000193"),
	(7, "Hugo e Francisca Ferragens Ltda", "01965542000161"),
	(8, "Luna e Iago Filmagens Ltda", "46956274000150"),
	(9, "Juan e Antonella Pães e Doces ME", "49267134000162"),
	(10, "Bruna e Danilo Pizzaria ME", "19594617000100");
    
-- Produtos
INSERT INTO Produto(IdFornecedor, Nome, Descricao) VALUES 
	(9, "Pão de cocô", "Pão com recheio de doce de cocô."), -- id 1
	(9, "Bolo da moça", "Tradicional bolo da moça."), -- id 2
	(9, "Pão frânces", "Tradicional pão frânces."), -- id 3
	(9, "Bolo de chocolate", "Tradicional bolo de chocolate."), -- id 4
	(9, "Pé de moleque", "Tradicional doce pé de moloque."), -- id 5
	(7, "Trilho Stanley para Porta de Correr 2m Alumínio Prata", NULL), -- id 6
	(7, "Porta Boiserie Colméia Branca 2,10x0,70m Artens", NULL), -- id 7
	(7, "Vídeo Porteiro Prata e Preto Allo WT7 Lite Intelbras", NULL), -- id 8
	(7, "Dobradica Silvana 850 F.polido 2", NULL), -- id 9
	(7, "Formão 150mmx20mm Dexter", NULL); -- id 10
    
-- Estoque
INSERT INTO Estoque VALUES 
	(3, 6, 60, 0.45), -- Josefa e Hadassa Padaria ME
	(2, 6, 60, 1.45), -- Josefa e Hadassa Padaria ME
	(9, 7, 150, 15.30), -- Hugo e Francisca Ferragens Ltda
	(10, 7, 10, 150.0), -- Hugo e Francisca Ferragens Ltda
	(8, 7, 20, 1600.0), -- Hugo e Francisca Ferragens Ltda
	(7, 7, 2, 735.0), -- Hugo e Francisca Ferragens Ltda
	(2, 9, 6, 1.30), -- Juan e Antonella Pães e Doces ME
	(1, 9, 120, 0.75), -- Juan e Antonella Pães e Doces ME
	(4, 9, 10, 1.20), -- Juan e Antonella Pães e Doces ME
	(5, 9, 60, 1.0); -- Juan e Antonella Pães e Doces ME
    
-- Pedidos
INSERT INTO Pedido(IdComprador, IdVendedor, IdProduto, Quantidade, Data, Status) VALUES 
	(5, 9, 5, 10, "2021-12-09", "Concluído"), -- id 1, Compra feita por Raissa Barros Ferreira
	(4, 7, 7, 4, "2023-01-19", "Concluído"), -- id 2, Compra feita por Julian Carvalho Costa
	(3, 7, 10, 1, "2023-04-09", "Cancelado"), -- id 3, Compra feita por Tomás Gomes Almeida
	(2, 6, 2, 1, "2023-10-08", "Concluído"), -- id 4, Compra feita por Riley Stanton
	(1, 6, 3, 10, "2023-10-09", "Concluído"); -- id 5, Compra feita por Samuel McMinn

-- Pagamentos
INSERT INTO Pagamento VALUES
    (1, "Pix", NULL, NULL),
	(2, "Cartão", 12, 1.2),
    (3, "Pix", NULL, NULL),
    (4, "Pix", NULL, NULL),
    (5, "Pix", NULL, NULL);

-- Frete
INSERT INTO Frete VALUES
    (1, "CX898221001BR", 17.89, "Entregue", "2021-12-10", "2021-12-15"),
    (2, "CX912223001BR", 10.99, "Entregue", "2023-01-21", "2023-02-01"),
	(3, NULL, 0, "Não enviado", NULL, NULL),
    (4, "CX932567001BR", 13.99, "A caminho", "2023-10-09", NULL),
	(5, NULL, 25.30, "Preparando o pacote", NULL, NULL);
