USE Ejercicio13

CREATE TABLE Edificio(
nombre varchar(49) NOT NULL,
dirección varchar(40),
CONSTRAINT PKEdificio PRIMARY KEY (nombre)
)

CREATE TABLE Empresa(
cif char(14) NOT NULL,
nombre varchar(40),
CONSTRAINT PKEmpresa PRIMARY KEY (cif),
)

CREATE TABLE Oficinas(
edificio varchar(49) NOT NULL
CONSTRAINT FKEdificio FOREIGN KEY REFERENCES Edificio(nombre),
empresa char(14) NOT NULL
CONSTRAINT FKEmpresa FOREIGN KEY REFERENCES Empresa(cif),
número smallint NOT NULL,
CONSTRAINT PKOficinas PRIMARY KEY (edificio, número)
)