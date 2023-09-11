# E-commerce

 Desafio de modelagem de dados para um e-commerce.

## Requisitos:
- Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos (terceiros).
- Cada produto possui um fornecedor.
- Um ou mais produtos podem compor um pedido.
- O cliente pode se cadastrar no site com seu CPF ou CNPJ.
- O endereço do cliente irá determinar o valor do frete.
- Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.
- O pedidos são criados por clientes e possuem informações de compra, endereço e status de entrega.
- Um produto ou mais compoem o pedido.
- O pedido pode ser cancelado.


## Objetivo do desafio #1 (Refinamento):
- [x] Cliente PJ e PF - Uma conta pode ser PJ ou PF, mas não pode ter as duas informações.
- [x] Pagamento - Pode ter cadastrado mais de uma forma de pagamento.
- [x] Entrega - Possui status e código de rastreio.

## Diagrama EER:

<img title="Diagrama EER" alt="Diagrama EER" src="diagrama-EER.png">

## Objetivo do desafio #2 (Modelagem Física):
- [x] Recuperações simples com SELECT Statement
- [x] Filtros com WHERE Statement
- [x] Crie expressões para gerar atributos derivados
- [x] Defina ordenações dos dados com ORDER BY
- [x] Condições de filtros aos grupos – HAVING Statement
- [x] Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

### Querys:
- Todos os cadastro ordenados por nome (ORDER BY).
- Todos os clientes ordenado por nome (JOIN e ORDER BY).
- Todos os PJs ordenado por nome da empresa (JOIN e ORDER BY).
- Todos os produtos do fornecedor X (WHERE).
- Todo o estoque de produtos do vendedor X (JOIN e WHERE).
- Todos os pedidos ordenado por data da compra (JOIN e ORDER BY).
- Cada pedido por número com atributos derivados (WHERE e JOIN).
- Cada status de entrega pelo código de rastreamento (WHERE e JOIN).
- Todos os pedidos por status (GROUP BY).
- Todas os vendas por produto e vendedor (GROUP BY e ORDER BY).
- Agrupa todos os vendedores com a soma das vendas acima de R$ 1000 (JOIN, GROUP BY, HAVING e ORDER BY). 