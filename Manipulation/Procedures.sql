delimiter $$
CREATE PROCEDURE RE1(IN n_org int)
    begin
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
            and OE.Organizador_Entidade_id = n_org
            and PEPD.Evento_id = E.id
            and P.Entidade_id = PEPD.Participante_Entidade_id
	        and Ent.id = P.Entidade_id;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE RE2(IN n_org int)
    begin
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
            and OE.Organizador_Entidade_id = n_org
            and D.Evento_id = E.id
            and D.Plataforma_id = P.id;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE RE3(IN n_org int)
    begin
        Select distinct
            E.*, L.Tipo
        From
            Evento as E,
            Organizador as O,
            Organizador_has_Evento as OE,
	        Local as L
        where
            E.id = OE.Evento_id
            and OE.Organizador_Entidade_id = n_org
	        and L.Entidade_id = L.Entidade_id;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE RE4(IN n_evento int, IN n_org int)
    begin
        Select distinct
            E.*
        From
            Evento as E,
            Organizador as O,
            Organizador_has_Evento as OE
        where
            E.id = OE.Evento_id
            and OE.Organizador_Entidade_id = n_org
	        and E.id = n_evento;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE RE5(IN n_evento int)
    begin
        Select distinct
            E.id,P.genero,P.nif,P.datadenascimento,Ent.nome, Ent.endereco, Ent.email, Ent.telemovel
        From
            Evento as E,
            PermiteEntrada_Evento_Participante_Divulgacao as PEPD,
            Participante as P,
	        Entidade as Ent
        where
	        E.id = n_evento
            and PEPD.Evento_id = E.id
            and P.Entidade_id = PEPD.Participante_Entidade_id
	        and Ent.id = P.Entidade_id;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE RE6(IN n_evento int)
    begin
        Select distinct
            E.id,P.genero,P.nif,P.datadenascimento,Ent.nome, Ent.endereco, Ent.email, Ent.telemovel
        From
            Evento as E,
            PermiteEntrada_Evento_Participante_Divulgacao as PEPD,
            Participante as P,
	        Entidade as Ent
        where
	        E.id = n_evento
            and PEPD.Evento_id = E.id
            and P.Entidade_id = PEPD.Participante_Entidade_id
	        and Ent.id = P.Entidade_id;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE RE71(IN d_start DATETIME,IN d_end DATETIME)
    begin
        Select *
        From 
	        Evento as E
        where 
	        E.data between d_start and d_end
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE RE72(IN n_local INT)
    begin
        Select *
        From 
	        Evento as E
        where 
	        E.Local_Entidade_Id = n_local;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE RE81()
    begin
        Select
	        D.tipo, count(D.tipo)
        From 
	        Divulgacao as D,
	        PermiteEntrada_Evento_Participante_Divulgacao as PEPD
        where
	        PEPD.Divulgacao_id = D.id 
        group by D.tipo
        order by count(D.tipo) DESC;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE RE82()
    begin
        Select 
	        D.tipo, sum(D.Custo)/count(D.Custo) as EntParticipante
        From 
	        Divulgacao as D
        group by D.tipo
        order by sum(D.Custo)/count(D.Custo);   
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE RE9(IN n_divulgacao INT)
    begin
        Select 
	        D.*
        From 
	        Divulgacao as D
        where
	        D.id = n_divulgacao ;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE RE10(IN n_divulgacao INT)
    begin
        Select 
	        D.*, count(PEPD.Participante_Entidade_Id)
        From 
	        Divulgacao as D,
            PermiteEntrada_Evento_Participante_Divulgacao as PEPD
        where
	        PEPD.Divulgacao_id = D.id
	        and D.id = n_divulgacao
            group by Divulgacao_id;
	end $$
delimiter ;