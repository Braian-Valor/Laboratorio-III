/*CREACION DE LA BASE DE DATOS*/
CREATE DATABASE MUCHOSaMUCHOS
GO
USE MUCHOSaMUCHOS

/*CREACION DE LA TABLA PROFESORES LA CUAL VA A TENER UNA CLAVE PRIMARIA PARA EL DNI PARA QUE
NO SE REPITA EN LOS REGISTROS DE LOS PROFESORES*/
GO
CREATE TABLE PROFESORES(
	APELLIDO	VARCHAR(15)	NOT NULL,
	NOMBRES		VARCHAR(45)	NOT NULL,
	FECHA_NACIMIENTO	DATE	NOT NULL,
	DNI		BIGINT	NOT NULL	
)
ALTER TABLE PROFESORES
ADD CONSTRAINT PK_PROFESORES PRIMARY KEY(DNI)

/*AGREGAMOS UNA RESTRICCION CHECK PARA QUE LA FECHA DE NACIMIENTO SEA MENOR A LA ACTUAL*/
ALTER TABLE PROFESORES
ADD CONSTRAINT CHK_PROFESORES CHECK(FECHA_NACIMIENTO<(GETDATE()))

/*CREACION DE LA TABLA PROPUESTA DE CURSOS LA CUAL VA A TENER 2 CLAVES PRIMARIA:
-UNA PARA EL DNI PARA QUE EL PROFESOR QUE DA EL CURSO NO SE REPITA
-Y LA OTRA PARA EL ID DE CURSOS NO SE REPITA*/
GO
CREATE TABLE PROPCURSOS(
	DNI	BIGINT	NOT NULL,
	IDCURSO	BIGINT	NOT NULL,
	CARGA_HORARIA	FLOAT	NOT NULL
)
ALTER TABLE PROPCURSOS
ADD CONSTRAINT PK_PROPCURSOS PRIMARY KEY(DNI, IDCURSO)

/*AGREGAMOS 2 CLAVES FORANEAS:
-UNA PARA QUE SE RELACIONE CON LA TABLA DE PROFESORES MEDIANTE EL DNI
-Y LA OTRA PARA QUE SE RELACIONE CON LA TABLA DE CURSOS 
NO VAN A PODER HABER REGISTROS IGUALES*/
ALTER TABLE PROPCURSOS
ADD CONSTRAINT FK_PROPCURSOS FOREIGN KEY(DNI) REFERENCES PROFESORES(DNI)

ALTER TABLE PROPCURSOS
ADD CONSTRAINT FK_PROPCURSOS2 FOREIGN KEY(IDCURSO) REFERENCES CURSOS(IDCURSO)

/*CREACION DE LA TABLA DE CURSOS*/
GO
CREATE TABLE CURSOS(
	IDCURSO	BIGINT NOT NULL PRIMARY KEY,
	NOMBRE	VARCHAR(45) NOT NULL
)