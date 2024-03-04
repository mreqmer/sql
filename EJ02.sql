GO
USE MASTER
DROP DATABASE IF EXISTS Centro
CREATE DATABASE Centro
GO

GO
USE Centro

CREATE TABLE Alumno(
	DNI char (9) not null,
	Nombre varchar(15),
	CONSTRAINT PKAlumno PRIMARY KEY (DNI),
)

CREATE TABLE Profesor(
	DNI char (9) not null,
	Nombre varchar(15),
	CONSTRAINT PKProfesor PRIMARY KEY (DNI)
)

CREATE TABLE Asignatura(
	COD varchar(4) not null,
	Nombre varchar(15),
	Horas int,
	DNI_Prof char(9),
	CONSTRAINT PKAsignatura PRIMARY KEY (COD),
	CONSTRAINT FKAsignatura_Profesor FOREIGN KEY (DNI_Prof) REFERENCES Profesor(DNI)
	ON UPDATE CASCADE
	ON DELETE SET NULL
)

CREATE TABLE Alumno_Asignatura(
	DNI_Alumno char(9) not null,
	COD_Asig varchar(4) not null,
	Nota tinyint,
	CONSTRAINT PKAlumno_Asignatura PRIMARY KEY (DNI_Alumno, COD_Asig),
	CONSTRAINT FKAlumno_Asignatura_Alumno FOREIGN KEY (DNI_Alumno) REFERENCES Alumno(DNI)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT FKAlumno_Asignatura_Asignatura FOREIGN KEY (COD_Asig) REFERENCES Asignatura(COD)
	ON UPDATE CASCADE
	ON DELETE CASCADE
	
)
GO

