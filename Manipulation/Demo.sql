USE EventsWorkbench;

#listar todos os eventos com quem os comprou, organizou assim como onde vão decorrer
SELECT L.designacao as Local, E.designacao as Evento, O.designacao as Organizacao
	FROM Local as L, Evento as E, Organizacao as O, Organizacao_tem_Evento as OE
	WHERE E.id = OE.Evento_id and O.id = OE.Organizacao_id and L.id = E.Local_id;

# Listar todos os bilhetes com o nome de quem o comprou e o tipo que é.    
SELECT P.nome as Participante,E.designacao as Evento
	FROM Participante as P, Evento as E, Bilhete as B
    WHERE B.Participante_nif = P.nif and E.id = B.Evento_id;