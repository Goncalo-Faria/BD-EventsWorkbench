USE EventsWorkbench;

INSERT INTO Entidade (Id,Endereco, Nome,Email,Telemovel)
VALUES  (1,'Braga','Rodrigo Gonçalves','Rodrigo_Gonçalves@mail.pt','939898677'),
		(2,'Portimão','Gonçalo Pinho','Gonçalo_Pinho@mail.pt','938253925'),
		(3,'Funchal','Martim Anjos','Martim_Anjos@mail.pt','938564942'),
		(4,'Porto','Francisco Simões','Francisco_Simões@mail.pt','937841037'),
		(5,'Funchal','Duarte Leal','Duarte_Leal@mail.pt','931678810'),
		(6,'Faro','Tomás Amorim','Tomás_Amorim@mail.pt','932249721'),
		(7,'Portimão','Gabriel Freitas','Gabriel_Freitas@mail.pt','936066676'),
		(8,'Amadora','Gabriel Batista','Gabriel_Batista@mail.pt','936731590'),
		(9,'Guimarães','Duarte Rodrigues','Duarte_Rodrigues@mail.pt','938266154'),
		(10,'Odivelas','Afonso Fernandes','Afonso_Fernandes@mail.pt','938119672'),
		(11,'Setúbal','Tiago Monteiro','Tiago_Monteiro@mail.pt','931460285'),
		(12,'Agualva-Cacém','Alice Nogueira','Alice_Nogueira@mail.pt','934254312'),
		(13,'Amadora','Guilherme Moura','Guilherme_Moura@mail.pt','930019252'),
		(14,'Faro','Matias Machado','Matias_Machado@mail.pt','936325104'),
		(15,'Porto','Nuno Domingues','Nuno_Domingues@mail.pt','938706919'),
		(16,'Braga','Matias Costa','Matias_Costa@mail.pt','939480483'),
		(17,'Almada','Gustavo Domingues','Gustavo_Domingues@mail.pt','936217069'),
		(18,'Funchal','Diogo Soares','Diogo_Soares@mail.pt','938893867'),
		(19,'Rio Tinto','João Pinho','João_Pinho@mail.pt','937894606'),
		(20,'Amadora','António Almeida','António_Almeida@mail.pt','931686372'),
		(21,'Agualva-Cacém','Pedro Abreu','Pedro_Abreu@mail.pt','930417425'),
		(22,'Funchal','João Fonseca','João_Fonseca@mail.pt','934495742'),
		(23,'Faro','Vasco Monteiro','Vasco_Monteiro@mail.pt','933949413'),
		(24,'Rio Tinto','Pedro Ramos','Pedro_Ramos@mail.pt','937709443'),
		(25,'Porto','Rodrigo Antunes','Rodrigo_Antunes@mail.pt','931360166'),
		(26,'Viseu','Martim Carvalho','Martim_Carvalho@mail.pt','939297741'),
		(27,'Viseu','Vicente Raposo','Vicente_Raposo@mail.pt','936236486'),
		(28,'Funchal','Manuel Neves','Manuel_Neves@mail.pt','939298188'),
		(29,'Lisboa','Lara Barbosa','Lara_Barbosa@mail.pt','931480990'),
		(30,'Barreiro','Manuel Figueiredo','Manuel_Figueiredo@mail.pt','939706401'),
		(31,'Faro','Rafael Matos','Rafael_Matos@mail.pt','933073763'),
		(32,'Porto','Bruno Matos','Bruno_Matos@mail.pt','931617835'),
		(33,'Vila Nova de Gaia','Camila Pinheiro','Camila_Pinheiro@mail.pt','930756374'),
		(34,'Faro','Dinis Matias','Dinis_Matias@mail.pt','936271712'),
		(35,'Vila Nova de Gaia','Vicente Lima','Vicente_Lima@mail.pt','937310040')
        (36,'Leiria','Jumpstart Bistro','jumpstart_bistro@mail.pt','933381367'),
        (37,'Évora','Wakey Wakey Coffee Shop','wakey_wakey_coffee_shop@mail.pt','935929449'),
        (38,'Amadora','Thinking Cup Joint','thinking_cup_joint@mail.pt','939643171'),
        (39,'Rio Tinto','Bean Bag Cafeteria','bean_bag_cafeteria@mail.pt','937240500'),
        (40,'Portimão','Big Mugs Coffee','big_mugs_coffee@mail.pt','930112602'),
        (41,'Barreiro','Tranquil Chocolate Cafeteria','tranquil_chocolate_cafeteria@mail.pt','937048652'),
        (42,'Faro','Unique Eden Cafe','unique_eden_cafe@mail.pt','939899812'),
        (43,'Lisboa','Havana Beach Diner','havana_beach_diner@mail.pt','932606694'),
        (44,'Portimão','Gentle Breeze Cafe','gentle_breeze_cafe@mail.pt','936736945'),
        (45,'Portimão','Peaceful Harvest Coffee Shop','peaceful_harvest_coffee_shop@mail.pt','937647104'),
        (46,'Rio Tinto','Symphony Plaza','symphony_plaza@mail.pt','937777053'),
        (47,'Odivelas','Marvel Plaza','marvel_plaza@mail.pt','931936164'),
        (48,'Queluz','Market Plaza','market_plaza@mail.pt','938865840'),
        (49,'Rio Tinto','Grand Palace Plaza','grand_palace_plaza@mail.pt','939517860'),
        (50,'Rio Tinto','Conquest Square','conquest_square@mail.pt','931696920'),
        (51,'Portimão','Sensation Plaza','sensation_plaza@mail.pt','939038301'),
        (52,'Funchal','Freedom Plaza','freedom_plaza@mail.pt','935428399'),
        (53,'Odivelas','Vineyard Square','vineyard_square@mail.pt','937058934'),
        (54,'Funchal','Augury Plaza','augury_plaza@mail.pt','934098233'),
        (55,'Leiria','Commemoration Square','commemoration_square@mail.pt','930315040'),
        (56,'Amadora','Neptune Shore','neptune_shore@mail.pt','932075300'),
        (57,'Funchal','Enchanted Bank','enchanted_bank@mail.pt','935354837'),
        (58,'Rio Tinto','Red Sands','red_sands@mail.pt','938980807'),
        (59,'Funchal','The Hummingbird','the_hummingbird@mail.pt','933415322'),
        (60,'Leiria','The Distant Strand','the_distant_strand@mail.pt','931440805'),
        (61,'Lisboa','Exisle Bank','exisle_bank@mail.pt','935961919'),
        (62,'Leiria','Middlesleche Strand','middlesleche_strand@mail.pt','933516585'),
        (63,'Barreiro','Bainmouth Sands','bainmouth_sands@mail.pt','938250139'),
        (64,'Almada','Munrial Edge','munrial_edge@mail.pt','930278633'),
        (65,'Viseu','Coatidon Strand','coatidon_strand@mail.pt','935439954');


INSERT INTO Local (Entidade_id,Descricao,Tipo,Lotacao)
VALUES 	(36,'Jumpstart Bistro',1,55),
        (37,'Wakey Wakey Coffee Shop',1,91),
        (38,'Thinking Cup Joint',1,57),
        (39,'Bean Bag Cafeteria',1,78),
        (40,'Big Mugs Coffee',1,97),
        (41,'Tranquil Chocolate Cafeteria',1,66),
        (42,'Unique Eden Cafe',1,88),
        (43,'Havana Beach Diner',1,54),
        (44,'Gentle Breeze Cafe',1,58),
        (45,'Peaceful Harvest Coffee Shop',1,91),
        (46,'Symphony Plaza',1,72),
        (47,'Marvel Plaza',1,82),
        (48,'Market Plaza',1,98),
        (49,'Grand Palace Plaza',1,100),
        (50,'Conquest Square',1,73),
        (51,'Sensation Plaza',1,75),
        (52,'Freedom Plaza',1,63),
        (53,'Vineyard Square',1,54),
        (54,'Augury Plaza',1,79),
        (55,'Commemoration Square',1,68),
        (56,'Neptune Shore',1,64),
        (57,'Enchanted Bank',1,82),
        (58,'Red Sands',1,68),
        (59,'The Hummingbird',1,83),
        (60,'The Distant Strand',1,90),
        (61,'Exisle Bank',1,89),
        (62,'Middlesleche Strand',1,55),
        (63,'Bainmouth Sands',1,81),
        (64,'Munrial Edge',1,95),
        (65,'Coatidon Strand',1,73);
                
INSERT INTO Organizador (Entidade_id, Descricao)
VALUES 	(20,'António Almeida')
        (21,'Pedro Abreu')
        (22,'João Fonseca')
        (23,'Vasco Monteiro')
        (24,'Pedro Ramos')
        (25,'Rodrigo Antunes')
        (26,'Martim Carvalho')
        (27,'Vicente Raposo')
        (28,'Manuel Neves')
        (29,'Lara Barbosa')
        (30,'Manuel Figueiredo')
        (31,'Rafael Matos')
        (32,'Bruno Matos')
        (33,'Camila Pinheiro')
        (34,'Dinis Matias')
        (35,'Vicente Lima');
                
INSERT INTO Participante (Entidade_id,nif,DataDeNascimento,Genero)
VALUES (1,253572677,'1991-05-01',1),
        (2,233703579,'1995-11-17',1),
        (3,207767246,'1985-11-16',1),
        (4,224432618,'1998-04-20',1),
        (5,233736164,'1980-08-07',1),
        (6,261208828,'1997-03-19',1),
        (7,291049787,'1996-12-17',1),
        (8,264410652,'1988-06-09',1),
        (9,205293639,'1985-01-06',1),
        (10,230597752,'1984-05-14',1),
        (11,297766014,'1985-08-05',1),
        (12,273758048,'1980-11-12',2),
        (13,252152474,'1989-09-12',1),
        (14,281791621,'1985-04-09',1),
        (15,267106516,'1987-10-17',1),
        (16,209461642,'1983-05-05',1),
        (17,280648047,'1992-12-07',1),
        (18,298994994,'1989-02-19',1),
        (19,223752496,'1984-01-18',1),
        (20,208354015,'1981-12-05',1);
               
INSERT INTO Plataforma (id,nome)
VALUES 	(1,'Facebook'),
				(2,'Intagram'),
                (3,'Discord');

INSERT INTO Evento (Id,Nome,Descricao,Tipo,data,DataInicioRegistoParticipantes,DataFimRegistoParticipantes,Duracao,Preco,NumeroMaximoDeParticipantes,Local_Entidade_Id)
VALUES 	(1,'Jantar de Miei','comes e bebes',1,'1998-3-3','1998-3-3','1998-3-3',CURRENT_TIME(),1.1,10,1),
				(3,'Arraial Cesium','comes e bebes',1,'1998-3-3','1998-3-3','1998-3-3',CURRENT_TIME(),1.2,20,2),
                (2,'Casamento do Joel','comes e bebes',1,'1998-3-3','1998-3-3','1998-3-3',CURRENT_TIME(),1.3,30,3);

INSERT INTO Organizador_has_evento (Evento_id,Organizador_Entidade_id)
VALUES 	(1,4),
				(2,5),
                (1,5),
                (3,6);
                
INSERT INTO Divulgacao(Id,Conteudo,Tipo,Custo,DataInicio,DataFim,Evento_id,Plataforma_id)
VALUES (1,'O gonçalo Aprova',1,2414.422,'1998-3-3','1998-3-3',1,1),
			   (2,'O gonçalo vai',2,4141.3232,'1998-3-3','1998-3-3',2,2),
               (3,'O gonçalo talvez apareça',3,222.888,'1998-3-3','1998-3-3',3,3);

####

INSERT INTO PermiteEntrada_Evento_Participante_Divulgacao (Evento_Id,Participante_Entidade_Id, Divulgacao_Id, Classificacao,Lugar)
VALUES	(1,7,1,10,'A422'),
				(1,10,1,20,'A421'),
				(2,8,2,10,'A424'),
				(3,9,3,15,'A429'),
                (3,10,3,12,'A432');
