USE Ejercicio12

Create table Autob�s(
matr�cula char(7) NOT NULL,
CONSTRAINT PKAutobus PRIMARY KEY (matr�cula),
)

CREATE TABLE L�nea(
n�mero char(5) NOT NULL,
CONSTRAINT PKLinea PRIMARY KEY (n�mero),
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
autob�s char(7) NOT NULL
CONSTRAINT FKAutob�s FOREIGN KEY REFERENCES Autob�s(matr�cula),
l�nea char(5) NOT NULL
CONSTRAINT FKL�nea FOREIGN KEY REFERENCES L�nea(n�mero),
d�a DATE NOT NULL,
CONSTRAINT PKUtiliza PRIMARY KEY (conductor, autob�s, l�nea)
)



CREATE TABLE Pasa(
l�nea char(5) NOT NULL
CONSTRAINT FKL�nea_Pasa FOREIGN KEY REFERENCES L�nea(n�mero),
calle varchar(40) NOT NULL
CONSTRAINT FKCalle_Pasa FOREIGN KEY REFERENCES Calle(nombre),
CONSTRAINT PKPasa PRIMARY KEY (l�nea, calle)
)
