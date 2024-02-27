USE Eventure;

-- -----------------
-- Algumas Vistas
-- -----------------
DROP VIEW IF EXISTS vistaCliente;
CREATE VIEW vistaCliente AS
	SELECT C.nome AS 'Nome do Clinte', E.nome AS 'Evento', B.preço AS 'Preço do Bilhete', 
		   B.inicioEvento AS 'Inicio', B.fimEvento AS 'Fim'
    FROM Cliente C
    JOIN Bilhete B ON C.idCliente = B.Cliente_idCliente
    JOIN Evento E ON B.Evento_idEvento = E.idEvento
    GROUP BY C.nome,E.nome;
    
DROP VIEW IF EXISTS vistaFuncionário;    
CREATE VIEW vistaFuncionário AS
	SELECT F.nome AS 'Nome do Funcionário', EF.Equipa_idEquipa AS 'ID da Equipa', E.chefe AS 'Chefe'
    FROM Funcionário F
    JOIN equipa_contém_funcionário EF ON EF.Funcionário_idFuncionário = F.idFuncionário
    JOIN Equipa E ON E.idEquipa = EF.Equipa_idEquipa
    GROUP BY F.nome,EF.Equipa_idEquipa;    
    
DROP VIEW IF EXISTS vistaBilhete;    
CREATE VIEW vistaBilhete AS
	SELECT B.idBilhete AS 'ID Bilhete', C.nome AS 'Cliente que tem o bilhete'
    FROM Bilhete B
    JOIN Cliente C ON B.Cliente_idCliente = C.idCliente
    GROUP BY B.idBilhete,C.nome
    ORDER BY B.idBilhete;

-- ------------------------
-- Chamar as Vistas
-- ------------------------

-- SELECT * FROM vistaCliente;
-- SELECT * FROM vistaFuncionário;
-- SELECT * FROM vistaBilhete;