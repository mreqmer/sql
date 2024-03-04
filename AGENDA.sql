go
use master
drop database if exists agenda
create database agenda
go 
go
USE Agenda;

CREATE TABLE  Contactos (
	nombre varchar(25),
	dni varchar(9),
	CONSTRAINT PKContactos PRIMARY KEY (dni)

) 

CREATE TABLE  Telefonos (
	 id INT IDENTITY,
	 numero varchar(9),
	 dni varchar(9),
	 CONSTRAINT PKTelefonos PRIMARY KEY(id),
	 CONSTRAINT FKTeledonos FOREIGN KEY (dni) REFERENCES Contactos(dni) 
	 ON UPDATE NO ACTION
	 ON DELETE CASCADE
) 

INSERT INTO Contactos values ('Ana', '111');
INSERT INTO Contactos values('Pepe', '222');
INSERT INTO Contactos values('Juan', '333');

INSERT INTO Telefonos (numero, dni) values ('1111', '111');
INSERT INTO Telefonos (numero, dni) values ('2222', '111');
INSERT INTO Telefonos (numero, dni) values ('3333', '111');
INSERT INTO Telefonos (numero, dni) values ('4444', '222');
INSERT INTO Telefonos (numero, dni) values ('5555', '222');
INSERT INTO Telefonos (numero, dni) values ('5555', '333');
go