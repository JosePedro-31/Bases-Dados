USE Eventure;

-- -------------------------------------
-- Add Eventure
-- -------------------------------------

-- Adicionar Evento
DROP PROCEDURE IF EXISTS AddEvento;
DELIMITER $$
CREATE PROCEDURE AddEvento(
	IN nome1 VARCHAR(255),
    IN audiênciaMax1 INT,
    IN categoria1 VARCHAR(255),
    IN custo1 INT,
    IN orcamento1 INT,
    IN inicioEvento1 DATE,
	IN fimEvento1 DATE,
    IN Localização_idLocalização1 INT,
    IN observações1 VARCHAR(2047)
)
BEGIN
INSERT INTO `Evento`
	(`nome`,`audiênciaMax`,`categoria`,`custo`,`orçamento`,`inicioEvento`,`fimEvento`,`Localização_idLocalização`, `observações`)
    VALUES
	(nome1, audiênciaMax1, categoria1, custo1,orcamento1, inicioEvento1, fimEvento1, Localização_idLocalização1 , observações1);
END$$
DELIMITER ;

-- Adicionar Bilhete
DROP PROCEDURE IF EXISTS AddBilhete;
DELIMITER $$
CREATE PROCEDURE AddBilhete(
    IN preço1 INT,
    IN lugar1 INT,
    IN inicioEvento1 DATE,
    IN fimEvento1 DATE,
    IN aquisição1 DATE,
    IN Funcionário_idFuncionário1 INT,
    IN Evento_idEvento1 INT,
    IN Cliente_idCliente1 INT
)
BEGIN
INSERT INTO `Bilhete`
	(`preço`, `lugar`, `inicioEvento`, `fimEvento`, `aquisição`, `Funcionário_idFuncionário`, `Evento_idEvento`,`Cliente_idCliente`)
    VALUES
	(preço1, lugar1, inicioEvento1, fimEvento1, aquisição1, Funcionário_idFuncionário1, Evento_idEvento1 , Cliente_idCliente1);
END$$
DELIMITER ;

-- Adicionar Cliente
DROP PROCEDURE IF EXISTS AddCliente;
DELIMITER $$
CREATE PROCEDURE AddCliente(
    IN nome1 VARCHAR(255),
    IN dataNascimento1 DATE,
    IN telemóvel1 INT,
    IN email1 VARCHAR(255),
    IN cidade1 VARCHAR(255),
    IN rua1 VARCHAR(255)
)
BEGIN
INSERT INTO `Cliente`
	(`nome`,`dataNascimento`,`telemóvel`,`e-mail`,`cidade`,`rua`)
    VALUES
	(nome1, dataNascimento1, telemóvel1, email1, cidade1, rua1);
END$$
DELIMITER ;

-- Adicionar Equipa
DROP PROCEDURE IF EXISTS AddEquipa;
DELIMITER $$
CREATE PROCEDURE AddEquipa(
    IN chefe1 VARCHAR(255),
    IN função1 VARCHAR(255),
    IN observações1 VARCHAR(2047)
)
BEGIN
INSERT INTO `Equipa`
	(`chefe`,`função`,`observações`)
    VALUES
	(chefe1, função1, observações1);
END$$
DELIMITER ;

-- Adicionar Funcionário
DROP PROCEDURE IF EXISTS AddFuncionário;
DELIMITER $$
CREATE PROCEDURE AddFuncionário(
    IN nome1 VARCHAR(255),
    IN dataNascimento1 DATE,
    IN NIF1 INT,
    IN dataAdmissão1 DATE,
    IN salário1 INT,
    IN cargo1 VARCHAR(255),
    IN telemóvel1 INT,
    IN email1 VARCHAR(255),
    IN cidade1 VARCHAR(255),
    IN rua1 VARCHAR(255),
    IN porta1 INT,
    IN observações1 VARCHAR(2047)
)
BEGIN
INSERT INTO `Funcionário`
	(`nome`,`dataNascimento`,`NIF`,`dataAdmissão`,`salário`,`cargo`,`telemóvel`,`e-mail`,`cidade`,`rua`,`porta`, `observações`)
    VALUES
	(nome1, dataNascimento1, NIF1, dataAdmissão1, salário1, cargo1, telemóvel1, email1 , cidade1, rua1, porta1, observações1);
END$$
DELIMITER ;

-- Adicionar Headliner
DROP PROCEDURE IF EXISTS AddHeadliner;
DELIMITER $$
CREATE PROCEDURE AddHeadliner(
    IN nome1 VARCHAR(255),
    IN chefe1 VARCHAR(255),
    IN cache1 INT,
    IN observações1 VARCHAR(2047)
)
BEGIN
INSERT INTO `Headliner`
	(`nome`, `chefe`, `cachê`, `observações`)
    VALUES
	(nome1, chefe1, cache1, observações1);
END$$
DELIMITER ;

-- Adicionar Localização
DROP PROCEDURE IF EXISTS AddLocalização;
DELIMITER $$
CREATE PROCEDURE AddLocalização(
    IN codigoPostal1 VARCHAR(255),
    IN cidade1 VARCHAR(255),
    IN população1 INT
)
BEGIN
INSERT INTO `Localização`
	(`codigoPostal`,`cidade`,`população`)
    VALUES
	(codigoPostal1, cidade1, população1);
END$$
DELIMITER ;

-- Adicionar Participantes a um Headliner
DROP PROCEDURE IF EXISTS AddParticipantes;
DELIMITER $$
CREATE PROCEDURE AddParticipantes(
	IN Headliner_idHeadliner1 INT,
    IN participante1 VARCHAR(255)
)
BEGIN
INSERT INTO `participantes`
	(`Headliner_idHeadliner`, `participante`)
    VALUES
	(Headliner_idHeadliner1, participante1);
END$$
DELIMITER ;

-- Adicionar patrocinadores a um Evento
DROP PROCEDURE IF EXISTS AddPatrocinadores;
DELIMITER $$
CREATE PROCEDURE AddPatrocinadores(
	IN Evento_idEvento1 INT,
	IN patrocinador1 VARCHAR(255)
)
BEGIN
INSERT INTO `patrocinadores`
	(`Evento_idEvento`, `patrocinador`)
    VALUES
	(Evento_idEvento1, patrocinador1);
END$$
DELIMITER ;

-- Adicionar registro de Chuva a uma Localização
DROP PROCEDURE IF EXISTS AddRegistroChuvaLoc;
DELIMITER $$
CREATE PROCEDURE AddRegistroChuvaLoc(
	IN Localização_idLocalização1 INT,
    IN registrosChuva1 INT,
    IN registroData1 DATE
)
BEGIN
INSERT INTO `registroschuva`
	(`Localização_idLocalização`,`registrosChuva`, `registroData`)
    VALUES
	(Localização_idLocalização1, registrosChuva1, registroData1);
END$$
DELIMITER ;

-- Adicionar registro de Temperatura a uma Localização
DROP PROCEDURE IF EXISTS AddRegistroTempLoc;
DELIMITER $$
CREATE PROCEDURE AddRegistroTempLoc(
	IN Localização_idLocalização1 INT,
    IN registrosTemp1 INT,
    IN registroData1 DATE
)
BEGIN
INSERT INTO `registrostemperatura`
	(`Localização_idLocalização`,`registrosTemperatura`, `registroData`)
    VALUES
	(Localização_idLocalização1, registrosTemp1, registroData1);
END$$
DELIMITER ;

-- Adicionar registro de Vento a uma Localização
DROP PROCEDURE IF EXISTS AddRegistroVentoLoc;
DELIMITER $$
CREATE PROCEDURE AddRegistroVentoLoc(
	IN Localização_idLocalização1 INT,
    IN registrosVento1 INT,
    IN registroData1 DATE
)
BEGIN
INSERT INTO `registrosvento`
	(`Localização_idLocalização`,`registrosVento`, `registroData`)
    VALUES
	(Localização_idLocalização1, registrosVento1, registroData1);
END$$
DELIMITER ;

-- Adicionar Relação Entre Equipa Funcionário
DROP PROCEDURE IF EXISTS AddRelacaoEquipa_Funcionário;
DELIMITER $$
CREATE PROCEDURE AddRelacaoEquipa_Funcionário(
	IN Equipa_idEquipa1 INT,
	IN Funcionário_idFuncionário1 INT
)
BEGIN
INSERT INTO `equipa_contém_funcionário`
	(`Equipa_idEquipa`, `Funcionário_idFuncionário`)
    VALUES
	(Equipa_idEquipa1, Funcionário_idFuncionário1);
END$$
DELIMITER ;

-- Adicionar Relação Entre Evento Cliente
DROP PROCEDURE IF EXISTS AddRelacaoEvento_Cliente;
DELIMITER $$
CREATE PROCEDURE AddRelacaoEvento_Cliente(
	IN Evento_idEvento1 INT,
	IN Cliente_idCliente1 INT,
    IN classificaçãoQuantitativa1 INT,
    IN pontosPositivos1 VARCHAR(2047),
    IN pontosNegativos1 VARCHAR(2047),
    IN date1 DATE
)
BEGIN
INSERT INTO `evento_avaliado_cliente`
	(`Evento_idEvento`, `Cliente_idCliente`,`classificaçãoQuantitativa`,`pontosPositivos`,`pontosNegativos`,`date`)
    VALUES
	(Evento_idEvento1, Cliente_idCliente1, classificaçãoQuantitativa1, pontosPositivos1 ,pontosNegativos1, date1);
END$$
DELIMITER ;

-- Adicionar Relação Entre Evento Equipa
DROP PROCEDURE IF EXISTS AddRelacaoEvento_Equipa;
DELIMITER $$
CREATE PROCEDURE AddRelacaoEvento_Equipa(
	IN Equipa_idEquipa1 INT,
	IN Evento_idEvento1 INT
)
BEGIN
INSERT INTO `evento_contém_equipa`
	(`Evento_idEvento`,`Equipa_idEquipa`)
    VALUES
	(Equipa_idEquipa1, Evento_idEvento1);
END$$
DELIMITER ;

-- Adicionar Relação Entre Evento Headliner
DROP PROCEDURE IF EXISTS AddRelacaoEvento_Headliner;
DELIMITER $$
CREATE PROCEDURE AddRelacaoEvento_Headliner(
	IN Evento_idEvento1 INT,
    IN Headliner_idHeadliner1 INT
)
BEGIN
INSERT INTO `evento_contém_headliner`
	(`Evento_idEvento`,`Headliner_idHeadliner`)
    VALUES
	(Evento_idEvento1, Headliner_idHeadliner1);
END$$
DELIMITER ;

-- Adicionar Relação Entre Evento Funcionário
DROP PROCEDURE IF EXISTS AddRelacaoEvento_Funcionário;
DELIMITER $$
CREATE PROCEDURE AddRelacaoEvento_Funcionário(
	IN Evento_idEvento1 INT,
    IN Funcionário_idFuncionário1 INT
)
BEGIN
INSERT INTO `evento_divulgado_funcionário`
	(`Evento_idEvento`,`Funcionário_idFuncionário`)
    VALUES
	(Evento_idEvento1, Funcionário_idFuncionário1);
END$$
DELIMITER ;

-- -------------------------------------
-- Remove Eventure
-- -------------------------------------

-- Remover Evento
DROP PROCEDURE IF EXISTS RemEvento;
DELIMITER $$
CREATE PROCEDURE RemEvento(
	IN id INT,
    IN idLoc INT
)
BEGIN
DELETE FROM Evento E WHERE E.idEvento = id AND E.Localização_idLocalização = idLoc;
END$$
DELIMITER ;

-- Remover Bilhete
DROP PROCEDURE IF EXISTS RemBilhete;
DELIMITER $$
CREATE PROCEDURE RemBilhete(
	IN id INT,
    IN idFuncionário INT,
    IN idEvento INT,
    IN idCliente INT
)
BEGIN
DELETE FROM Bilhete B WHERE B.idBilhete = id AND B.Funcionário_idFuncionário = idFuncionário
					  AND B.Evento_idEvento = idEvento AND B.Cliente_idCliente = idCliente;
END$$
DELIMITER ;

-- Remover Cliente
DROP PROCEDURE IF EXISTS RemCliente;
DELIMITER $$
CREATE PROCEDURE RemCliente(
	IN id INT
)
BEGIN
DELETE FROM Cliente C WHERE C.idCliente = id;
END$$
DELIMITER ;

-- Remover Equipa
DROP PROCEDURE IF EXISTS RemEquipa;
DELIMITER $$
CREATE PROCEDURE RemEquipa(
	IN id INT
)
BEGIN
DELETE FROM Equipa E WHERE E.idEquipa = id;
END$$
DELIMITER ;

-- Remover Funcionário
DROP PROCEDURE IF EXISTS RemFuncionário;
DELIMITER $$
CREATE PROCEDURE RemFuncionário(
	IN id INT
)
BEGIN
DELETE FROM Funcionário F WHERE F.idFuncionário = id;
END$$
DELIMITER ;

-- Remover Headliner
DROP PROCEDURE IF EXISTS RemHeadliner;
DELIMITER $$
CREATE PROCEDURE RemHeadliner(
	IN id INT
)
BEGIN
DELETE FROM Headliner H WHERE H.idHeadliner = id;
END$$
DELIMITER ;

-- Remover Localização
DROP PROCEDURE IF EXISTS RemLocalização;
DELIMITER $$
CREATE PROCEDURE RemLocalização(
	IN id INT
)
BEGIN
DELETE FROM Localização L WHERE L.idLocalização = id;
END$$
DELIMITER ;

-- Remover Participantes
DROP PROCEDURE IF EXISTS RemParticipantes;
DELIMITER $$
CREATE PROCEDURE RemParticipantes(
	IN id INT,
    IN participante1 VARCHAR(225)
)
BEGIN
DELETE FROM participantes P WHERE P.Headliner_idHeadliner = id AND P.participante=participante1;
END$$
DELIMITER ;

-- Remover patrocinadores a um Evento
DROP PROCEDURE IF EXISTS RemPatrocinadores;
DELIMITER $$
CREATE PROCEDURE RemPatrocinadores(
	IN id INT,
    IN patrocinador1 VARCHAR(225)
)
BEGIN
DELETE FROM patrocinadores P WHERE P.Evento_idEvento = id AND P.patrocinador=patrocinador1;
END$$
DELIMITER ;

-- Remover registro de Chuva a uma Localização
DROP PROCEDURE IF EXISTS RemRegistroChuvaLoc;
DELIMITER $$
CREATE PROCEDURE RemRegistroChuvaLoc(
	IN id INT,
    IN registroChuva1 VARCHAR(225)
)
BEGIN
DELETE FROM registroschuva RC WHERE RC.Localização_idLocalização = id AND RC.registrosChuva=registroChuva1;
END$$
DELIMITER ;

-- Remover registro de Temperatura a uma Localização
DROP PROCEDURE IF EXISTS RemRegistroTempLoc;
DELIMITER $$
CREATE PROCEDURE RemRegistroTempLoc(
	IN id INT,
    IN registroTemp1 VARCHAR(225)
)
BEGIN
DELETE FROM registrostemperatura RT WHERE RT.Localização_idLocalização = id AND RT.registrosTemperatura=registroTemp1;
END$$
DELIMITER ;

-- Remover registro de Vento a uma Localização
DROP PROCEDURE IF EXISTS RemRegistroVentoLoc;
DELIMITER $$
CREATE PROCEDURE RemRegistroVentoLoc(
	IN id INT,
    IN registroVento1 VARCHAR(225)
)
BEGIN
DELETE FROM registrosvento RV WHERE RV.Localização_idLocalização = id AND RV.registrosvento=registroVento1;
END$$
DELIMITER ;

-- Remover Relação Entre Equipa Funcionário
DROP PROCEDURE IF EXISTS RemRelacaoEquipa_Funcionário;
DELIMITER $$
CREATE PROCEDURE RemRelacaoEquipa_Funcionário(
	IN Equipa_idEquipa1 INT,
    IN Funcionário_idFuncionário1 INT
)
BEGIN
DELETE FROM equipa_contém_funcionário EF WHERE EF.Equipa_idEquipa =  Equipa_idEquipa1 AND EF.Funcionário_idFuncionário=Funcionário_idFuncionário1;
END$$
DELIMITER ;

-- Remover Relação Entre Evento Cliente
DROP PROCEDURE IF EXISTS RemRelacaoEvento_Cliente;
DELIMITER $$
CREATE PROCEDURE RemRelacaoEvento_Cliente(
	IN Evento_idEvento1 INT,
	IN Cliente_idCliente1 INT
)
BEGIN
DELETE FROM evento_avaliado_cliente EC WHERE EC.Evento_idEvento =  Evento_idEvento1 AND EC.Cliente_idCliente=Cliente_idCliente1;
END$$
DELIMITER ;

-- Remover Relação Entre Evento Equipa
DROP PROCEDURE IF EXISTS RemRelacaoEvento_Equipa;
DELIMITER $$
CREATE PROCEDURE RemRelacaoEvento_Equipa(
	IN Equipa_idEquipa1 INT,
	IN Evento_idEvento1 INT
)
BEGIN
DELETE FROM evento_contém_equipa EE WHERE EE.Evento_idEvento =  Evento_idEvento1 AND EE.Equipa_idEquipa=Equipa_idEquipa1;
END$$
DELIMITER ;

-- Remover Relação Entre Evento Headliner
DROP PROCEDURE IF EXISTS RemRelacaoEvento_Headliner;
DELIMITER $$
CREATE PROCEDURE RemRelacaoEvento_Headliner(
	IN Evento_idEvento1 INT,
    IN Headliner_idHeadliner1 INT
)
BEGIN
DELETE FROM evento_contém_headliner EH WHERE EH.Evento_idEvento =  Evento_idEvento1 AND EH.Headliner_idHeadliner=Headliner_idHeadliner1;
END$$
DELIMITER ;

-- Remover Relação Entre Evento Funcionário
DROP PROCEDURE IF EXISTS RemRelacaoEvento_Funcionário;
DELIMITER $$
CREATE PROCEDURE RemRelacaoEvento_Funcionário(
	IN Evento_idEvento1 INT,
    IN Funcionário_idFuncionário1 INT
)
BEGIN
DELETE FROM evento_divulgado_funcionário EF WHERE EF.Evento_idEvento =  Evento_idEvento1 AND EF.Funcionário_idFuncionário=Funcionário_idFuncionário1;
END$$
DELIMITER ;

-- -------------------------------------
-- Chamar as funçãos de ADD
-- -------------------------------------
-- CALL AddEvento('Tá Bem tá', 10000, 'Uma Cena QQL', 13000, 12000, '2022-05-04', '2022-05-07', '5', NULL);
-- CALL AddCliente('Quim das Sirenes', '1982-01-02', 91133322, 'OsBomBeiros@mail.com', 'Braga', 'Rua da Estrada');
-- CALL AddEquipa('Jony P. Heinstain', 'Montar as Coisas', 'Precisam de uma carrinha');
-- CALL AddBilhete(12, NULL, '2023-08-15', '2024-08-16', '2023-02-01', 1, 1, 3);
-- CALL AddFuncionário('Saluh Saly', '1950-04-12', 26643242, '2022-07-14',3549, 'Finanças', '9355333', 'finanças_Saly@mail.com', 'Marrakech', 'Ru di Marrak', 1231,NULL);
-- CALL AddHeadliner('Travis Scott', 'Jacques Webster II' , 3000, 'Quer um AP');
-- CALL AddLocalização('3333', 'Lisboa dos Mouros', 666);
-- CALL AddParticipantes(2, 'Kurt Cobain bem High');
-- CALL AddPatrocinadores(3,'Au Chane');
-- CALL AddRegistroChuvaLoc('7','67','2022-08-15');
-- CALL AddRegistroTempLoc('8','67','2022-08-15');
-- CALL AddRegistroVentoLoc('9','67','2022-08-15');
-- CALL AddRelacaoEquipa_Funcionário(5,5);
-- CALL AddRelacaoEvento_Cliente(5,5,4,'Boa música e bom espaço','Maus acessos','2023-08-27');
-- CALL AddRelacaoEvento_Equipa(5,6);
-- CALL AddRelacaoEvento_Headliner(5,5);
-- CALL AddRelacaoEvento_Funcionário(6,6);

-- -------------------------------------
-- Chamar as funçãos de REM
-- -------------------------------------
-- CALL RemEvento(1,'7');
-- CALL RemCliente(1);
-- CALL RemEquipa(1);
-- CALL RemBilhete(1, 1, 1, 3);
-- CALL RemFuncionário(1);
-- CALL RemHeadliner(1);
-- CALL RemLocalização(1);
-- CALL RemParticipantes(3, 'Matt Helders');
-- CALL RemPatrocinadores(1, 'ErreEfeEme');
-- CALL RemRegistroChuvaLoc('1','67');
-- CALL RemRegistroTempLoc('1','23');
-- CALL RemRegistroVentoLoc('1','67');
-- CALL RemRelacaoEquipa_Funcionário(1,2);
-- CALL RemRelacaoEvento_Cliente(2,1);
-- CALL RemRelacaoEvento_Equipa(1,1);
-- CALL RemRelacaoEvento_Headliner(2,1);
-- CALL RemRelacaoEvento_Funcionário(2,1);