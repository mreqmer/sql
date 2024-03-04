USE Ejercicio15

CREATE TABLE Asignatura(
codAsig smallint CONSTRAINT PKAsignatura PRIMARY KEY


)

CREATE TABLE Estudio(
codEst smallint CONSTRAINT PKEstudio PRIMARY KEY,

)

CREATE TABLE Grupo(
codGrupo smallint CONSTRAINT PKGrupo  PRIMARY KEY,

)

CREATE TABLE TutorLegal (
dni char(9),
CONSTRAINT PKTutorLegal PRIMARY KEY (dni)
)

CREATE TABLE AsignaturaEstudio (
codAsig_Asignatura smallint
CONSTRAINT FKAsignatura FOREIGN KEY REFERENCES Asignatura(codAsig),
codEst_Estudio smallint 
CONSTRAINT FKEstudio FOREIGN KEY  REFERENCES Estudio(codEst),
CONSTRAINT PKAsignaturaEstudio PRIMARY KEY(codAsig_Asignatura, codEst_Estudio)
)

CREATE TABLE Ficha (
numReg smallint CONSTRAINT PKExpediente PRIMARY KEY,
alumno 
)
