USE Ejercicio12

Create table Autobús(
matrícula char(7) NOT NULL,
CONSTRAINT PKAutobus PRIMARY KEY (matrícula),
)

CREATE TABLE Línea(
número char(5) NOT NULL,
CONSTRAINT PKLinea PRIMARY KEY (número),
)
CREATE TABLE Calle(
nombre varchar(40 )NOT NULL,
CONSTRAINT PKCalle PRIMARY KEY (nombre),
)

CREATE TABLE Conductor(
dni char(9) NOT NULL,
CONSTRAINT PKConductor PRIMARY KEY (dni),
calle varchar(40)NOT NULL
CONSTRAINT FKCalle FOREIGN KEY REFERENCES Calle(nombre),
)

CREATE TABLE Utiliza(
conductor char(9) NOT NULL
CONSTRAINT FKConductor FOREIGN KEY REFERENCES Conductor(dni),
autobús char(7) NOT NULL
CONSTRAINT FKAutobús FOREIGN KEY REFERENCES Autobús(matrícula),
línea char(5) NOT NULL
CONSTRAINT FKLínea FOREIGN KEY REFERENCES Línea(número),
día DATE NOT NULL,
CONSTRAINT PKUtiliza PRIMARY KEY (conductor, autobús, línea)
)



CREATE TABLE Pasa(
línea char(5) NOT NULL
CONSTRAINT FKLínea_Pasa FOREIGN KEY REFERENCES Línea(número),
calle varchar(40) NOT NULL
CONSTRAINT FKCalle_Pasa FOREIGN KEY REFERENCES Calle(nombre),
CONSTRAINT PKPasa PRIMARY KEY (línea, calle)
)
