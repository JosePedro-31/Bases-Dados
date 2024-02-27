USE Eventure;

-- Scripts para apagar os índices
DROP INDEX idx_Evento_idEvento ON Evento;
DROP INDEX idx_Bilhete_Evento_idEvento ON Bilhete;

-- Criar os índices
CREATE INDEX idx_Evento_idEvento ON Evento(idEvento);
CREATE INDEX idx_Bilhete_Evento_idEvento ON Bilhete(Evento_idEvento);

-- Inicia o profiling
SET PROFILING = 1;

-- Executa a consulta
SELECT E.idEvento AS 'ID Evento', E.nome AS 'Nome', 
       SUM(B.preço) AS 'Vendas €'
	FROM Evento E
	JOIN Bilhete B ON E.idEvento = B.Evento_idEvento
	GROUP BY E.idEvento
	ORDER BY SUM(B.preço) DESC;

-- Encerra o profiling
SET PROFILING = 0;

SHOW PROFILES;