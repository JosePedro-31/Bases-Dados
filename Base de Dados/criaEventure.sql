SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- Criar base de dados
DROP SCHEMA IF EXISTS EVENTURE; -- Apagar a BD Anterior se existir claro
CREATE SCHEMA IF NOT EXISTS Eventure 	
	DEFAULT CHARSET=utf8mb4
    DEFAULT ENCRYPTION='N';
    
-- Usar a base de dados    
USE Eventure;

-- Tabela Evento
CREATE TABLE Evento (
    `idEvento` INT AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `audiênciaMax` INT NOT NULL,
    `categoria` VARCHAR(255) NOT NULL,
    `custo` INT NOT NULL,
    `orçamento` INT NOT NULL,
    `inicioEvento` DATE NOT NULL,
    `fimEvento` DATE NOT NULL,
    `observações` VARCHAR(2047),
    `Localização_idLocalização` INT NOT NULL,
		PRIMARY KEY(`idEvento`, `Localização_idLocalização`),
		FOREIGN KEY(`Localização_idLocalização`)
			REFERENCES `Localização`(`idLocalização`)
);

-- Tabela patrocionadores -> Evento 
CREATE TABLE `patrocinadores` (
	`Evento_idEvento` INT NOT NULL,
    `patrocinador` VARCHAR(255) NOT NULL,
		PRIMARY KEY(`patrocinador`, `Evento_idEvento`),
		FOREIGN KEY(`Evento_idEvento`)
			REFERENCES `Evento`(`idEvento`)
);

-- Tabela Localização 
CREATE TABLE `Localização` (
	`idLocalização` INT AUTO_INCREMENT,
    `codigoPostal` VARCHAR(255) NOT NULL,
    `cidade` VARCHAR(255) NOT NULL,
    `população` INT NOT NULL,
		PRIMARY KEY(`idLocalização`),
        UNIQUE(`idLocalização`)
);
 
-- Tabela registrosChuva -> Localização
CREATE TABLE `registrosChuva` (
	`Localização_idLocalização` INT NOT NULL,
    `registrosChuva` INT NOT NULL,
    `registroData` DATE NOT NULL,
		PRIMARY KEY(`registrosChuva`,`Localização_idLocalização`),
        FOREIGN KEY(`Localização_idLocalização`)
			REFERENCES `Localização`(`idLocalização`)
);

-- Tabela registrosTemperatura -> Localização
CREATE TABLE `registrosTemperatura` (
	`Localização_idLocalização` INT NOT NULL,
    `registrosTemperatura` INT NOT NULL,
    `registroData` DATE NOT NULL,
		PRIMARY KEY(`registrosTemperatura`,`Localização_idLocalização`),
        FOREIGN KEY(`Localização_idLocalização`)
			REFERENCES `Localização`(`idLocalização`)
);

-- Tabela registrosVento -> Localização
CREATE TABLE `registrosVento` (
	`Localização_idLocalização` INT NOT NULL,
    `registrosVento` INT NOT NULL,
    `registroData` DATE NOT NULL,
		PRIMARY KEY(`registrosVento`,`Localização_idLocalização`),
        FOREIGN KEY(`Localização_idLocalização`)
			REFERENCES `Localização`(`idLocalização`)
);

-- Tabela Evento contém Headliner (relação N:N)
CREATE TABLE `Evento_contém_Headliner` (
	`Evento_idEvento` INT NOT NULL,
    `Headliner_idHeadliner` INT NOT NULL,
		PRIMARY KEY(`Evento_idEvento`, `Headliner_idHeadliner`),
		FOREIGN KEY(`Evento_idEvento`)
			REFERENCES `Evento`(`idEvento`),
		FOREIGN KEY(`Headliner_idHeadliner`)
			REFERENCES `Headliner`(`idHeadliner`)
);

-- Tabela Headliner
CREATE TABLE `Headliner` (
	`idHeadliner` INT AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `chefe` VARCHAR(255) NOT NULL,
    `cachê` INT NOT NULL,
    `observações` VARCHAR(2047),
		PRIMARY KEY(`idHeadliner`),
        UNIQUE(`idHeadliner`)
);

-- Tabela participantes -> Headliner
CREATE TABLE `participantes` (
	`Headliner_idHeadliner` INT NOT NULL,
    `participante` VARCHAR(255) NOT NULL,
		PRIMARY KEY(`participante`, `Headliner_idHeadliner`),
        FOREIGN KEY(`Headliner_idHeadliner`)
			REFERENCES `Headliner`(`idHeadliner`)
);

-- Tabela Evento contém Equipa (relação N:N)
CREATE TABLE `Evento_contém_Equipa` (
	`Equipa_idEquipa` INT NOT NULL,
	`Evento_idEvento` INT NOT NULL,
		PRIMARY KEY(`Equipa_idEquipa`,`Evento_idEvento`),
		FOREIGN KEY(`Evento_idEvento`)
			REFERENCES `Evento`(`idEvento`),
		FOREIGN KEY(`Equipa_idEquipa`)
			REFERENCES `Equipa`(`idEquipa`)
);

-- Tabela Equipa
CREATE TABLE `Equipa` (
	`idEquipa` INT AUTO_INCREMENT,
    `chefe` VARCHAR(255) NOT NULL,
    `função` VARCHAR(255) NOT NULL,
    `observações` VARCHAR(2047),
		PRIMARY KEY(`idEquipa`),
		UNIQUE(`idEquipa`)
);

-- Tabela Equipa contém Funcionário (relação N:N)
CREATE TABLE `Equipa_contém_Funcionário` (
	`Equipa_idEquipa` INT NOT NULL,
	`Funcionário_idFuncionário` INT NOT NULL,
		PRIMARY KEY(`Equipa_idEquipa`,`Funcionário_idFuncionário`),
		FOREIGN KEY(`Funcionário_idFuncionário`)
			REFERENCES `Funcionário`(`idFuncionário`),
		FOREIGN KEY(`Equipa_idEquipa`)
			REFERENCES `Equipa`(`idEquipa`)
);

-- Tabela Funcionário
CREATE TABLE `Funcionário` (
	`idFuncionário` INT AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `dataNascimento` DATE NOT NULL,
    `NIF` INT NOT NULL,
    `dataAdmissão` DATE NOT NULL,
    `salário` INT NOT NULL,
    `cargo` VARCHAR(255) NOT NULL,
    `telemóvel` INT NOT NULL,
    `e-mail` VARCHAR(255) NOT NULL,
    `cidade` VARCHAR(255) NOT NULL,
    `rua` VARCHAR(255) NOT NULL,
    `porta` INT NOT NULL,
    `observações` VARCHAR(2047),
		PRIMARY KEY(`idFuncionário`),
        UNIQUE(`idFuncionário`)
);

-- Tabela Evento divulgado Funcionário (relação N:N)
CREATE TABLE `Evento_divulgado_Funcionário` (
	`Evento_idEvento` INT NOT NULL,
	`Funcionário_idFuncionário` INT NOT NULL,
		PRIMARY KEY(`Evento_idEvento`,`Funcionário_idFuncionário`),
		FOREIGN KEY(`Funcionário_idFuncionário`)
			REFERENCES `Funcionário`(`idFuncionário`),
		FOREIGN KEY(`Evento_idEvento`)
			REFERENCES `Evento`(`idEvento`)
);

-- Tabela Bilhete
CREATE TABLE `Bilhete` (
	`idBilhete` INT AUTO_INCREMENT,
    `preço` INT NOT NULL,
    `lugar` INT,
    `inicioEvento` DATE NOT NULL,
    `fimEvento` DATE NOT NULL,
    `aquisição` DATE NOT NULL,
    `Funcionário_idFuncionário` INT NOT NULL,
    `Evento_idEvento` INT NOT NULL,
    `Cliente_idCliente` INT NOT NULL,
		PRIMARY KEY(`idBilhete`, `Funcionário_idFuncionário`, `Evento_idEvento`, `Cliente_idCliente`),
        FOREIGN KEY(`Funcionário_idFuncionário`)
			REFERENCES `Funcionário`(`idFuncionário`),
		FOREIGN KEY(`Evento_idEvento`)
			REFERENCES`Evento`(`idEvento`),
		FOREIGN KEY(`Cliente_idCliente`)
			REFERENCES`Cliente`(`idCliente`)
);

-- Tabela Cliente
CREATE TABLE `Cliente` (
    `idCliente` INT AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `dataNascimento` DATE NOT NULL,
    `telemóvel` INT NOT NULL,
    `e-mail` VARCHAR(255) NOT NULL,
    `cidade` VARCHAR(255) NOT NULL,
    `rua` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`idCliente`),
    UNIQUE (`idCliente`)
);

-- Tabela Evento avaliado Cliente (relação N:N)
CREATE TABLE `Evento_avaliado_Cliente` (
	`Evento_idEvento` INT NOT NULL,
	`Cliente_idCliente` INT NOT NULL,
    `classificaçãoQuantitativa` INT NOT NULL,
    `pontosPositivos` VARCHAR(2047) NOT NULL,
    `pontosNegativos` VARCHAR(2047) NOT NULL,
    `date` DATE NOT NULL,
		PRIMARY KEY(`Cliente_idCliente`,`Evento_idEvento`),
		FOREIGN KEY(`Cliente_idCliente`)
			REFERENCES `Cliente`(`idCliente`),
		FOREIGN KEY(`Evento_idEvento`)
			REFERENCES `Evento`(`idEvento`)
);