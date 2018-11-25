USE EventsWorkbench;

DELIMITER $$
CREATE PROCEDURE addClassificação(IN id_particante INT, IN id_evento INT, IN apreciation DECIMAL(4,2))
        UPDATE PermiteEntrada_Evento_Participante_Divulgacao as PEPD
        SET PEPD.Classificacao = apreciation
        WHERE 
            PEPD.Evento_id = id_evento 
            and PEPD.Entidade_Participante_id = id_particante    
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ValidarDivulgacao(IN id_divulgacao INT)
        UPDATE Divulgacao as D
        SET D.Validade = 2
        WHERE D.id = id_divulgacao 
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE AlterarEstadoParticipacao(
                    IN id_evento INT,
                    IN id_participante INT,
                    IN estado_novo ENUM('Válido', 'Cancelado', 'Reservado'))

        UPDATE PermiteEntrada_Evento_Participante_Divulgacao as PEPD
        SET PEPD.Estado = estado_novo
        WHERE 
            PEPD.Participante_Entidade_id = id_particante 
            and PEPD.Evento_id = id_evento
END $$
DELIMITER ;