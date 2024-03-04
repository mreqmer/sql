USE Ejercicio05

CREATE TABLE Persona(
DNI char(9) NOT NULL
CONSTRAINT PKPersona PRIMARY KEY (DNI)
)

CREATE TABLE Coche(
Matricula char(7) Not null,
Color varchar(10) Not null,
Dueño char(9) Not null
CONSTRAINT FKPersona FOREIGN KEY REFERENCES Persona(DNI),
CONSTRAINT PKCoche PRIMARY KEY (Matricula),
)