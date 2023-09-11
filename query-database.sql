-- Mostra todos os cadastro ordenados por nome
SELECT Nome, Endereco, CEP, Telefone FROM Cadastro ORDER BY Nome;

-- Mostra todos os clientes ordenado por nome
SELECT CPF, Nome, Endereco, CEP, Telefone FROM Cadastro
	INNER JOIN PF ON Cadastro.ID = PF.IdPessoa
    ORDER BY Nome;

-- Mostra todos os fornecedores/vendedores ordenado por nome da empresa
SELECT CNPJ, NomeFantasia as Empresa, Endereco, CEP, Telefone FROM Cadastro
	INNER JOIN PJ ON Cadastro.ID = PJ.IdPessoa
    ORDER BY Empresa;

-- Mostra todos os produtos do fornecedor 7 'Hugo e Francisca Ferragens Ltda'
SELECT Nome, Descricao FROM Produto WHERE IdFornecedor = 9;

-- Mostra o estoque de produtos do vendedor 6 'Josefa e Hadassa Padaria ME'
SELECT p.Nome as Produto, f.NomeFantasia as Fornecedor, e.Quantidade as Disponível, Concat('R$ ', Round(e.ValorUnitario, 2)) as Valor, p.Descricao 
	FROM Produto as p 
    INNER JOIN PJ as f ON p.IdFornecedor = f.IdPessoa
    INNER JOIN (SELECT * FROM Estoque WHERE IdVendedor = 6) as e ON p.ID = e.IdProduto;

-- Mostra todos os pedidos ordenado por data da compra
SELECT ped.ID as 'Nº Pedido', c.Nome as Comprador, v.NomeFantasia as Vendedor, ped.Data, ped.Status
	FROM Pedido as ped
    INNER JOIN Cadastro as c ON ped.IdComprador = c.ID
    INNER JOIN PJ as v ON ped.IdVendedor = v.IdPessoa
    ORDER BY ped.Data;

-- Mostra o pedido nº 1
SELECT ped.Data, ped.Status, c.Nome as Comprador, v.NomeFantasia as Vendedor, p.Nome as Produto, ped.Quantidade, 
	CASE 
		WHEN pag.Parcelamento > 1 THEN Concat(pag.Tipo, " ", pag.Parcelamento, "x")
		ELSE pag.Tipo 
	END as Pagamento, 
	Concat('R$ ', Round((e.ValorUnitario * ped.Quantidade) + frt.Valor, 2)) as Total, 
    COALESCE(frt.CodigoRastreio, 'Não Enviado') as 'Código de Rastreiamento'
--
	FROM (SELECT * FROM Pedido WHERE ID = 3) as ped
    INNER JOIN Cadastro as c ON ped.IdComprador = c.ID
    INNER JOIN PJ as v ON ped.IdVendedor = v.IdPessoa
    INNER JOIN Produto as p ON ped.IdProduto = p.ID
    INNER JOIN Pagamento as pag ON ped.ID = pag.IdPedido
    INNER JOIN Estoque as e ON ped.IdProduto = e.IdProduto AND ped.IdVendedor = e.IdVendedor
    INNER JOIN Frete as frt ON ped.ID = frt.IdPedido;
    
-- Mostra o status de envio do 'CX898221001BR'
SELECT ped.ID as 'Nº Pedido', ped.Data as 'Data da Compra', ped.Status as 'Status da compra', frt.CodigoRastreio, frt.Status, frt.DataEnvio, frt.DataChegada
	FROM (SELECT * FROM Frete WHERE CodigoRastreio = "CX898221001BR") as frt
    INNER JOIN Pedido as ped ON frt.IdPedido = ped.ID;
    
-- Mostra a quantidade de pedidos por status
SELECT Count(*) as 'Nº', Status FROM Pedido GROUP BY Status;

-- Mostra qual vendedor vendeu mais
SELECT Count(*) as Vendas, v.NomeFantasia as Vendedor
	FROM Pedido as ped
	INNER JOIN PJ as v ON ped.IdVendedor = v.IdPessoa
    WHERE ped.Status = "Concluído"
    GROUP BY Vendedor
    ORDER BY Vendas DESC;

-- Mostra qual produto vendeu mais
SELECT Count(*) as Vendas, p.Nome as Produto
	FROM Pedido as ped
    INNER JOIN Produto as p ON ped.IdProduto = p.ID
    WHERE ped.Status = "Concluído"
    GROUP BY p.ID
    ORDER BY Vendas DESC;
    
-- Mostra os vendedores com vendas acima de R$ 1000
SELECT v.NomeFantasia as Vendedor, Concat('R$ ', Round(Sum(e.ValorUnitario * ped.Quantidade), 2)) as Faturamento
	FROM Pedido as ped
    INNER JOIN PJ as v ON ped.IdVendedor = v.IdPessoa
    INNER JOIN Estoque as e ON ped.IdVendedor = e.IdVendedor AND ped.IdProduto = e.IdProduto
	GROUP BY Vendedor
    HAVING Sum(e.ValorUnitario * ped.Quantidade) > 1000
    ORDER BY Faturamento DESC;

-- Deletar tudo
DROP DATABASE e_commerce;