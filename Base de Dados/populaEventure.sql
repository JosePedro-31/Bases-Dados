USE Eventure;

-- -----------------------------------------------------------------------------------
-- Povoar Entidades
-- -----------------------------------------------------------------------------------

-- Povoar Evento
INSERT INTO `Evento`
	(`nome`,`audiênciaMax`,`categoria`,`custo`,`orçamento`,`inicioEvento`,`fimEvento`,`Localização_idLocalização`, `observações`)
    VALUES
	('Pimenta Vermelha Picante', 10000, 'Concerto', 30000, 32000, '2022-03-04', '2022-03-04', '7', 'O Jonh Frusciante precisa de uma guitarra vermelha'),
    ('Meo Sudo Leste', 12000, 'Festival', 32000, 25000, '2023-08-25', '2023-08-28', '7', 'Várias Equipas terceiras têm de dividir a agenda'),  		   -- Evento antigo
    ('Outono Prima Sound', 6666, 'Festival', 18000, 22200, '2022-03-04', '2022-03-07', '2', NULL),       -- Evento antigo
    ('Culinária Portunganlesa', 1000, 'Culinária', 3500, 3000, '2024-03-12', '2024-03-13', '3', 'Necessário existir a permissão de gestão de gás metropolitano'),
    ('Preço Quase Sempre Certo', 10000, 'Programa de Televisão Direto', 10000, 12000, '2022-05-04', '2022-05-07', '7', NULL),
    ('Alquem quer', 2048, 'Procissão', 10232, 15000, '2024-06-04', '2024-06-04', '1', NULL),
    ('Picket Pockets without guilty moments', '10033', 'Privado', 3000, 3200, '2024-03-04', '2024-03-17', '2', 'Evento do Evaldo III, primo do CEO'),
    ('Rap in Rio', 10000, 'Festival', 30000, 32000, '2023-12-11', '2024-03-13', '6', 'A ser processados pelo Rock in Rio'),
    ('Maybe there something gud', 10000, 'peddypaper', 2000, 2000, '2023-12-12', '2024-03-06', '11', NULL)
    ;

-- Povoar Localização
INSERT INTO `Localização`
	(`codigoPostal`,`cidade`,`população`)
    VALUES
    ('2580', 'Alenquer', 44428), 
    ('2610', 'Amadora', 171719),
    ('2361', 'Arruda dos Vinhos', 13983), 
    ('2050', 'Azambuja', 21421),
    ('2550', 'Cadaval', 13382),
    ('2765', 'Cascais', 213134),
    ('1300', 'Lisboa', 544851),
    ('2680', 'Loures', 201646),
    ('2530', 'Lourinhã', 26261),
    ('2655', 'Mafra', 89130),
    ('1675', 'Odivelas', 14815),
    ('2740', 'Oeiras', 171802),
    ('2725', 'Sintra', 385954),
    ('2590', 'Sobral de Monte Agraço', 10542),
    ('2565', 'Torres Vedras', 83130),
    ('2600', 'Vila Franca de Xira', 137659)
    ;

-- Povoar Headliner
INSERT INTO `Headliner`
    (`nome`, `chefe`, `cachê`, `observações`)
    VALUES
    ('Travis Scott', 'Jacques Webster II' , 3000, 'Pretende que haja uma cama antes e depois do concerto'),
    ('Kendrick Lamar', 'Kendrick Duckworth' , 250, 'Alugar um hótel só para ele e a equipa'),
    ('Arctic Monkeys', 'Alex Turner' , 300, 'Camarote refrigerado'),
    ('Silk Sonic', 'Peter Hernandez' , 5500, 'Mesmo hotel que Brandon Anderson'), 
    ('Daft Punk', 'Guillaume de Homem-Christo' , 500, 'Camarote com desumidificador'), 
    ('Slow J', 'João Coelho' , 700, NULL),
    ('Profjam', 'Mário Cotrim' , 800, 'Hotel 5 estrelas'),
    ('Rui Veloso', 'Rui Veloso' , 500, NULL),
    ('U2', 'Bono' , 6000, 'Hotel próximo do local do concerto'),
    ('Chico da Tina', ' Francisco da Concertina' , 500, 'Cuidado com ele'),
    ('Yuri NR5', 'Yuri' , 300, 'Pagamento em notas de 100'), 
    ('Dua Lipa', 'Dua Lipa' , 600, 'Camarote luxuoso'),
    ('Red Hot Chili Peppers', 'Anthony Kiedis' , 400, 'Hotel próximo do local do concerto'),
    ('Fernando Mentos', 'Fernando Mentos' , 500, 'Alérgico a amendoins'),
    ('Henrique Sá Pessoa', 'Henrique Sá Pessoa' , 500, NULL),
    ('Grupo Coral de Algés', 'Antonio Canto' , 500, 'Grupo com crianças'), 
    ('Pedro Moral', 'Pedro Moral' , 500, NULL),
    ('Antonio Meireles', 'Antonio Meireles' , 500, 'Nao gosta de peixe'),
    ('Fernando Lopes da Silva', 'Lopes da Silva' , 100, NULL),
    ('Vitor Povo', 'Vitor Povo', 200, 'Dinheiro vivo')
    ;

-- Povoar Funcionário
INSERT INTO `Funcionário`
	(`nome`,`dataNascimento`,`NIF`,`dataAdmissão`,`salário`,`cargo`,`telemóvel`,`e-mail`,`cidade`,`rua`,`porta`, `observações`)
    VALUES
    ('Vitor Fonseca', '1984-06-06', 152135124, '2018-04-01',100000, 'CEO', '912765422', 'CEO_EVENTURE@mail.com', 'Braga', 'Rua dos Peões', 9, 'Um grande homem, literalmente!'),
    ('Vera Lama', '1994-10-26', 198765124, '2018-04-01',10000, 'Diretor de Marketing', '912765422', 'dir_marketing@mail.com', 'Braga', 'Rua dos Peões', 9, 'Tem problemas visuais graves'),
    ('João da Maria', '1997-12-21', 122265324, '2018-04-01',1350, 'Marketing', '912765422', 'marketing_joao@mail.com', 'Sintra', 'Rua de Cintura', 2, 'Tem hipoglicemia Cardiaca'),
    ('Carlos Ramboia', '2001-07-11', 122877624, '2018-04-01',1700, 'Marketing', '914545422', 'marketing_ramboia@mail.com', 'Algarve', 'Rua Algarvia', 8, 'Tem histórico de convulsões'),
    ('Maria Marcelina', '2002-07-11', 147254824, '2019-06-03',1500, 'Marketing', '912722222', 'marketing_marcelina@mail.com', 'Algarve', 'Rua Portuense', 1, 'Tem insónias'),
	('Daniel Tardio', '1969-03-02', 147849314, '2018-04-01',10000, 'Diretor de Finanças', '933333333', 'dir_finanças@mail.com', 'Braga', 'Rua Do Minho', 3, 'Registo criminal'),
    ('Daniel Homano', '2002-07-11', 147254824, '2019-06-03',1000, 'Finanças', '933333331', 'finanças_homano@mail.com', 'Porto', 'Rua Da Portela', 15, NULL),
    ('Rafael Pedro Grão', '2002-04-12', 127254824, '2020-11-04',1349, 'Finanças', '933333332', 'finanças_grao@mail.com', 'Leiria', 'Rua Da Lei da Ria', 147, 'Tem dislexia de grau 3'),
    ('Saluh Mah Hed', '1950-04-12', 2664342, '2022-07-14',3549, 'Finanças', '933333333', 'finanças_hed@mail.com', 'Marrakech', 'Ru di Marrak', 1231, 'Tem dificuldades em falar portugues'),
    ('Evaldo Perfeito', '1930-04-12', 111111, '2020-07-02',3222, 'Diretor de Relações Públicas', '922222221', 'dir_RP@mail.com', 'Viana do Castelo', 'Rua dos Com Abrigo', 333, 'Não pode ver vermelho'),
    ('Vale do Imperfeito', '1950-04-12', 247457233, '2019-05-01',3340, 'Relações Públicas', '922222222', 'RP_imperfeito@mail.com', 'Bragança', 'Rua dos Sem Abrigo', 666, 'Tem de beber 3 litros de agua por dia'),
    ('Jony P. Heinstain', '1918-04-12', 242532521, '2021-10-19',9000, 'Relações Públicas', '922222222', 'RP_heinstain@mail.com', 'Hamburgo', 'Rue do McDonalds', 231, 'Idade um quanto avançada'),
    ('Roberto Desleal', '2001-10-01', 113321412, '2023-10-01',1000, 'Limpeza', '912313423', 'oRealDesleal@mail.com', 'Porto', 'Rua S.Tiago', 12, 'Ele tem um problema caríiaco severo')
    ;

-- Povoar Equipa
INSERT INTO `Equipa`
	(`chefe`,`função`,`observações`)
    VALUES
    ('Vera Lama', 'Marketing', 'Necessita de mais informações para o planeamento da estratégia de marketing'),
    ('Daniel Tardio', 'Finanças', 'Orçamento inacabado'),
	('Evaldo Perfeito', 'Relações Públicas', NULL),
    ('Roberto Desleal', 'Limpeza', 'A precisar de equipamento novo'),
    ('André Carvalho', 'Montagem', NULL),
    ('Rita Costa', 'Logística', NULL),
    ('José Silva', 'Suporte Técnico', 'Tecnologicamente abaixo do esperado'),
    ('Tomás Peixoto', 'Alimentação e Hospedagem', NULL),
    ('João Queiroz','Montagem', NULL),
    ('Francisco Couto', 'Programação', NULL),
    ('Paulo Freitas', 'Assistência', NULL)
    ;

-- Povoar Cliente
INSERT INTO `Cliente`
	(`nome`,`dataNascimento`,`telemóvel`,`e-mail`,`cidade`,`rua`)
    VALUES
    ('Pedro Koi Tado', '1987-01-02', 911443322, 'Koitadinho@mail.com', 'Bragança', 'Rua da Estrada Ligada'),
    ('Bruno Miguel', '1982-05-09', 911775382, 'bruninhomigz@mail.com', 'Lisboa', 'Rua da  Igreja'),
    ('Antonio Ferramenta', '1990-05-21', 914313542, 'toniferramenta@mail.com', 'Porto', 'Rua dos Meninos'),
    ('Daniel Fontes', '1965-01-02', 923129565, 'danielpfontes@mail.com', 'Braga', 'Rua da Fonte '),
    ('Alberto Quintas', '1967-10-21', 931645768, 'albertoquintas@mail.com', 'Guimarães', 'Rua do Bom Remédio'),
    ('Mariana Correia', '1992-06-07', 914257289, 'marianinibc@mail.com', 'Esposende', 'Rua do Mar'),
    ('Gonçalo Ferreira', '1998-12-12', 912456189, 'goncasferreira@mail.com', 'Lisboa', 'Rua da Laranjeira '),
    ('Francsico Pacheco', '1975-06-14', 965444875, 'kikocouto@mail.com', 'Lisboa', 'Rua do Couto'),
    ('Nelson Almeida', '1963-10-21', 911999038, 'nelsonalmeidinha@mail.com', 'Guimarães', 'Rua da Olhão'),
    ('Adelia Campos', '1955-06-25', 965824631, 'adeliacampos@mail.com', 'Lisboa', 'Rua da estrada ligada'),
    ('Sofia Mata', '1969-08-12', 925632941, 'sofiacmata@mail.com', 'Lisboa', 'Rua da Vila'),
    ('Filipe Pereira', '1994-12-02', 93422567, 'pipoperera@mail.com', 'Lisboa', 'Rua da Vinha'),
    ('Tania Lemos', '1977-11-05', 962524425, 'tnial3mos@mail.com', 'Setúbal', 'Avenida do Tempo'),
    ('Telmo Graça', '2000-09-27', 911553247, 'graçatelm0@mail.com', 'Santarém', 'Rua Santa Maria'),
    ('Pedro Alves', '1968-08-21', 967159635, 'pedromcalves@mail.com', 'Sintra', 'Travessa dos Campos'),
    ('Henrique Casal', '1982-05-13', 92412569, 'henriqdcasal@mail.com', 'Lisboa', 'Rua da Pinha'),
    ('Vitor Lima', '1977-04-20', 921453729, 'vitzlima@mail.com', 'Setúbal', 'Rua do Rio Sado'),
    ('José Barbosa', '1972-01-25', 932201056, 'josefilhosbarbosa@mail.com', 'Lisboa', 'Rua da Boavista'),
    ('Maria Falecida', '1957-10-07', 910568102, 'mctfalecida@mail.com', 'Coimbra', 'Rua dos Barreiros')
    ;

INSERT INTO `Bilhete`
    (`preço`, `lugar`, `inicioEvento`, `fimEvento`, `aquisição`, `Funcionário_idFuncionário`, `Evento_idEvento`,`Cliente_idCliente`)
    VALUES
    (10, NULL, '2023-03-04', '2023-03-04', '2023-02-01', 1, 1, 1),
    (12, NULL, '202-03-04', '2023-03-04', '2023-02-24', 1, 1, 5),
    (50, NULL, '2023-07-20', '2023-03-04', '2023-03-07', 2, 3, 9),
    (22, NULL, '2023-03-04', '2023-03-04', '2023-02-12', 3, 1, 2),
    (14, NULL, '2024-05-04', '2024-05-07', '2023-12-07', 1, 5, 9),
    (5, 1, '2024-03-12', '2024-03-13', '2022-09-13', 3, 4, 4),
    (7, NULL, '2023-08-25', '2023-08-28', '2023-02-01', 2, 2, 3),
    (15, NULL, '2024-03-04', '2024-03-17', '2023-01-04', 1, 7, 2),
    (12, NULL, '2024-03-11', '2023-03-13', '2023-01-11', 3, 8, 13),
    (10, NULL, '2023-03-04', '2023-03-07', '2022-09-01', 2, 3, 6),
    (30, NULL, '2023-08-25', '2023-08-28', '2022-10-14', 1, 2, 7),
    (40, NULL, '2024-03-12', '2024-03-13', '2022-11-13', 3, 4, 8),
    (15, NULL, '2024-03-04', '2024-03-17', '2023-02-01', 5, 7, 10),
    (17, 23, '2023-03-12', '2023-03-13', '2023-02-01', 7, 4, 14),
    (20, NULL, '2023-03-04', '2023-03-04', '2023-02-01', 2, 1, 16),
    (12, NULL, '2024-06-04', '2024-06-04', '2023-12-11', 1, 6, 18),
    (10, NULL, '2024-05-04', '2024-05-07', '2023-07-21', 3, 5, 19),
    (15, NULL, '2024-03-05', '2023-03-06', '2023-01-21', 12, 9, 20),
    (17, 2, '2024-03-12', '2024-03-13','2023-07-13', 11, 4, 1),
    (15, NULL, '2023-08-25', '2023-08-28', '2023-05-01', 11, 2, 5),
    (10, NULL, '2023-03-05', '2023-03-06', '2022-02-09', 4, 9, 21),
    (15, NULL, '2023-08-25', '2023-08-28', '2023-04-11', 12, 2, 12),
    (9, NULL, '2023-07-20', '2023-03-04', '2023-02-03', 11, 3, 11),
    (6, 9, '2023-03-12', '2023-03-13', '2023-02-21', 10, 4, 15),
    (27, NULL, '2023-08-25', '2023-08-28', '2023-04-01', 10, 2, 17),
    (10, NULL, '2023-08-25', '2023-08-28', '2023-03-21', 11, 2, 13),
    (13, NULL, '2023-03-04', '2023-03-07', '2023-02-01', 12, 3, 4),
    (15, 14, '2024-03-12', '2024-03-13', '2023-03-13', 10, 4, 2),
    (8, 5, '2024-03-12', '2024-03-13', '2023-02-01', 11, 4, 4),
    (10, NULL, '2024-03-04', '2024-03-17', '2023-11-21', 10, 7, 15),
    (12, NULL, '2024-03-05', '2024-03-06', '2023-12-10', 12, 9, 20),
    (13, 4, '2024-03-12', '2024-03-13', '2022-11-15', 11, 4, 8),
    (10, NULL, '2024-03-05', '2024-03-06', '2023-12-10', 12, 9, 20),
    (23, NULL, '2024-03-05', '2024-03-06', '2023-12-10', 11, 9, 19),
    (15, NULL, '2022-03-04', '2022-03-06', '2021-12-10', 12, 3, 15),
    (7, 4, '2024-03-12', '2024-03-13', '2023-11-09', 10, 4, 16),
    (27, NULL, '2024-06-04', '2024-06-04', '2023-12-07', 12, 6, 20),
    (30, NULL, '2024-05-04', '2024-05-07', '2024-02-10', 12, 5, 7),
    (3, NULL, '2024-05-04', '2024-05-07', '2024-02-10', 12, 5, 5)
	;

    
-- -----------------------------------------------------------------------------------
-- Povoar Multivalorados
-- -----------------------------------------------------------------------------------

-- Povoar participantes -> Headliner
INSERT INTO `Participantes`
    (`Headliner_idHeadliner`, `participante`)
    VALUES
    (3, 'Matt Helders'),
    (3, 'Jamie Cook'),
    (3, 'Nick OMalley'),
    (4, 'Anderson Paak'),
    (5, 'Thomas Bangalter'), 
    (9, 'The Edge'),
    (9,'Adam Clayton'),
    (9,'Larry Mullen Jr.'),
    (13, 'Flea'),
    (13, 'Chad Smith'),
    (13,'John Frusciante'),
    (16, 'Carlos Alberto'),
    (16, 'Fernando Rouxinol'),
    (16, 'Rui Frito'),
    (16, 'David Costa')
    ;
    
-- Povoar registrosChuva -> Localização
INSERT INTO `registrosChuva`
    (`Localização_idLocalização`,`registrosChuva`, `registroData`)
    VALUES
    ('1','67','2022-08-15'),('1','89','2024-02-28'),('3','35','2023-11-10'),('2','34','2023-06-22'),('2','31','2023-09-03'),
    ('4','77','2024-07-01'),('5','88','2023-05-18'),('6','99','2023-12-05'),('7','100','2024-09-21'),
    ('8','33','2022-10-30'),('7','3','2022-05-12'),('8','5','2023-01-19'),('9','93','2024-10-08'),
    ('10','34','2022-09-14'),('10','32','2024-11-29'),('10','83','2023-02-14'),('9','23','2023-04-26'),('7','33','2023-08-07'),
    ('8','77','2024-06-17'),('11','33','2022-12-20'),('12','21','2024-05-03'),('13','43','2023-10-15'),('11','12','2023-07-28'),
    ('12','16','2022-11-02'),('12','72','2023-04-14'),('16','52','2024-01-27'),('16','86','2023-03-09'),
    ('15','32','2023-01-01'),('15','31','2024-03-17'),('14','5','2022-07-24'),('14','77','2023-09-03')
    ;

-- Povoar registrosTemperatura -> Localização
INSERT INTO `registrosTemperatura`
    (`Localização_idLocalização`,`registrosTemperatura`,`registroData`)
    VALUES
    ('1','23','2023-02-01'),('1','32','2023-04-15'),('3','31','2024-11-30'),
    ('2','30','2024-06-02'),('2','21','2024-09-15'),('4','12','2022-12-18'),
    ('5','19','2023-06-07'),('6','27','2023-11-20'),('7','33','2023-08-25'),
    ('8','2','2024-03-10'),('7','5','2023-04-18'),('8','8','2023-02-27'),('9','9','2023-01-14'),
    ('10','31','2023-12-31'),('10','6','2024-05-14'),('10','5','2023-11-07'),
    ('9','8','2023-09-03'),('7','4','2024-01-20'),('8','12','2022-10-11'),
    ('11','41','2023-03-25'),('12','35','2023-01-01'),('13','33','2024-06-05'),
    ('11','24','2023-08-10'),('12','21','2023-06-23'),('12','3','2024-09-06'),
    ('16','14','2024-02-14'),('16','17','2023-10-27'),('15','21','2023-05-11'),
    ('15','32','2022-08-24'),('14','21','2023-07-29'),('14','22','2023-04-01')
    ;

-- Povoar registrosVento -> Localização
INSERT INTO `registrosVento`
    (`Localização_idLocalização`,`registrosVento`,`registroData`)
    VALUES
    ('1','67','2024-09-05'),('1','89','2023-11-30'),('3','35','2023-03-20'),
    ('2','34','2022-06-15'),('2','31','2022-12-28'),('4','77','2023-09-09'),
    ('5','88','2024-04-03'),('6','99','2023-07-17'),('7','100','2023-04-30'),
    ('8','33','2022-11-13'),('7','3','2023-01-25'),('8','5','2022-10-08'),
    ('9','93','2022-12-01'),('10','34','2023-05-14'),('10','12','2024-08-07'),
    ('10','21','2023-02-18'),('9','63','2023-06-03'),('7','0','2023-11-15'),('8','3','2024-03-30'),
    ('11','33','2022-07-22'),('12','21','2024-02-01'),('13','43','2023-08-05')
    ;

INSERT INTO `patrocinadores`
	(`Evento_idEvento`, `patrocinador`)
    VALUES
    (1, 'Jose Carlos Miguel Santinho'),
    (1, 'ErreEfeEme'),
    (1, 'Pedro Mato Agal'),
    (7, 'Pedro Mato Agal'),
    (6, 'Pedro Mato Agal'),
    (4, 'Pedro Mato Agal'),
    (1, 'Horrata Limano'),
    (3, 'Sem ti Mento Sá Fa Ri'),
    (8, 'Pedro Mato Agal'),
    (9, 'MegaLits'),
    (9, 'Cristiana Pereira'),
    (2, 'Manel Queironça'),
    (8, 'Ricardinho das peladas e limitadas'),
    (4, 'Rival das'),
    (6, 'José dos Dogs'),
    (5,'LaTEXTIL'),
    (8,'Forconta'),
    (7,'Tatel'),
    (5,'Kingles'),
    (2,'HitMaker'),
    (3,'Manuel Carvalho')
    ;
    
-- -----------------------------------------------------------------------------------
-- Povoar Relações (N:N)
-- -----------------------------------------------------------------------------------
-- Povoar Equipa_contém_Funcionário
INSERT INTO `equipa_contém_funcionário`
	(`Equipa_idEquipa`, `Funcionário_idFuncionário`)
    VALUES
    (1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(3,10),(3,11),(3,12),(4,13)
    ;

-- Povoar Evento_avaliado_Cliente
INSERT INTO `evento_avaliado_cliente`
	(`Evento_idEvento`, `Cliente_idCliente`,`classificaçãoQuantitativa`,`pontosPositivos`,`pontosNegativos`,`date`)
    VALUES
    (2,1,4,'Boa música e bom espaço','Maus acessos','2023-08-27'),
    (3,4,5,'Bom cartaz e boa comida','Nada a dizer','2022-03-05'),
    (2,12,3,'Boa comida','Mal organizado na saída do recinto','2023-09-01'),
    (3,15,5,'Bom cartaz, ótima comida e boa acústica','Nada a dizer','2022-03-07'),
    (3,9,1,'Nada a dizer','Má acústica e maus acessos','2022-03-09'),
    (6,1,3,'Bem organizado e com boa música','Casas de banho longe do palco principal','2023-08-27'),
    (2,6,2,'Boa música','Mal organizado à saída e casas de banho longe do palco','2023-08-28')
    ;

-- Povoar Evento_contém_Equipa
INSERT INTO `evento_contém_equipa`
	(`Evento_idEvento`,`Equipa_idEquipa`)
    VALUES	
    (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),
    (2,10),(2,11),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),
    (4,8),(4,9),(4,10),(4,11),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(6,1),(6,2),(6,3),(6,4),(6,5),
    (6,6),(6,7),(6,8),(6,9),(6,10),(6,11),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(7,11),(8,1),(8,2),(8,3),
    (8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(8,11),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(9,10),(9,11)
    ;
    
-- Povoar Evento_contém_Headliner
INSERT INTO `evento_contém_headliner`
	(`Evento_idEvento`,`Headliner_idHeadliner`)
    VALUES	
	(2,1),(3,2),(4,1),(5,14),(8,10),(2,3),(1,7),(2,9),(3,11),(1,6),(2,12),(2,2),(3,4),(3,5),(3,3)
    ;

-- Povoar Evento_divulgado_Funcionário
INSERT INTO `evento_divulgado_funcionário`
	(`Evento_idEvento`,`Funcionário_idFuncionário`)
    VALUES	
	(2,1),(3,2),(4,10),(5,8),(8,10),(9,10),(1,7),(2,9),(3,11),(1,6),(2,10)
    ;