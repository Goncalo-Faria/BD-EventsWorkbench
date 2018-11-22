USE EventsWorkbench;# RE1 arg:numorg
Select distinct
    Ent.nome, Ent.endereco, Ent.email, Ent.telemovel
From
    Evento as E,
    Organizador as O,
    Organizador_has_Evento as OE,
    PermiteEntrada_Evento_Participante_Divulgacao as PEPD,
    Participante as P,
	Entidade as Ent
where
    E.id = OE.Evento_id
    and OE.Organizador_Entidade_id = numorg
    and PEPD.Evento_id = E.id
    and P.Entidade_id = PEPD.Participante_Entidade_id
	and Ent.id = P.Entidade_id;
# RE2 arg:numorg
Select distinct
    P.*
From
    Evento as E,
    Organizador as O,
    Organizador_has_Evento as OE,
    Divulgacao as D,
    Plataforma as P
where
    E.id = OE.Evento_id
    and OE.Organizador_Entidade_id = numorg
    and D.Evento_id = E.id
    and D.Plataforma_id = P.id;

# RE3 arg:numorg
Select distinct
    E.*, L.Tipo
From
    Evento as E,
    Organizador as O,
    Organizador_has_Evento as OE,
	Local as L
where
    E.id = OE.Evento_id
    and OE.Organizador_Entidade_id = numorg
	and L.Entidade_id = L.Local_Entidade_id;

# RE4 arg:numorg, numevento
Select distinct
    E.*
From
    Evento as E,
    Organizador as O,
    Organizador_has_Evento as OE
where
    E.id = OE.Evento_id
    and OE.Organizador_Entidade_id = numorg
	and E.id = numevento;

# RE5 numevento
Select distinct
    E.id,P.genero,P.nif,P.datadenascimento,Ent.nome, Ent.endereco, Ent.email, Ent.telemovel
From
    Evento as E,
    PermiteEntrada_Evento_Participante_Divulgacao as PEPD,
    Participante as P,
	Entidade as Ent
where
	E.id = numevento
    and PEPD.Evento_id = E.id
    and P.Entidade_id = PEPD.Participante_Entidade_id
	and Ent.id = P.Entidade_id;

# RE6 numevento
Select distinct
    E.id,P.genero,P.nif,P.datadenascimento,Ent.nome, Ent.endereco, Ent.email, Ent.telemovel
From
    Evento as E,
    PermiteEntrada_Evento_Participante_Divulgacao as PEPD,
    Participante as P,
	Entidade as Ent
where
	E.id = numevento
    and PEPD.Evento_id = E.id
    and P.Entidade_id = PEPD.Participante_Entidade_id
	and Ent.id = P.Entidade_id;

#RE7