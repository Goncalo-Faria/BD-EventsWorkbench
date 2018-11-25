USE EventsWorkbench;
DELIMITER $$ 
CREATE PROCEDURE addClassificacao(
    IN id_particante INT,
    IN id_evento INT,
    IN apreciation DECIMAL(4, 2)
) 
    BEGIN
        UPDATE
            PermiteEntrada_Evento_Participante_Divulgacao as PEPD
        SET
            PEPD.Classificacao = apreciation
        WHERE
            PEPD.Evento_id = id_evento
            and PEPD.Entidade_Participante_id = id_particante 
    END $$ 
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE ValidarDivulgacao(IN id_divulgacao INT)
    BEGIN
        UPDATE
            Divulgacao as D
        SET
            D.Validade = 2
        WHERE
            D.id = id_divulgacao 
    END $$ 
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE AlterarEstadoParticipacao(
        IN id_evento INT,
        IN id_participante INT,
        IN estado_novo ENUM('Válido', 'Cancelado', 'Reservado')
    ) 
    BEGIN
        UPDATE
            PermiteEntrada_Evento_Participante_Divulgacao as PEPD
        SET
            PEPD.Estado = estado_novo
        WHERE
            EPD.Participante_Entidade_id = id_particante
            and PEPD.Evento_id = id_evento 
            
    END $$ 
DELIMITER ; 

DELIMITER $$ 
CREATE PROCEDURE CriarPlataforma(
        IN id INT,
        IN nome VARCHAR(64)
    ) 
    BEGIN
        INSERT INTO
            Plataforma(id, nome)
        VALUES(id, nome) 
    END $$ 
        
DELIMITER ; 

DELIMITER $$ 
CREATE PROCEDURE CriarDivulgacao(
        IN d_id INT,
        IN d_conteudo TEXT(1024),
        IN d_custo DECIMAL(12, 2),
        IN d_tipo ENUM(
            "Audiovisual",
            "Áudio",
            "Publicação",
            "Cartaz",
            "Email",
            "Brochuras",
            "Aresentações",
            "Promoções",
            "Panfletos",
            "Outros"
        ),
        IN d_DataInicio DATETIME,
        IN d_DateFim DATETIME,
        IN d_plataforma_id INT,
        IN d_Evento_id INT
    ) 
    BEGIN
        INSERT INTO
            Divulgacao(
                id,
                conteudo,
                tipo,
                custo,
                DataInicio,
                DataFim,
                plataforma_id,
                Evento_id
                     )
        VALUES(
            d_id,
            d_conteudo,
            d_tipo,
            d_custo,
            d_DataInicio,
            d_DataFim,
            d_plataforma_id,
            d_Evento_id
    ) 
    END $$ 
DELIMITER;