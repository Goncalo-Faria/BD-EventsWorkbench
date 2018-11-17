USE EventsWorkbench;

delimiter o.O
CREATE PROCEDURE addParticipante(IN nif int, IN nome varchar(45))
begin
	
    declare `_rollback` bool DEFAULT 0;
    declare continue HANDLER for sqlexception set `_rollback` = 1;
    
    START TRANSACTION;
		INSERT INTO Participante(nif, nome) 
		VALUES (nif, nome);
		IF `_rollback` THEN
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
	end o.O
delimiter ;

delimiter o.O
CREATE PROCEDURE addLocal(IN designacao varchar(45))
begin
	
    declare `_rollback` bool DEFAULT 0;
    declare continue HANDLER for sqlexception set `_rollback` = 1;
    
    START TRANSACTION;
		insert into Local(designacao) 
		values (designacao);
		if `_rollback` then
			ROLLBACK;
		else
			COMMIT;
		end if;
	end o.O
delimiter ;

delimiter o.O
CREATE PROCEDURE addOrganizador(IN designacao varchar(45))
begin
	
    declare `_rollback` bool DEFAULT 0;
    declare continue HANDLER for sqlexception set `_rollback` = 1;
    
    START TRANSACTION;
		insert into Local(designacao) 
		values (designacao);
		if `_rollback` then
			ROLLBACK;
		else
			COMMIT;
		end if;
	end o.O
delimiter ;

delimiter o.O
CREATE PROCEDURE addEvento(IN designacao varchar(45))
begin
	
    declare `_rollback` bool DEFAULT 0;
    declare continue HANDLER for sqlexception set `_rollback` = 1;
    
    START TRANSACTION;
		insert into Local(designacao) 
		values (designacao);
		if `_rollback` then
			ROLLBACK;
		else
			COMMIT;
		end if;
	end o.O
delimiter ;

delimiter o.O
CREATE PROCEDURE addPlataforma(IN designacao varchar(45))
begin
	
    declare `_rollback` bool DEFAULT 0;
    declare continue HANDLER for sqlexception set `_rollback` = 1;
    
    START TRANSACTION;
		insert into Local(designacao) 
		values (designacao);
		if `_rollback` then
			ROLLBACK;
		else
			COMMIT;
		end if;
	end o.O
delimiter ;