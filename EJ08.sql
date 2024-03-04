USE Ejercicio08

CREATE TABLE Coche(
Matricula char(7) NOT NULL,
CONSTRAINT PKCoche PRIMARY KEY (Matricula), 
)

CREATE TABLE Cochera(
ID varchar(5) NOT NULL,
Coche char(7)
CONSTRAINT FKCoche FOREIGN KEY REFERENCES Coche(Matricula),
CONSTRAINT PKcochera PRIMARY KEY (ID),
)