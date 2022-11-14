-- Inserts
USE ecommerce;

SHOW TABLES;

INSERT INTO cliente (tipo) 
			 VALUES ('PJ'),
					('PF'),
					('PJ'),
					('PF'),
                    ('PF');
SELECT * FROM cliente;

INSERT INTO endereco (enderecoComercial, enderecoResidencial, enderecoEntrega) 
			 VALUES ('Rua Eustáquio de Salsa, 121 - JD. Progresso - Osasco/SP', 'Rua dos Estressados, 41 - Barnoves - Osasco/SP','Rua Eustáquio de Salsa, 121 - JD. Progresso - Osasco/SP'),
					('Rua João Teneném, 364 - Jd. Marajó - Indaiatuba/SP', 'Rua Sebastião Nazareno, 23 - Pluma de Flores - Hortolândia/SP', 'Rua Sebastião Nazareno, 23 - Pluma de Flores - Hortolândia/SP'),
					('Av.Tiradentes, 361 - Morumbi - São Paulo/SP', 'Rua da Conceição, 78 - Centro - Campinas/SP', 'Rua da Conceição, 78 - Centro - Campinas/SP'),
					('Rua Peregrinos, 12 - Centro - Jaguariúna/SP', 'Av. Industrial, 34 - Pq. dos Trabalhadores - Jaguariúna/SP', 'Av. Industrial, 34 - Pq. dos Trabalhadores - Jaguariúna/SP'),
                    ('Rua Maria José, 66 - Res. Tucuruvi - Sumaré/SP', 'Rua Maria José, 1026 - Res. Tucuruvi - Sumaré/SP', 'Rua Maria José, 1026 - Res. Tucuruvi - Sumaré/SP');
SELECT * FROM endereco;

INSERT INTO entrega (statusEntrega,codigoRastreio) 
			  VALUES (default,'GK6534221BR'),
				     ('Cancelado','BA1234567BR'),
					 ('Confirmado','SP2546897BR'),
					 ('Em processamento','FA6589753BR'),
                     ('Confirmado','KL8897632BR');
SELECT * FROM entrega;

INSERT INTO estoque (local, quantidade) 
			 VALUES ('São Paulo', 500),
					('Jundiaí', 325),
					('Manaus', 128),
					('Ceará', 79),
                    ('Rio de Janeiro', 256);
SELECT * FROM estoque;
                    
INSERT INTO fornecedor (razaoSocial, cnpj, nomeFantasia) 
			    VALUES ('Armarinhos do Brasil Ltda', 45231064000122, 'Armarinhos Brasil'),
					   ('Sofá e Móveis Ltda', 23061895000521, 'Sofazão Brasil'),
					   ('Brasil Eletrônicos e Eletros ME', 56123087002201, 'Eletrônicos Baratos'),
					   ('Roupas bonitas Ltda', 23056589000978, 'Roupas Bonitas'),
                       ('Brinquedaria Brinquedos ME', 02256289005549, 'Bricadeira de criança');
SELECT * FROM fornecedor;

INSERT INTO pagamento (tipoPagamento, statusPagamento, codigoRastreio, idPCliente) 
			   VALUES (default, default, 'GHR236002BR', 5),
					  ('Dois cartões', 'Confirmado', 'ASD25100BR', 1),
					  ('Boleto', 'Cancelado', 'MER66800BR', 2),
					  (default, 'Confirmado', 'LOL98700BR', 3),
					  (default, 'Cancelado', 'KKK00000BR', 4);
SELECT * FROM pagamento;

INSERT INTO pedido (statusPedido, frete, idPCliente, idPEntrega) 
			VALUES (default, default, 1, 1),
				   ('Cancelado', 15.00, 2, 2),
				   ('Confirmado', default, 3, 3),
				   (default, default, 4, 4),
				   ('Confirmado', default, 5, 5);
SELECT * FROM pedido;

INSERT INTO pf (nome, cpf, idPFEndereco, idCliente) 
		VALUES ('Tiago de Freitas Faustino', 000123500901, 1, 1),
			   ('João Paulo da Silva', 36523500108, 2, 2),
			   ('Marília Gabriela', 36512900601, 4, 4),
			   ('Juliana Fonseca', 39825600423, 5, 5),
			   ('Pedro Henrique', 89536200544, 3, 3);
SELECT * FROM pf;

INSERT INTO pj (razaoSocial, nomeFantasia, cnpj, idPJEndereco, idCliente) 
		VALUES ('João Eletrônicos Ltda', 'João Eletrônicos', 25433052000312, 1, 1),
			   ('Maria Brinquedos ME', 'Briquedolândia', 12036546002005, 2, 2),
			   ('Pedro Móveis Ltda', 'Mobilily', 14036025003388, 4, 4),
			   ('Nathalia Vestimentas Ltda', 'Vestnath', 023055123023588, 5, 5),
			   ('Fernando Alimentos ME', 'Alimentando Você', 023566891005811, 3, 3);
SELECT * FROM pj;

INSERT INTO produto (categoria, descricao, valor) 
		     VALUES ('Eletrônico', 'Microcomputador i6, LG, modelo LG001', 2500.00),
				    ('Vestimenta', 'Vestinho listrado, 100% algodão, tamanho M', 236.00),
				    ('Brinquedos', 'Boneca Barbie Girl, coleção Sunny', 452.00),
				    ('Alimentos', 'Bombom Garoto', 28.99),
				    ('Móveis', 'Sofá 3 lugares, cor vermelho', 3200.00);
SELECT * FROM produto;

INSERT INTO produtoEstoque (idPEstoque, idPProduto, quantidade) 
			        VALUES (1, 1, 222),
				           (2, 2, 33),
				           (3, 3, 100),
				           (4, 4, 11),
				           (5, 5, 327);
SELECT * FROM produtoEstoque;

INSERT INTO produtoFornecedor (idPFornecedor, idPProduto) 
			           VALUES (1, 1),
				              (2, 2),
				              (3, 3),
				              (4, 4),
				              (5, 5);
SELECT * FROM produtoFornecedor;

INSERT INTO produtoPedido (idPPedido, idPProduto, quantidade) 
				   VALUES (1, 1, 12),
						  (2, 2, 9),
						  (3, 3, 2),
						  (4, 4, 11),
						  (5, 5, 99);
SELECT * FROM produtoPedido;

INSERT INTO terceiroVendedor (razaoSocial, local, nomeFantasia, cnpj, cpf) 
			          VALUES ('Marcio Vieira Marcolino','Blumenau', 'Não há', 'Não há', 32456678979),
				             ('Sonia Ramirez','Curitiba', 'Não há', 'Não há', 45656656789),
				             ('Eletro Internacional Ltda', 'São Paulo', 'Eletro já', 02016231005512, 'Não há'),
				             ('Zezão Móveis Novos Ltda', 'Rio de Janeiro', 'Zezão Móveis', 01205637100659, 'Não há'),
				             ('Jupiter insumos voláteis ME', 'Limeira', 'Planetas dos doces', 01369350007725, 'Não há');
SELECT * FROM terceiroVendedor;

INSERT INTO produtoVendedor (idPTerceiroVendedor, idPProduto, quantidade) 
			         VALUES (1, 1, 25),
				            (2, 2, 5),
				            (3, 3, 87),
				            (4, 4, 31),
				            (5, 5, 6);
SELECT * FROM produtoVendedor;