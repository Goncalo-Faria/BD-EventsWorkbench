USE EventsWorkbench;

INSERT INTO Local (designacao)
VALUES 	('Carpe'),
				('Sardinha'),
                ('BarDaAssociacao');

INSERT INTO Evento (Local_id,designacao)
VALUES 	(1,'Jantar de Miei'),
				(3,'Arraial Cesium'),
                (2,'Casamento do Joel');

INSERT INTO Organizacao (designacao)
VALUES 	('Mae do Joel'),
				('Cesium'),
                ('Comissao MIEI');

INSERT INTO Organizacao_tem_evento (Evento_id,Organizacao_id)
VALUES 	(1,3),
				(2,2),
                (1,2),
                (3,1);

INSERT INTO Plataforma (designacao)
VALUES 	('Facebook'),
				('Intagram'),
                ('Discord');
                
INSERT INTO Publicidade(Evento_id,Plataforma_id)
VALUES (1,1),
			   (2,1),
               (3,1);

               
INSERT INTO Participante(nif,nome)
VALUES (15541190,'Gonçalo Faria'),
			   (33442,'João Vilaça'),
               (22,'José Fernandes'),
               (1888,'Catarina Machado');
               
INSERT INTO Bilhete (Evento_id,Participante_nif)
VALUES (1,15541190),(2,15541190),(3,15541190);

#INSERT INTO Bilhete (Tipo_id ,Participante_nif, Publicidade_id)
#VALUES (2,1,22);
# Esta tem de ser cuidadosa porque temos que assegurar que se referem ao mesmo evento.