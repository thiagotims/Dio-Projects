-- Realizando queries

USE ecommerce;

SHOW TABLES;
DESC cliente;
DESC endereco;
DESC entrega;
DESC estoque;
DESC fornecedor;
DESC pagamento;
DESC pedido;
DESC pf;
DESC pj;
DESC produto;
DESC produtoEstoque;
DESC produtoFornecedor;
DESC produtoPedido;
DESC produtoVendedor;
DESC terceiroVendedor;

-- Recuperações simples com SELECT Statement
-- Recuperação dos dados da tabela 'pedido'
SELECT *
	FROM pedido;
-- Recuperação dos dados da tabela 'pagamento'
SELECT * 
	FROM pagamento;

-- Filtros com WHERE Statement
-- Qual o id dos clientes do tipo PF?
SELECT * 
	FROM cliente WHERE tipo = 'PF';
-- Qual os locais onde a quantidade em estoque é maior ou igual a 130?
-- Qual a quantidade em cada um desses locais?
SELECT local, quantidade
	FROM estoque
		WHERE quantidade >= 130;

-- Crie expressões para gerar atributos derivados
-- Qual a média de valor dos produtos?
SELECT AVG(valor) AS 'Média de valor dos produtos'
	FROM produto;
-- Qual a média de valor do frete?
SELECT AVG(frete) AS 'Média de valor do frete'
	FROM pedido;

-- Defina ordenações dos dados com ORDER BY
-- Qual a relação dos produtos, por categoria, em ordem descrescente de valor?
SELECT descricao, categoria, valor
	FROM produto
		GROUP BY categoria
			ORDER BY valor DESC;
-- Quantos pedidos existem em cada status do pedido? Ordene em ordem decrescente do valor do frete.
SELECT idPCliente, frete, statusPedido, count(statusPedido) AS 'Quantidade no Status'
	FROM pedido
		GROUP BY statusPedido
			ORDER BY frete DESC;

-- Condições de filtros aos grupos – HAVING Statement
-- Quais são as categorias e produtos com valor maior ou igual a 253? Ordene em ordem decrescente.
SELECT categoria, descricao, valor 
	FROM Produto 
		GROUP BY categoria 
			HAVING valor >= 253
				ORDER BY valor DESC;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- Juntando as tabelas 'pedido' e 'pagamento'
-- Quantos pedidos foram realizados pelos clientes?
SELECT COUNT(statusPedido) AS 'Número de pedidos realizados'
    FROM pedido AS ped
		INNER JOIN PAGAMENTO AS pag
			ON ped.idPCliente = pag.idPCliente;
            
-- Quantos pedidos foram realizados pelos clientes e estão com o status 'Cancelado'?
SELECT COUNT(statusPedido) AS 'Número de pedidos com status "Cancelado"'
    FROM pedido AS ped
		INNER JOIN PAGAMENTO AS pag
			ON ped.idPCliente = pag.idPCliente
				AND statusPedido = 'Cancelado';