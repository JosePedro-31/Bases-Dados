USE Eventure;

-- -------------------------
-- Utilizadores
-- -------------------------
-- Criação do utilizador para o CEO
CREATE USER 'CEOEventure'@'localhost';
SET PASSWORD FOR 'CEOEventure'@'localhost' = 'VítorFonseca';
-- Criação do utilizador 'prog' para a equipa de PROGAMAÇÃO
CREATE USER 'prog'@'localhost';
SET PASSWORD FOR 'prog'@'localhost' = 'LCC2023';
-- Criação do utilizador para o Daniel Tardio
CREATE USER 'FinancasEventure'@'localhost';
SET PASSWORD FOR 'FinancasEventure'@'localhost' = 'DanielTardio';
-- Criação do utilizador para o Vera Lama
CREATE USER 'MarketingEventure'@'localhost';
SET PASSWORD FOR 'MarketingEventure'@'localhost' = 'VeraLama';
-- Criação do utilizador para o Evaldo Perfeito
CREATE USER 'RPEventure'@'localhost';
SET PASSWORD FOR 'RPEventure'@'localhost' = 'EvaldoPerfeito';
-- Criação de um utilizador 'funcionário'
CREATE USER 'funcionárioEventure'@'localhost';
SET PASSWORD FOR 'funcionárioEventure'@'localhost' = 'funcionarioEventure2023';
-- Criação de um utilizador 'funcionário'
CREATE USER 'clienteEventure'@'localhost';
SET PASSWORD FOR 'clienteEventure'@'localhost' = 'JonyBravoEventure2023';

FLUSH PRIVILEGES;

-- -------------------------
-- Permissões
-- -------------------------
-- RC04/RC05
-- Permissão de acesso a todos os objectos da base de dados em 'localhost'. 
GRANT ALL ON Eventure.* TO 'CEOEventure'@'localhost';
GRANT ALL ON Eventure.* TO 'prog'@'localhost';

-- Adicionar todas as permissoes, é mais facil remover depois
GRANT SELECT, INSERT, UPDATE ON Eventure.* TO 'FinancasEventure'@'localhost';
GRANT SELECT, INSERT, UPDATE ON Eventure.* TO 'MarketingEventure'@'localhost'; 
GRANT SELECT, INSERT, UPDATE ON Eventure.* TO 'RPEventure'@'localhost'; 

-- RC01/RC02
-- Remover Permissões
REVOKE EXECUTE ON PROCEDURE ListaNFuncionários_Equipa FROM 'MarketingEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE ListaEquipa_Funcionários FROM 'MarketingEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE FinançasGerais FROM 'MarketingEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddEvento FROM 'MarketingEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddEquipa FROM 'MarketingEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddFuncionário FROM 'MarketingEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemEvento FROM 'MarketingEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemEquipa FROM 'MarketingEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemFuncionário FROM 'MarketingEventure'@'localhost';


REVOKE EXECUTE ON PROCEDURE QuantidadeBilhetes FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE ListaNFuncionários_Equipa FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE ListaEventos_Localização FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE ListaDadosChuva_Localização FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE ListaDadosTemperatura_Localização FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE ListaDadosVento_Localização FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE ListaEquipa_Funcionários FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE FinançasGerais FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE ListaEventosSucessoVendas FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE ListaEventosSucessoLucros FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddEvento FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddEquipa FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddFuncionário FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddLocalização FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddParticipantes FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddRegistroChuvaLoc FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddRegistroTempLoc FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddRegistroVentoLoc FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddRelacaoEquipa_Funcionário FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddRelacaoEvento_Equipa FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE AddRelacaoEvento_Funcionário FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemEvento FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemEquipa FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemFuncionário FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemLocalização FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemParticipantes FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemRegistroChuvaLoc FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemRegistroTempLoc FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemRegistroVentoLoc FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemRelacaoEquipa_Funcionário FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemRelacaoEvento_Equipa FROM 'RPEventure'@'localhost';
REVOKE EXECUTE ON PROCEDURE RemRelacaoEvento_Funcionário FROM 'RPEventure'@'localhost';


-- -----------------------
-- Funcionário e Cliente
-- -----------------------
-- RC03
GRANT EXECUTE ON PROCEDURE AddCliente TO 'funcionárioEventure'@'localhost';
GRANT EXECUTE ON PROCEDURE AddBilhete TO 'funcionárioEventure'@'localhost';

GRANT EXECUTE ON PROCEDURE AddCliente TO 'clienteEventure'@'localhost';
GRANT EXECUTE ON PROCEDURE RemCliente TO 'clienteEventure'@'localhost';