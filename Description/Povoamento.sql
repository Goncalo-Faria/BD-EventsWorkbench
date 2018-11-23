USE EventsWorkbench;

INSERT INTO Entidade (Id,Endereco, Nome,Email,Telemovel)
VALUES  (1,'ruaa111','a111','a111@mail.com','351999a11'),
				(2,'ruaa112','a112','a112@mail.com','351999a12'),
				(3,'ruaa113','a113','a113@mail.com','351999a13'),
				(4,'ruaa114','a114','a114@mail.com','351999a14'),
				(5,'ruaa115','a115','a115@mail.com','351999a15'),
				(6,'ruaa116','a116','a116@mail.com','351999a16'),
				(7,'ruaa117','a117','a117@mail.com','351999a17'),
				(8,'ruaa118','a118','a118@mail.com','351999a18'),
				(9,'ruaa119','a119','a119@mail.com','351999a19'),
                (10,'ruaa120','a120','a120@mail.com','351999a20');


INSERT INTO Local (Entidade_id,Descricao,Tipo,Lotacao)
VALUES 	(1,'é o Carpe',1,40),
				(2,'é o Sardinha',1,50),
                (3,'é o BarDaAssociacao',1,60);
                
INSERT INTO Organizador (Entidade_id, Descricao)
VALUES 	(4,'Mae do Joel'),
				(5,'Cesium'),
                (6,'Comissao MIEI');
                
INSERT INTO Participante (Entidade_id,nif,DataDeNascimento,Genero)
VALUES (7,15541190,'1998-3-3',2),
			   (8,33442,'1998-3-3',2),
               (9,22,'1998-3-3',2),
               (10,1888,'1998-3-3',1);
               
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