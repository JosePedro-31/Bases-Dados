USE Eventure;

-- ------------------------
-- Req. Exploração
-- ------------------------

-- RE01 
-- Quantidade de bilhetes
DROP PROCEDURE IF EXISTS QuantidadeBilhetes;
DELIMITER $$
CREATE PROCEDURE QuantidadeBilhetes(
    IN dataInicial DATE,
    IN dataFinal DATE
)
BEGIN
    SELECT COUNT(B.idBilhete) AS 'Quantidade de Bilhetes'
    FROM Bilhete B
    WHERE B.aquisição BETWEEN dataInicial AND dataFinal;
END$$
DELIMITER ;    
 
-- RE02 
-- Será necessário a listar as equipas pela quantidade de elementos pertencentes a cada
DROP PROCEDURE IF EXISTS ListaNFuncionários_Equipa;
DELIMITER $$   
CREATE PROCEDURE ListaNFuncionários_Equipa(
    IN equipaP INT
)
BEGIN
SELECT E.idEquipa AS 'ID Equipa', E.chefe AS 'Chefe da Equipa', 
	   E.função AS 'Função da Equipa', 
       COUNT(EF.Funcionário_idFuncionário) AS numElementos
	FROM Equipa E
	JOIN Equipa_contém_Funcionário EF ON E.idEquipa = EF.Equipa_idEquipa AND  E.idEquipa = equipaP  -- Usamos o left join para aparecer as equipas sem funcionários atualmente
    GROUP BY E.idEquipa;
END$$
DELIMITER ;

-- RE03 
-- É necessária uma Listagem do histórico dos eventos de uma localização
DROP PROCEDURE IF EXISTS ListaEventos_Localização;
DELIMITER $$
CREATE PROCEDURE ListaEventos_Localização(
	IN id INT
)
BEGIN
SELECT L.idLocalização AS 'ID Localização', L.cidade AS 'Cidade', Ev.idEvento AS 'ID Evento', Ev.nome AS 'Nome do Evento'
	FROM Evento Ev
    JOIN Localização L ON L.idLocalização = Ev.Localização_idLocalização AND Ev.fimEvento < NOW() 
    AND L.idLocalização = id
    GROUP BY L.idLocalização, Ev.idEvento
    ORDER BY Ev.idEvento ASC;
END$$
DELIMITER ;

-- RE04
-- É importante uma lista de eventos nos próximos 30 dias
DROP PROCEDURE IF EXISTS ProximosEventos;
DELIMITER $$
CREATE PROCEDURE ProximosEventos()
BEGIN
SELECT * From Evento Ev
	WHERE Ev.inicioEvento > NOW() AND Ev.inicioEvento < NOW() + INTERVAL 30 DAY;
END$$
DELIMITER ;

-- RE05
-- Listagem das localizações pelos dados climatéricos
-- Chuva
DROP PROCEDURE IF EXISTS ListaDadosChuva_Localização;
DELIMITER $$
CREATE PROCEDURE ListaDadosChuva_Localização(
	IN dataInicial DATE,
    IN dataFinal DATE,
    IN id INT
)
BEGIN
SELECT 
    L.idLocalização AS 'Localização', 
    L.cidade AS 'Cidade',
    L.codigoPostal AS 'Codigo Postal',
    LChuva.registrosChuva as 'Chuva'
	FROM Localização L
	JOIN registrosChuva LChuva ON LChuva.Localização_idLocalização = L.idLocalização 
    AND L.idLocalização = id
    AND LChuva.registroData BETWEEN dataInicial AND dataFinal
	ORDER BY LChuva.registroData;
END$$
DELIMITER ;

-- Temperatura
DROP PROCEDURE IF EXISTS ListaDadosTemperatura_Localização;
DELIMITER $$
CREATE PROCEDURE ListaDadosTemperatura_Localização(
	IN dataInicial DATE,
    IN dataFinal DATE,
    IN id INT
)
BEGIN
SELECT 
    L.idLocalização AS 'Localização', 
    L.cidade AS 'Cidade',
    L.codigoPostal AS 'Codigo Postal',
    LTemp.registrosTemperatura as 'Temperatura'
	FROM Localização L
	JOIN registrosTemperatura LTemp ON LTemp.Localização_idLocalização = L.idLocalização
    AND L.idLocalização = id
    AND LTemp.registroData BETWEEN dataInicial AND dataFinal
	ORDER BY LTemp.registroData;
END$$
DELIMITER ;

-- Vento
DROP PROCEDURE IF EXISTS ListaDadosVento_Localização;
DELIMITER $$
CREATE PROCEDURE ListaDadosVento_Localização(
	IN dataInicial DATE,
    IN dataFinal DATE,
    IN id INT
)
BEGIN
SELECT 
    L.idLocalização AS 'Localização', 
    L.cidade AS 'Cidade',
    L.codigoPostal AS 'Codigo Postal',
    LVento.registrosVento as 'Vento'
	FROM Localização L
	JOIN registrosVento LVento ON LVento.Localização_idLocalização = L.idLocalização
    AND L.idLocalização = id
    AND LVento.registroData BETWEEN dataInicial AND dataFinal
	ORDER BY LVento.registroData;
END$$
DELIMITER ;

-- RE06
-- É relevante existir uma lista de membros por equipa
DROP PROCEDURE IF EXISTS ListaEquipa_Funcionários;
DELIMITER $$
CREATE PROCEDURE ListaEquipa_Funcionários(
	IN id INT
    )
BEGIN
SELECT E.idEquipa AS 'ID Equipa',E.Chefe AS 'Chefe', E.função AS 'Função da Equipa', 
	F.idFuncionário AS 'ID Funcionário', F.nome AS 'Nome Funcionário', F.cargo AS 'Cargo', F.`e-mail` AS 'E-Mail', 
    F.`telemóvel` AS 'Telemóvel', F.`dataNascimento` AS 'Data Nascimento', F.`dataAdmissão` AS 'Data Admissão',
    F.`cidade` AS 'Cidade', F.`rua` AS 'Rua', F.`porta` AS 'Porta', F.`observações` AS 'Obs'
	FROM Equipa E
    JOIN equipa_contém_funcionário EF ON EF.Equipa_idEquipa = E.idEquipa 
	AND E.idEquipa = id
    JOIN Funcionário F ON EF.Funcionário_idFuncionário = F.idFuncionário
    GROUP BY F.idFuncionário;
END$$
DELIMITER ;

-- RE07
-- É necessário a disponibilização da lista de Patrocinadores 
DROP PROCEDURE IF EXISTS ListaPatrocinadores;
DELIMITER $$
CREATE PROCEDURE ListaPatrocinadores(
	IN id INT
    )
BEGIN
SELECT * FROM patrocinadores
	WHERE patrocinadores.Evento_idEvento = id;
END$$
DELIMITER ;

-- RE08
-- Listagem com os clientes (quantidade de aquisições e custo das mesmas)
DROP PROCEDURE IF EXISTS ListaClientes;
DELIMITER $$
CREATE PROCEDURE ListaClientes ()
BEGIN
SELECT  C.idCliente AS 'ID Cliente', C.nome AS 'Nome', C.telemóvel AS 'Telemóvel', COUNT(B.idBilhete) as 'Quantidade de Bilhetes', SUM(B.preço) as 'Total de compras'
	FROM Cliente C
	JOIN Bilhete B ON C.idCliente = B.Cliente_idCliente
    GROUP BY C.idCliente
	ORDER BY B.preço, COUNT(B.idBilhete);
END$$
DELIMITER ;

-- RE09
-- Conseguir obter o histórico de um cliente 
DROP PROCEDURE IF EXISTS HistóricoCliente;
DELIMITER $$
CREATE PROCEDURE HistóricoCliente(
	IN id INT
    )
BEGIN
SELECT B.Cliente_idCliente AS 'ID Cliente', C.nome AS 'Nome do Cliente', B.Evento_idEvento AS 'ID Evento'
	FROM Bilhete B
    JOIN Cliente C ON C.idCliente = B.Cliente_idCliente AND C.idCliente = id
    GROUP BY B.Evento_idEvento
    ORDER BY B.Evento_idEvento;
END$$
DELIMITER ;

-- RE10
-- Tem de ser permitido à equipa ter acesso às Finanças Gerais da empresa  
DROP PROCEDURE IF EXISTS FinançasGerais;
DELIMITER $$
CREATE PROCEDURE FinançasGerais()
BEGIN
SELECT SUM(E.custo) AS 'Custo Geral', SUM(E.`orçamento`) AS 'Orçamento Geral', SUM(B.preço) AS 'Total de € em Vendas de Bilhetes', 
	   (SUM(E.`orçamento`) - SUM(E.custo) + SUM(B.preço)) AS 'Lucro'
	FROM Evento E
    JOIN BILHETE B; 
 END$$
 DELIMITER ;

 -- RE11
-- É necessária uma ordenação dos eventos pelo seu sucesso a nível de vendas
DROP PROCEDURE IF EXISTS ListaEventosSucessoVendas;
DELIMITER $$
CREATE PROCEDURE ListaEventosSucessoVendas()
BEGIN
SELECT E.idEvento AS 'ID Evento', E.nome AS 'Nome', 
	   SUM(B.preço) AS 'Vendas €'
       FROM Evento E
       JOIN Bilhete B On E.idEvento = B.Evento_idEvento
       GROUP BY E.idEvento
       ORDER BY SUM(B.preço) DESC;
 END$$
 DELIMITER ;

-- RE12
-- É necessária uma ordenação dos eventos pelo quantidade de bilhetes vendidos
DROP PROCEDURE IF EXISTS ListaEventosSucessoLucros;
DELIMITER $$
CREATE PROCEDURE ListaEventosSucessoLucros()
BEGIN
SELECT E.idEvento AS 'ID Evento', E.nome AS 'Nome', 
       COUNT(B.idBilhete) AS 'Quantidade de Bilhetes Vendidas'
       FROM Evento E
       JOIN Bilhete B On E.idEvento = B.Evento_idEvento
       GROUP BY E.idEvento
       ORDER BY COUNT(B.idBilhete) DESC; 
END $$
DELIMITER ;

-- RE13
-- A base de dados tem de fornecer a quantidade de vezes que o headliner tem participação com a empresa em si
DROP PROCEDURE IF EXISTS ListaEventos_Headliner;
DELIMITER $$
CREATE PROCEDURE ListaEventos_Headliner(
	IN id INT
    )
BEGIN
SELECT H.idHeadliner AS 'ID Headliner' , H.nome AS 'Nome Headliner', 
	   H.chefe AS 'Chefe', 
	   H.cachê AS 'Cachê', 
       EH.Evento_idEvento AS 'ID Evento'
	FROM Headliner H
    JOIN `evento_contém_headliner` EH ON H.idHeadliner = EH.Headliner_idHeadliner 
    AND H.idHeadliner = id
    GROUP BY EH.Evento_idEvento
    ORDER BY EH.Evento_idEvento;
END$$
DELIMITER ;

-- RE14
-- Tem de ser possível listar as opiniões de um cliente
DROP PROCEDURE IF EXISTS OpiniãoCliente;
DELIMITER $$
CREATE PROCEDURE OpiniãoCliente(
	IN id INT
    )
BEGIN
SELECT C.idCliente AS 'ID Cliente', C.nome AS 'Nome Cliente', 
	   E.idEvento AS 'ID Evento', E.nome AS 'Nome Evento', 
       EC.classificaçãoQuantitativa AS 'Classificação 0/10', 
       EC.pontosPositivos AS 'Pontos Positivos', EC.pontosNegativos AS 'Pontos Negativos', 
       EC.`date` AS 'Data da Avaliação'
       FROM Cliente C
       JOIN `evento_avaliado_cliente` EC ON C.idCliente = EC.Cliente_idCliente 
       AND C.idCliente = id
       JOIN Evento E ON E.idEvento = EC.Evento_idEvento
       GROUP BY C.idCliente, E.idEvento;
END$$
DELIMITER ;

-- RE15
-- Pontos Positivos/Negativos de um evento
DROP PROCEDURE IF EXISTS PosNegEventos;
DELIMITER $$
CREATE PROCEDURE PosNegEventos(
	IN id INT 
)
BEGIN
SELECT E.idEvento AS 'ID Evento', 
	   EC.pontosPositivos AS 'Pontos Positivos', 
       EC.pontosNegativos AS 'Pontos Negativos', EC.Cliente_idCliente AS 'ID Cliente'
	FROM Evento E
    JOIN `evento_avaliado_cliente` EC ON E.idEvento = EC.Evento_idEvento
    AND E.idEvento = id
    GROUP BY E.idEvento,EC.pontosPositivos, EC.pontosNegativos
    ORDER BY E.idEvento;
END$$
DELIMITER ;

-- RE16
-- Listagem dos eventos pelas avaliações quantitativas
DROP PROCEDURE IF EXISTS ListaEventosClassificação;
DELIMITER $$
CREATE PROCEDURE ListaEventosClassificação()
BEGIN
SELECT E.idEvento AS 'ID Evento', AVG(EC.classificaçãoQuantitativa) AS 'Classificação Média 0/10'
    FROM Evento E
    JOIN `evento_avaliado_cliente` EC ON E.idEvento = EC.Evento_idEvento
    GROUP BY E.idEvento
    ORDER BY EC.classificaçãoQuantitativa DESC;
END$$
DELIMITER ;

-- -------------------------------------
-- Chamar as Proc. de Exploração
-- -------------------------------------

-- CALL QuantidadeBilhetes('2023-01-01','2024-12-30');                      -- recebe 2 datas
-- CALL ListaNFuncionários_Equipa(2);                                       -- recebe 1 id de uma Equipa
-- CALL ListaEventos_Localização(7);                                        -- recebe 1 id de uma Localização
-- CALL ProximosEventos();         
-- CALL ListaDadosChuva_Localização('2023-01-01','2024-12-30', 3);          -- recebe 2 datas e 1 id de uma Localização
-- CALL ListaDadosTemperatura_Localização('2023-01-01','2024-12-30', 3);    -- recebe 2 datas e 1 id de uma Localização
-- CALL ListaDadosVento_Localização('2023-01-01','2024-12-30', 3);          -- recebe 2 datas e 1 id de uma Localização
-- CALL ListaEquipa_Funcionários(2);                                        -- recebe 1 id de uma Equipa
-- CALL ListaPatrocinadores(2);                                             -- recebe 1 id de um Evento
-- CALL ListaClientes();
-- CALL HistóricoCliente(2);                                                -- recebe 1 id de um Cliente
-- CALL FinançasGerais();
-- CALL ListaEventosSucessoVendas();
-- CALL ListaEventosSucessoLucros();
-- CALL ListaEventos_Headliner(1);                                          -- recebe 1 id de um Headliner
-- CALL OpiniãoCliente(1);                                                  -- recebe 1 id de um Cliente
-- CALL PosNegEventos(2);                                                   -- recebe 1 id de um Evento
-- CALL ListaEventosClassificação();