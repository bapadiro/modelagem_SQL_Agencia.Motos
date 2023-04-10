-- Projeto Modelagem de Dados - Agência de Motos

-- Criando BD
CREATE DATABASE proj_ag_moto;

-- Usando BD criando
USE proj_ag_moto;

-- Teremos 5 Entidades (tabelas) Cliente / Agencia / Moto / Aluguel e Pagamento
-- A Tabela Moto irá se relacionar com a Tabela Agência
-- A Tabela Pagamento irá se relacionar com Cliente
-- A Tabela Aluguel irá se relacionar com Cliente
-- A Tabela Aluguel irá se relacionar com Pagamento

-- Criando a Entidade (Tabela) Cliente
CREATE TABLE Cliente(
	ID_Cliente INT UNSIGNED NOT NULL,
    NM_Nome VARCHAR(50) NOT NULL,
    NUM_CNH VARCHAR(50) NOT NULL,
    NUM_Cartao INT(30) NOT NULL,
    NUM_Telefone INT(20) NOT NULL
);

-- Chave primária + Auto incrementação, gerar números automáticos
ALTER TABLE Cliente MODIFY ID_Cliente INT UNSIGNED PRIMARY KEY AUTO_INCREMENT;

-- Chave única
ALTER TABLE Cliente ADD CONSTRAINT UN_CNH UNIQUE (NUM_CNH);

-- Criando a Entidade (Tabela) Agencia
CREATE TABLE Agencia(
	ID_Agencia INT UNSIGNED NOT NULL,
    NM_Nome VARCHAR(50) NOT NULL,
    NUM_CEP INT(15) NOT NULL,
    NM_Rua VARCHAR(50) NOT NULL,
    NM_Cidade VARCHAR(50) NOT NULL,
    SG_Estado CHAR (2) NOT NULL,
    NUM_Telefone INT NOT NULL    
);

-- Chave primária
ALTER TABLE Agencia MODIFY ID_Agencia INT UNSIGNED PRIMARY KEY AUTO_INCREMENT;

-- Chave Única
ALTER TABLE Agencia ADD CONSTRAINT UN_Nome UNIQUE (NM_Nome);

-- Criando a Entidade (Tabela) Moto
CREATE TABLE Moto(
	ID_Moto INT UNSIGNED NOT NULL,
    NM_Marca VARCHAR(50) NOT NULL,
    NM_Modelo VARCHAR(50) NOT NULL,
    NM_Placa VARCHAR(50) NOT NULL,
    NUM_Ano INT(5) NOT NULL,
    ID_Agencia INT UNSIGNED NOT NULL
);

-- Chave primária
ALTER TABLE Moto MODIFY ID_Moto INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT;

-- Chave Única
ALTER TABLE Moto ADD CONSTRAINT UN_Placa UNIQUE (NM_Placa);

-- Criando a a Entidade (Tabela) Aluguel
CREATE TABLE Aluguel(
	ID_Aluguel INT UNSIGNED NOT NULL,
	NM_Data DATE,
    ID_Cliente INT UNSIGNED NOT NULL,
    ID_Moto INT UNSIGNED NOT NULL,
    NM_Semanal VARCHAR(3) NULL,
    NM_Mensal VARCHAR(3) NULL,
    ID_Pagamento INT NOT NULL
);

-- Chave primária
ALTER TABLE Aluguel MODIFY ID_Aluguel INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT;

-- Criando a Entidade (Tabela) Pagamento
CREATE TABLE Pagamento(
	ID_Pagamento INT UNSIGNED NOT NULL,
    NUM_Cartao INT NOT NULL
);

-- Chave Primária
ALTER TABLE Pagamento MODIFY ID_Pagamento INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT;

-- Relacionamento entre Entidades (tabelas) Moto x Agencia
ALTER TABLE Moto ADD CONSTRAINT FK_Agencia FOREIGN KEY (ID_Agencia) REFERENCES Agencia (ID_Agencia);

-- Relacionamento entre Entidades (tabelas) Aluguel x Cliente e Moto
ALTER TABLE Aluguel ADD CONSTRAINT FK_AluguelCliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID_Cliente);
ALTER TABLE Aluguel ADD CONSTRAINT FK_AluguelMoto FOREIGN KEY (ID_Moto) REFERENCES Moto (ID_Moto);

-- Adicionando Coluna ID_Aluguel na Entidade (Tabela) Pagamento
ALTER TABLE Pagamento ADD ID_Aluguel INT NOT NULL;
ALTER TABLE Pagamento MODIFY ID_Aluguel INT UNSIGNED NOT NULL;

-- Relacionamento entre Entidades (tabela) Pagamento x Aluguel
ALTER TABLE Pagamento ADD CONSTRAINT FK_Pagamento FOREIGN KEY (ID_Aluguel) REFERENCES Aluguel (ID_Aluguel);

-- Alterando a Entidade (Tabela) Cliente Coluna NUM_Cartao para INT NOT NULL
ALTER TABLE Cliente MODIFY NUM_Cartao INT NOT NULL;

-- ALterando a Entidade (Tabela) Cliente Coluna Telefone para VARCHAR(30)
ALTER TABLE Cliente MODIFY NUM_Telefone VARCHAR(30) NOT NULL;

-- Inserindo dados na Entidade (Tabela) Cliente
INSERT INTO Cliente (NM_Nome, NUM_CNH, NUM_Cartao, NUM_Telefone)
VALUES ('Janira Rosa', '521485697', '3597', '11 92563-4141');

INSERT INTO Cliente (NM_Nome, NUM_CNH, NUM_Cartao, NUM_Telefone)
VALUES ('Roberto da Silva', '123456789', '1234', '11 916250049');

INSERT INTO Cliente (NM_Nome, NUM_CNH, NUM_Cartao, NUM_Telefone)
VALUES ('Kim Robert', '965413058', '4412', '11 96556-2541');

INSERT INTO Cliente (NM_Nome, NUM_CNH, NUM_Cartao, NUM_Telefone)
VALUES ('Robson Ferreira', '412597002', '4110', '11 91661-0129');

INSERT INTO Cliente (NM_Nome, NUM_CNH, NUM_Cartao, NUM_Telefone)
VALUES ('Maria Helena', '418965700', '1974', '11 94196-4444');

INSERT INTO Cliente (NM_Nome, NUM_CNH, NUM_Cartao, NUM_Telefone)
VALUES ('Gabriela de Souza', '101047326', '5924', '11 91667-0026');

INSERT INTO Cliente (NM_Nome, NUM_CNH, NUM_Cartao, NUM_Telefone)
VALUES ('Wilson Pedrosa', '452170019', '7963', '11 94196-4179');

INSERT INTO Cliente (NM_Nome, NUM_CNH, NUM_Cartao, NUM_Telefone)
VALUES ('Emanuella Santos', '014973254', '3364', '11 98684-1479');

INSERT INTO Cliente (NM_Nome, NUM_CNH, NUM_Cartao, NUM_Telefone)
VALUES ('Eric Diogo', '965413701', '7496', '11 98471-1496');

INSERT INTO Cliente (NM_Nome, NUM_CNH, NUM_Cartao, NUM_Telefone)
VALUES ('Julia Gonzaga', '459631002', '1409', '11 91473-3365');

SELECT * FROM Cliente;

-- Alterando a Entidade (tabela) Agencia Colunas NUM_CEP e NUM_Telefone para VARCHAR(15) E (30)
ALTER TABLE Agencia MODIFY NUM_CEP VARCHAR(15) NOT NULL;
ALTER TABLE Agencia MODIFY NUM_TELEFONE VARCHAR(20) NOT NULL;

-- Inserindo dados na Entidade (Tabela) Agencia
INSERT INTO Agencia (NM_Nome, NUM_CEP, NM_Rua, NM_Cidade, SG_Estado, NUM_Telefone)
VALUES ('Agencia Tipo A', '01526-020', 'Rua A', 'São Paulo', 'SP', '11 3325-4117');

INSERT INTO Agencia (NM_Nome, NUM_CEP, NM_Rua, NM_Cidade, SG_Estado, NUM_Telefone)
VALUES ('Agencia Tipo B', '05547-020', 'Rua B', 'São Paulo', 'SP', '11 3325-4118');

INSERT INTO Agencia (NM_Nome, NUM_CEP, NM_Rua, NM_Cidade, SG_Estado, NUM_Telefone)
VALUES ('Agencia Tipo C', '01552-010', 'Rua C', 'São Paulo', 'SP', '11 3325-4119');

INSERT INTO Agencia (NM_Nome, NUM_CEP, NM_Rua, NM_Cidade, SG_Estado, NUM_Telefone)
VALUES ('Agencia Tipo D', '02347-020', 'Rua D', 'São Paulo', 'SP', '11 3325-4110');

SELECT * FROM Agencia;

-- Adicionando uma coluna Cilindrada na Entiade (Tabela) Moto
ALTER TABLE Moto ADD NUM_Cilindrada INT(5) NOT NULL;

-- Inserindo dados na Entidade (tabela) Moto
INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Honda', 'CG Fan', 'EZY-1465', '2018', '1', '160');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Honda', 'Pop 100', 'JAU-5149', '2018', '1', '100');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Yamaha', 'Crypton', 'SAA-2541', '2020', '3', '115');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Honda', 'Dream', 'YHE-4900', '2019', '3', '100');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Suzuki', 'Yes', 'KJO-5410', '2022', '2', '125');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Yamaha', 'Factor', 'EFG-1039', '2019', '2', '125');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Yamaha', 'Neon Scooter', 'KOL-4963', '2022', '1', '125');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Yamaha', 'Fluo Scooter', 'HET-1176', '2019', '2', '125');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Honda', 'Elite Scooter', 'EGY-1465', '2022', '3', '125');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Honda', 'Biz Scooter', 'LAQ-1796', '2018', '3', '125');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Honda', 'CG Titan', 'FEP-4697', '2020', '3', '160');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Honda', 'Twister', 'EOK-1320', '2020', '1', '250');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Honda', 'ADV', 'QAS-4711', '2022', '2', '150');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Yamaha', 'Fazer', 'SQS-1742', '2022', '1', '150');

INSERT INTO Moto (NM_Marca, NM_Modelo, NM_Placa, NUM_Ano, ID_Agencia, NUM_Cilindrada)
VALUES ('Yamaha', 'Lander', 'KUT-7741', '2022', '1', '250');

SELECT * FROM Moto;

-- Alterando o dado da Coluna ID_Pagamento da Tabela Aluguel para NULL,
ALTER TABLE Aluguel MODIFY ID_Pagamento INT UNSIGNED NULL;

-- Alterando o dado da Coluna ID_Pagamento da Tabela Aluguel para DEFAULT '500'
ALTER TABLE Aluguel MODIFY ID_Pagamento INT UNSIGNED DEFAULT '500';

-- Inserindo a Coluna NM_Caucao na Tabela Aluguel
ALTER TABLE Aluguel ADD NM_Caucao CHAR(30) NOT NULL;

-- Inserindo a Coluna ID_Cliente na Tabela Pagamento
ALTER TABLE Pagamento ADD ID_Cliente INT UNSIGNED NOT NULL;

-- Relacionando as Entidades (Tabelas) Pagamento x Cliente por ID_Cliente
ALTER TABLE Pagamento ADD CONSTRAINT FK_Pag_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID_Cliente); 

-- Excluindo a Coluna ID_Aluguel da Tabela Pagamento
ALTER TABLE Pagamento DROP COLUMN ID_Aluguel;

-- Inserindo dados na Entidade (Tabela) Pagamento
INSERT INTO Pagamento (NUM_cartao, ID_Cliente)
VALUES ('3597', '1');

INSERT INTO Pagamento (NUM_cartao, ID_Cliente)
VALUES ('1234', '2');

INSERT INTO Pagamento (NUM_cartao, ID_Cliente)
VALUES ('4412', '3');

INSERT INTO Pagamento (NUM_cartao, ID_Cliente)
VALUES ('4110', '4');

INSERT INTO Pagamento (NUM_cartao, ID_Cliente)
VALUES ('1974', '5');

INSERT INTO Pagamento (NUM_cartao, ID_Cliente)
VALUES ('5924', '6');

INSERT INTO Pagamento (NUM_cartao, ID_Cliente)
VALUES ('7963', '7');

INSERT INTO Pagamento (NUM_cartao, ID_Cliente)
VALUES ('3364', '8');

INSERT INTO Pagamento (NUM_cartao, ID_Cliente)
VALUES ('7496', '9');

INSERT INTO Pagamento (NUM_cartao, ID_Cliente)
VALUES ('1409', '10');

-- Relacionando as Entidades (Tabelas) Aluguel x Pagamento por ID_Pagamento
ALTER TABLE Aluguel ADD CONSTRAINT FK_Aluguel_Pag FOREIGN KEY (ID_Pagamento) REFERENCES Pagamento (ID_Pagamento);

-- Excluindo FK entre Entidades (Tabela) Aluguel x Moto por ID_Moto
ALTER TABLE Aluguel DROP CONSTRAINT FK_AluguelMoto;

-- Inserindo dados na Tabela Aluguel
INSERT INTO Aluguel (NM_Data, ID_Cliente, ID_Moto, NM_Semanal, NM_Mensal, ID_Pagamento, NM_Caucao)
VALUES ('2023-03-01', '1', '31', 'Não', 'Sim', '1', '500');

INSERT INTO Aluguel (NM_Data, ID_Cliente, ID_Moto, NM_Semanal, NM_Mensal, ID_Pagamento, NM_Caucao)
VALUES ('2023-03-10', '2', '35', 'Sim', 'Não', '2', '500');

INSERT INTO Aluguel (NM_Data, ID_Cliente, ID_Moto, NM_Semanal, NM_Mensal, ID_Pagamento, NM_Caucao)
VALUES ('2023-03-11', '3', '33', 'Sim', 'Não', '3', '500');

INSERT INTO Aluguel (NM_Data, ID_Cliente, ID_Moto, NM_Semanal, NM_Mensal, ID_Pagamento, NM_Caucao)
VALUES ('2023-03-11', '4', '35', 'Sim', 'Não', '4', '500');

INSERT INTO Aluguel (NM_Data, ID_Cliente, ID_Moto, NM_Semanal, NM_Mensal, ID_Pagamento, NM_Caucao)
VALUES ('2023-03-11', '5', '35', 'Não', 'Sim', '5', '500');

INSERT INTO Aluguel (NM_Data, ID_Cliente, ID_Moto, NM_Semanal, NM_Mensal, ID_Pagamento, NM_Caucao)
VALUES ('2023-03-13', '6', '40', 'Não', 'Sim', '6', '500');

INSERT INTO Aluguel (NM_Data, ID_Cliente, ID_Moto, NM_Semanal, NM_Mensal, ID_Pagamento, NM_Caucao)
VALUES ('2023-03-20', '7', '37', 'Sim', 'Não', '7', '500');

INSERT INTO Aluguel (NM_Data, ID_Cliente, ID_Moto, NM_Semanal, NM_Mensal, ID_Pagamento, NM_Caucao)
VALUES ('2023-03-20', '8', '40', 'Sim', 'Não', '8', '500');

INSERT INTO Aluguel (NM_Data, ID_Cliente, ID_Moto, NM_Semanal, NM_Mensal, ID_Pagamento, NM_Caucao)
VALUES ('2023-03-20', '9', '40', 'Sim', 'Não', '9', '500');

INSERT INTO Aluguel (NM_Data, ID_Cliente, ID_Moto, NM_Semanal, NM_Mensal, ID_Pagamento, NM_Caucao)
VALUES ('2023-03-21', '10', '40', 'Não', 'Sim', '10', '500');

-- Erro na transação Identidade Moto
START TRANSACTION;
	DELETE FROM Moto
ROLLBACK;

-- Erro na transação Identidade Aluguel
START TRANSACTION;
	DELETE FROM Aluguel
ROLLBACK;

-- Após o erro os comandos INSERT INTO das Entidades Moto e Aluguel foram exacutados acima novamente.

SELECT * FROM cliente;
SELECT * FROM Agencia;
SELECT * FROM Moto;
SELECT * FROM Pagamento;
SELECT * FROM Aluguel;

COMMIT;






