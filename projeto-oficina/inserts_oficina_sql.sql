-- Inserts
USE oficina;

SHOW TABLES;

INSERT INTO cliente (nome, telefone, cpf) 
			 VALUES ('Romualdo Pereira da Costa', 011981770633, 35600425782),
					('Diego Tavares Nascimento', 083971667173, 30103033603),
					('João do Caminhão', 01191168923, 33106201422);
SELECT * FROM cliente;

INSERT INTO equipemecanicos (nomeEquipe) 
			 VALUES ('Equipe 1'),
					('Equipe 2'),
					('Equipe 3');
SELECT * FROM equipemecanicos;

INSERT INTO mecanico (nome, endereco, especialidade) 
			 VALUES ('João da Silva', 'Rua 7, 81 - Morumbi - Campinas/SP', default),
					('Maria Betânia de Jesus', 'Rua 1, 12 - Jd. Planalto - Indaiatuba/SP', 'pintura'),
					('Julia Nascimento', 'Rua 5, 34 - Jd. Bela Vista - Hortolândia/SP', 'elétrica');
SELECT * FROM mecanico;

INSERT INTO os (dataEntrega, dataEmissao, valorTotal, status, dataConclusaoTrabalho, equipeMecanicos_idequipeMecanicos, cliente_idCliente) 
			 VALUES ('2022-10-31', '2022-10-31', 100.00, 'Concluída', '2022-11-01', 1, 1),
					('2022-10-31', '2022-10-31', 00.00, 'Cancelada', '2022-10-31', 2, 2),
                    ('2022-10-31', '2022-10-31', 722.00, 'Concluída', '2022-11-02', 3, 3);
SELECT * FROM os;
                    
INSERT INTO peca (descricaoPeca, valorPeca, quantidadePeca, valorTotalPeca) 
			 VALUES ('volante', 620.00, 1, (quantidadePeca * valorpeca)),
					('roda', 450.00, 4, (quantidadePeca * valorpeca)),
					('banco', 823.90, 2, (quantidadePeca * valorpeca));
SELECT * FROM peca;

INSERT INTO pecacompoeos () 
	SELECT C.idpeca, D.idOS
		FROM peca AS C, os AS D
				WHERE C.idpeca = D.idOS;
SELECT * FROM pecacompoeos;

INSERT INTO possuimecanicos (equipeMecanicos_idequipeMecanicos, mecanico_idmecanico)
	SELECT A.idequipeMecanicos, B.idmecanico
		FROM equipeMecanicos AS A, mecanico AS B
				WHERE A.idequipeMecanicos = B.idmecanico;
SELECT * FROM possuimecanicos;

INSERT INTO referenciamaodeobra (descricaoServico, valorServico, quantidade, valorTotalServico) 
			 VALUES ('troca de óleo', 380.00, 1, (quantidade * valorServico)),
					('limpeza', 175.00, 1, (quantidade * valorServico)),
					(default, 615.00, 1, (quantidade * valorServico));
SELECT * FROM referenciamaodeobra;

INSERT INTO servicoscompoeos (oS_idOS, referenciaMaoDeObra_idReferenciaMaoDeObra)
	SELECT E.idOS, F.idReferenciaMaoDeObra
		FROM os AS E, referenciaMaoDeObra AS F
				WHERE E.idOS = F.idReferenciaMaoDeObra;
SELECT * FROM servicoscompoeos;

INSERT INTO veiculo (cliente_idCliente, equipeMecanicos_idequipeMecanicos, tipo, marca, modelo, ano) 
			 VALUES (1, 1, 'hatch', 'Nissan', 'March 1.6', 2015),
					(2, 2, 'hatch', 'Honda', 'FIT 1.6', 2013),
					(3, 3, 'sedan', 'Fiat', 'Siena 2.0', 2020);
SELECT * FROM veiculo;