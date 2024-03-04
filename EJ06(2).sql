CREATE DATABASE BDEjercicio06



USE BDEjercicio06


CREATE TABLE Tabla1 (
    IDTabla1 INT IDENTITY NOT NULL,
	CONSTRAINT PKTabla1 PRIMARY KEY (IDTabla1),
)


CREATE TABLE Tabla2 (
    IDTabla2 INT IDENTITY NOT NULL,
    IDTabla1 INT NOT NULL,
	CONSTRAINT PKTabla2 PRIMARY KEY (IDTabla2),
    CONSTRAINT FKTabla2 FOREIGN KEY (IDTabla1) REFERENCES Tabla1(IDTabla1) ON DELETE CASCADE
)


CREATE TABLE Tabla3 (
    IDTabla3 INT IDENTITY NOT NULL,
    IDTabla2 INT NOT NULL,
	CONSTRAINT PKTabla3 PRIMARY KEY (IDTabla3),
    CONSTRAINT FKTabla3 FOREIGN KEY (IDTabla2) REFERENCES Tabla2(IDTabla2) ON DELETE CASCADE
)
