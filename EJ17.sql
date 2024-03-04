USE Ejercicio17

CREATE TABLE Municipio(
cp varchar(5) CONSTRAINT PKMunicipio PRIMARY KEY
)

CREATE TABLE Vivienda(
calle varchar(30), 
número smallint,
cp_Municipio varchar(5)
CONSTRAINT FKVivienda_Municipio FOREIGN KEY REFERENCES Municipio(cp),
CONSTRAINT PKVivienda PRIMARY KEY (calle, número, cp_Municipio)
)

CREATE TABLE Persona(
dni char(9) CONSTRAINT PKPersona PRIMARY KEY,
nombre varchar(30)not null,
empadronada varchar(5) not null
CONSTRAINT FKPersona_Municipio FOREIGN  KEY REFERENCES Municipio(cp),
calle_Vivienda varchar(30) not null,
número_Vivienda smallint not null,
cp_Vivienda varchar(5)not null,
cabezaFamilia char(9) not null
CONSTRAINT PKPersona_CF FOREIGN KEY REFERENCES Persona(dni), 
CONSTRAINT PKPersona_Vivienda FOREIGN KEY (calle_Vivienda, número_Vivienda, cp_Vivienda)  REFERENCES Vivienda(calle, número, cp_Municipio),
vive bit,
)
CREATE TABLE Propietaria(
dni_Persona char(9)
CONSTRAINT FK_Propietaria_Persona FOREIGN KEY REFERENCES Persona(dni),
calle_Vivienda varchar(30), 
número_Vivienda smallint,
cp_Vivienda varchar(5),
CONSTRAINT PKPropietaria_Vivienda FOREIGN KEY (calle_Vivienda, número_Vivienda, cp_Vivienda)  REFERENCES Vivienda(calle, número, cp_Municipio),
CONSTRAINT PLPropietaria PRIMARY KEY (dni_Persona, Calle_Vivienda, número_Vivienda, cp_Vivienda)
)
