-- Realizar queries
-- ! problemas de ref.

USE oficina;

SHOW TABLES;
DESC cliente;
DESC equipemecanicos;
DESC mecanico;
DESC os;
DESC peca;
DESC pecacompoeos;
DESC possuimecanicos;
DESC referenciamaodeobra;
DESC servicoscompoeos;
DESC veiculo;

-- Recuperações simples com SELECT Statement
-- Recuperação dos dados da tabela 'os'
SELECT *
	FROM os;
-- Recuperação dos dados da tabela 'cliente'
SELECT * 
	FROM cliente;

-- Filtros com WHERE Statement
-- Qual o nome do cliente com cpf = 37100521401 ? 
SELECT nome 
	FROM cliente WHERE cpf = 37100521401;

-- Qual a especialidade de Maria Betânia de Jesus?
SELECT nome, especialidade
	FROM mecanico
		WHERE nome = 'Maria Betânia de Jesus';

-- Crie expressões para gerar atributos derivados
-- Qual a média do valor unitário das peças registradas ?
SELECT AVG(valorPeca)  AS 'Média do valor unitário da peça'
	FROM peca;
-- Qual a média de valor das OSs registradas?
SELECT AVG(valorTotal) AS 'Média de valor das OSs'
	FROM os;

-- Defina ordenações dos dados com ORDER BY
-- Quais são os 2 clientes (ids) cujas OSs apresentam os maiores valores totais?
SELECT cliente_idCliente, valorTotal
	FROM os
		GROUP BY cliente_idCliente, valorTotal
			ORDER BY valorTotal DESC
				LIMIT 2;
-- Diante dos dados disponíveis na tabela OS, é possível afirmar que quanto maior o valorTotal da OS, maior é a duração para concluir o serviço?
-- Apresente as informações que sustentam seu argumento em ordem descrescente de 'Duracao para conclusão do serviço'
SELECT idOS, dataEntrega, dataConclusaoTrabalho, valorTotal, TIMESTAMPDIFF(DAY, dataEntrega, dataConclusaoTrabalho) AS 'Duracao para conclusão do serviço'
	FROM os
		GROUP BY idOS, valorTotal, 'Duracao para conclusão do serviço'
			ORDER BY 'Duracao para conclusão do serviço', valorTotal DESC;

-- Condições de filtros aos grupos – HAVING Statement
-- Quais são, respectivamente, os 2 maiores números da OS ('idOS') em ordem decrescente, que possuem status 'Cancelada' ou 'Concluída',
-- ordenando-as por 'valorTotal'?
SELECT *
	FROM os
		HAVING  status = 'Cancelada' or status = 'Concluída'
			ORDER BY valorTotal DESC
				LIMIT 2;
				
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- Juntando as tabelas 'os' e 'equipeMecanicos'
-- Qual o valor total da OS que está com a equipe 2?
SELECT *
    FROM os AS o
		INNER JOIN equipeMecanicos AS m
			ON o.idOS = m.idequipeMecanicoS
				AND nomeEquipe = 'Equipe 2';
            
-- Qual é o nome do(a) cliente cuja OS está com status 'Cancelada'?
SELECT *
    FROM os AS o
		INNER JOIN cliente AS c
			ON o.idOS = c.idCliente
				AND status = 'Cancelada';