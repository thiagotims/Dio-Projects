-- Banco de Dados 'oficina'

CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

-- Table cliente
CREATE TABLE IF NOT EXISTS cliente (
  idCliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome VARCHAR(45) NOT NULL,
  telefone CHAR(11) NOT NULL,
  cpf CHAR(11) NOT NULL
);
ALTER TABLE cliente auto_increment=1;

-- Table equipeMecanicos

CREATE TABLE IF NOT EXISTS equipeMecanicos(
  idequipeMecanicos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nomeEquipe enum('Equipe 1', 'Equipe 2', 'Equipe 3', 'Equipe 4', 'Equipe 5') DEFAULT 'Equipe 1' NOT NULL
);
ALTER TABLE equipeMecanicos auto_increment=1;

-- Table peca

CREATE TABLE IF NOT EXISTS peca (
  idpeca INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  descricaoPeca enum('volante', 'roda', 'banco', 'peca para motor', 'para-choque', 'outros') DEFAULT 'outros' NOT NULL,
  valorPeca FLOAT(10,2) NOT NULL,
  quantidadePeca INT NOT NULL,
  valorTotalPeca FLOAT(10,2) NOT NULL
);
ALTER TABLE peca auto_increment=1;

-- Table referenciaMaoDeObra

CREATE TABLE IF NOT EXISTS referenciaMaoDeObra (
  idReferenciaMaoDeObra INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  descricaoServico enum('troca de óleo', 'troca de filtro', 'troca de peca', 'limpeza', 'manutenção geral', 'revisão anual', 'pintura', 'peças', 'troca de roda') DEFAULT 'manutenção geral' NOT NULL,
  valorServico FLOAT (10,2) NOT NULL,
  quantidade INT NOT NULL,
  valorTotalServico FLOAT (10,2) NOT NULL
);
ALTER TABLE referenciaMaoDeObra auto_increment=1;
 
-- Table mecanico

CREATE TABLE IF NOT EXISTS mecanico (
  idmecanico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome VARCHAR(45) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  especialidade enum('mecânica', 'elétrica', 'pintura') default 'mecânica' NOT NULL
);
ALTER TABLE mecanico auto_increment=1; 

-- Table veiculo
CREATE TABLE IF NOT EXISTS veiculo (
  idVeículo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  cliente_idCliente INT,
  equipeMecanicos_idequipeMecanicos INT,
  tipo enum('Sedan', 'hatch', 'SUV') default 'hatch' NOT NULL,
  marca enum('Fiat', 'Ford', 'Nissan', 'Volkswagen', 'Honda', 'Chevrolet') NOT NULL,
  modelo VARCHAR(45) NOT NULL,
  ano char(4) NOT NULL,
  constraint fk_veiculo_1 foreign key (cliente_idCliente) references cliente(idCliente)
		on update cascade,
  constraint fk_veiculo_2 foreign key (equipeMecanicos_idequipeMecanicos) references equipeMecanicos(idequipeMecanicos)
		on update cascade
  );
ALTER TABLE veiculo auto_increment=1;

-- Table oS

CREATE TABLE IF NOT EXISTS oS (
  idOS INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  dataEntrega DATE,
  dataEmissao DATE,
  valorTotal FLOAT (10,2) NOT NULL,
  status enum('Cancelada', 'Concluída', 'Em processamento', 'Autorizada') default 'Autorizada' NOT NULL,
  dataConclusaoTrabalho DATE,
  equipeMecanicos_idequipeMecanicos INT,
  cliente_idCliente INT,
  constraint fk_oS_1 foreign key (cliente_idCliente) references cliente(idCliente)
		on update cascade,
  constraint fk_oS_2 foreign key (equipeMecanicos_idequipeMecanicos) references equipeMecanicos(idequipeMecanicos)
		on update cascade
);
ALTER TABLE oS auto_increment=1;

-- Table possuiMecanicos

CREATE TABLE IF NOT EXISTS possuiMecanicos (
  equipeMecanicos_idequipeMecanicos INT,
  mecanico_idmecanico INT,
  
  constraint fk_possuiMecanicos_1 foreign key (mecanico_idmecanico) references mecanico(idmecanico)
		on update cascade,
  constraint fk_possuiMecanicos_2 foreign key (equipeMecanicos_idequipeMecanicos) references equipeMecanicos(idequipeMecanicos)
		on update cascade
);

-- Table servicosCompoeOS

CREATE TABLE IF NOT EXISTS servicosCompoeOS (
  oS_idOS INT,
  referenciaMaoDeObra_idReferenciaMaoDeObra INT,  
  constraint fk_servicosCompoeOS_1 foreign key (oS_idOS) references oS(idOS)
		on update cascade,
  constraint fk_servicosCompoeOS_2 foreign key (referenciaMaoDeObra_idReferenciaMaoDeObra) references referenciaMaoDeObra(idReferenciaMaoDeObra)
		on update cascade
);

-- Table pecaCompoeOS

CREATE TABLE IF NOT EXISTS pecaCompoeOS (
  peca_idpeca INT,
  os_idOS INT,
  
  constraint fk_pecaCompoeOS_1 foreign key (peca_idpeca) references peca(idpeca)
		on update cascade,
  constraint fk_pecaCompoeOS_2 foreign key (os_idOS) references oS(idOS)
		on update cascade
);