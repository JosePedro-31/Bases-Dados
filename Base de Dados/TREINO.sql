/*
-- Quantidade de bilhetes
SELECT COUNT(B.idBilhete) AS 'Quantidade de Bilhetes' 
	FROM Bilhete B
*/

/*
-- Quantidade de funcionários de uma equipa
SELECT E.idEquipa AS 'ID da Equipa', E.chefe AS 'Chefe Equipa', COUNT(EF.Funcionário_idFuncionário) AS 'Quantidade de Funcionários'
 	FROM Equipa E
 	JOIN Equipa_contém_Funcionário EF ON E.idEquipa = EF.Equipa_idEquipa
 	GROUP BY E.idEquipa
*/

/*
-- Históricos dos Eventos de uma Localização 
SELECT L.cidade AS 'Cidade', L.idLocalização AS 'ID Localização', E.nome AS 'Nome Evento'
	FROM Evento E
	JOIN Localização L ON L.idLocalização = E.Localização_idLocalização -- AND L.cidade = 'Lisboa'
	GROUP BY L.cidade
+/

/*
-- Lista Eventos dos próximos 30 dias
SELECT E.nome AS 'Nome Evento', E.idEvento AS 'ID Evento', E.inicioEvento AS 'Data Início'
	FROM Evento E
	WHERE E.inicioEvento > current_date() AND E.inicioEvento < current_date() + INTERVAL 30 DAY
    GROUP BY E.nome
*/

/*
-- Localizações pelos dados climatéricos
SELECT L.cidade AS 'Localização', L.idLocalização AS 'ID Localização',
	RC.registrosChuva AS 'Chuva', RV.registrosVento AS 'Vento', RT.registrosTemperatura AS 'Temperatura'
	FROM Localização L
    JOIN registrosChuva RC ON RC.Localização_idLocalização = L.idLocalização
    JOIN registrosVento RV ON RV.Localização_idLocalização = L.idLocalização
    JOIN registrosTemperatura RT ON RT.Localização_idLocalização = L.idLocalização
    GROUP BY L.cidade
*/


/*
-- Lista de membros por equipa
SELECT E.idEquipa AS 'ID Equipa', E.chefe AS 'Chefe Equipa', F.nome AS 'Funcionário'
	FROM Equipa E
	JOIN Equipa_contém_Funcionário EF ON E.idEquipa = EF.Equipa_idEquipa
	JOIN Funcionário F ON EF.Funcionário_idFuncionário = F.idFuncionário
*/

/*
-- Lista de Patrocinadores
SELECT EV.idEvento AS 'ID Evento', EV.nome AS 'Evento', P.patrocinador AS 'Patrocinador'
	FROM Evento EV
	JOIN patrocinadores P ON EV.idEvento = P.Evento_idEvento
*/

/*
-- Lista Clientes (aquisições, custos das mesmas)
SELECT C.nome AS 'Cliente', B.aquisição AS 'Aquisição', B.preço AS 'Preço'
FROM Cliente C
Join Bilhete B ON C.idCliente = B.Cliente_idCliente
*/

/*
-- Histórico de um Cliente
SELECT C.nome AS 'Cliente' , C.telemóvel AS 'Telemóvel', B.idBilhete AS 'ID Bilhete', EV.nome AS 'Evento'
	FROM Cliente C
    JOIN Bilhete B ON C.idCliente = B.Cliente_idCliente AND C.idCliente = 5
    JOIN Evento EV ON B.Evento_idEvento = EV.idEvento
*/

/*
-- Finanças gerais da Empresa
SELECT SUM(E.custo) AS 'Custo Geral', SUM(E.`orçamento`) AS 'Orçamento Geral', SUM(B.preço) AS 'Total de € em Vendas de Bilhetes', 
	   (SUM(E.`orçamento`) - SUM(E.custo) + SUM(B.preço)) AS 'Lucro'
	FROM Evento E
    JOIN BILHETE B; 
*/

/*
-- Eventos ordenados por lucro
SELECT E.idEvento AS 'ID Evento', E.nome AS 'Nome', 
	   SUM(B.preço) AS 'Vendas €'
       FROM Evento E
       JOIN Bilhete B On E.idEvento = B.Evento_idEvento
       GROUP BY E.idEvento
       ORDER BY SUM(B.preço) DESC;
*/

/*
-- Eventos ordenados por qtd de bilhetes vendidos
SELECT EV.idEvento AS 'ID Evento', EV.nome AS 'Evento', COUNT(B.idBilhete) AS 'QTD Bilhetes Vendidos'
	FROM Evento EV
	JOIN Bilhete B ON EV.idEvento = B.Evento_idEvento
	GROUP BY EV.idEvento
	ORDER BY COUNT(B.idBilhete) DESC;
*/

/*
-- Sempre que o Headliner participa num Evento
SELECT H.idHeadliner AS 'ID Headliner', H.nome AS 'Headliner', EV.nome AS 'Evento'
	FROM Headliner H
    JOIN Evento_contém_Headliner EH ON H.idHeadliner = EH.Headliner_idHeadliner
    JOIN Evento EV ON EV.idEvento = EH.Evento_idEvento
    ORDER BY H.nome;
*/

/*
-- Listar opiniões de um Cliente
SELECT C.idCliente AS 'ID Cliente', C.nome AS 'Cliente', EC.classificaçãoQuantitativa AS 'Classificação Quantitiva', 
EC.pontosPositivos AS 'Pontos Positivos', EC.pontosNegativos AS 'Pontos Negativos'
	FROM Cliente C
    JOIN Evento_avaliado_Cliente EC ON C.idCliente = EC.Cliente_idCliente
	JOIN Evento E ON E.idEvento = EC.Evento_idEvento
	GROUP BY C.idCliente, E.idEvento;
*/    

/*
-- Pontos positivos e negativos de um Evento
SELECT EV.idEvento AS 'ID Evento', EV.nome AS 'Evento', EC.pontosPositivos AS 'Pontos Positivos', EC.pontosNegativos AS 'Pontos Negativos'
	FROM Evento EV
    JOIN Evento_avaliado_Cliente EC ON EV.idEvento = EC.Evento_idEvento AND EV.idEvento = 2
    GROUP BY EV.idEvento, EV.nome, EC.pontosPositivos, EC.pontosNegativos
    ORDER BY EV.idEvento
*/

/*
-- Listagem dos Eventos pelas Avaliações Quantitativas
SELECT EV.idEvento AS 'ID Evento', EV.nome AS 'Evento', EC.classificaçãoQuantitativa AS 'Classificação Quantitativa'
	FROM Evento EV
    JOIN Evento_avaliado_Cliente EC ON EV.idEvento = EC.Evento_idEvento
    ORDER BY EC.classificaçãoQuantitativa DESC
*/