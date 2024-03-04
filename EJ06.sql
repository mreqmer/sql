USE Ejercicio06


CREATE TABLE Persona(
DNI char (9) NOT NULL
CONSTRAINT PKPersona PRIMARY KEY (DNI),
)


CREATE TABLE Coche(
Matricula char(7) NOT NULL,
Color varchar(10)NOT NULL,
CONSTRAINT PKCoche PRIMARY KEY (Matricula),
)




CREATE TABLE Posee(
DNI_Persona char (9) NOT NULL
CONSTRAINT FKPersona FOREIGN KEY REFERENCES Persona(DNI),
Matricula_Coche char(7) NOT NULL
CONSTRAINT FKCoche FOREIGN KEY REFERENCES Coche(Matricula),
Fecha Date NOT NULL,
CONSTRAINT PKPosee PRIMARY KEY (DNI_PERSONA, Matricula_Coche)
)

