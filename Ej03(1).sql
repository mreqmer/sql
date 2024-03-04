USE Ejercicio03

CREATE TABLE Futbolista(
DNI Char(9) Not null,
CONSTRAINT PKFutbolista PRIMARY KEY (DNI),
)

CREATE TABLE Partido(
ID Char(9)Not Null,
CONSTRAINT PKPartido PRIMARY KEY (ID),
Fecha DATE Not null,
)

CREATE TABLE Juega(
DNI_Futbolista Char(9) Not null
CONSTRAINT FKFutbolista FOREIGN KEY REFERENCES Futbolista (DNI),
ID_Partido Char(9)Not Null
CONSTRAINT FKPartido FOREIGN KEY REFERENCES Partido (ID),
CONSTRAINT PKFutbolista_Partido PRIMARY KEY (DNI_Futbolista, ID_Partido),
)

