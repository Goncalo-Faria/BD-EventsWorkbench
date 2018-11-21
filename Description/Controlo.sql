CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'funcionariopassword';

GRANT SELECT,UPDATE,DELETE,INSERT,CALL ON Workbench.* TO 'funcionario'@'localhost;

CREATE USER 'organizador'@'localhost' IDENTIFIED BY 'organizadorpassword';

# Especificar em detalhe quais os procedures
GRANT CALL ON Workbench.* TO 'organizador'@'localhost;

GRANT SELECT ON (Workbench.Locais,Workbench.Plataforma) TO 'organizador86264'@'localhost;

###

CREATE USER 'participante'@'localhost' IDENTIFIED BY 'participantepassword';

GRANT CALL ON Workbench.ClassificaBilhete TO 'participante'@'localhost;
