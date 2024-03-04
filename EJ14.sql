USE Ejercicio14

CREATE TABLE Edificio(
nombre varchar(40)NOT NULL,
direcci�n varchar(40)NOT NULL,
CONSTRAINT PKEdificio PRIMARY KEY (nombre),
)


CREATE TABLE Oficina(
edificio varchar(40)NOT NULL
CONSTRAINT FKEdificio FOREIGN KEY REFERENCES Edificio(nombre)
ON DELETE CASCADE
ON UPDATE CASCADE,
n�mero smallint NOT NULL,
CONSTRAINT PKOficina PRIMARY KEY (edificio, n�mero),
)


CREATE TABLE Obra(
id char(10)NOT NULL,
CONSTRAINT PKObra PRIMARY KEY (id),
)

CREATE TABLE EmpleadoOficinista(
dni char(9) NOT NULL,
nombre varchar(40),
sueldo money,
titulaci�n varchar(40),
oficina smallint NOT NULL,
edificio varchar(40)NOT NULL,
CONSTRAINT FKedificio_Oficinista Foreign key (edificio,oficina)REFERENCES Oficina (edificio,n�mero),
CONSTRAINT PKEmpleadoOficina PRIMARY KEY (dni),
jefe char (9)
CONSTRAINT FKjefe_Oficinista Foreign key REFERENCES EmpleadoOficinista (dni),
)

CREATE TABLE EmpleadoObrero(
dni char(9) NOT NULL,
nombre varchar(40),
sueldo money,
obra  char(10) NOT NULL
CONSTRAINT FKObra FOREIGN KEY REFERENCES Obra(id),
fechaInicio date,
jefe char (9)
CONSTRAINT FKjefe Foreign key REFERENCES EmpleadoObrero (dni),
CONSTRAINT PKEmpleadoObrero PRIMARY KEY (dni),
)
