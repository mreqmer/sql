use master
go
drop database if exists Colegas
go
Create Database Colegas
go
Use Colegas
GO
-- People
Create Table People (
	ID SmallInt Not NULL Constraint PKPeople Primary Key,
	Nombre VarChar(20) Not NULL,
	Apellidos VarChar(20) Not NULL,
	FechaNac Date NULL
)
GO
-- Carros
Create Table Carros (
	ID SmallInt Not NULL Constraint PKCarros Primary Key,
	Marca VarChar(15) Not NULL,
	Modelo VarChar(20) Not NULL,
	Anho SmallInt NULL Constraint CKAnno Check (Anho Between 1900 AND YEAR(Current_Timestamp)),
	Color VarChar(15),
	IDPropietario SmallInt NULL Constraint FKCarroPeople Foreign Key References People (ID) On Update No action On Delete No action
)
-- Libros
Create Table Libros(
	ID Int Not NULL Constraint PKLibros Primary Key,
	Titulo VarChar(60) Not NULL,
	Autors VarChar(50) NULL
)
GO
--Lecturas
Create Table Lecturas(
	IDLibro Int Not NULL,
	IDLector SmallInt Not NULL,
	Constraint PKLecturas Primary Key (IDLibro, IDLector),
	Constraint FKLecturasLibros Foreign Key (IDLibro) References Libros (ID) On Update No action On Delete No action,
	Constraint FKLecturasLectores Foreign Key (IDLector) References People (ID) On Update No action On Delete No action,
	AnhoLectura SmallInt NULL
)

--Insert de datos en la tabla People
INSERT  INTO People VALUES (1, 'Eduardo', 'Mingo', '1990-07-14');
INSERT  INTO People VALUES (2, 'Margarita', 'Pradera', '1992-11-11');
INSERT  INTO People VALUES (4, 'Eloisa', 'Lamandra', '2000-03-02');
INSERT  INTO People VALUES (5, 'Jordi', 'Videndo', '1989-05-28');
INSERT  INTO People VALUES (6, 'Alfonso', 'Sito', '1978-10-10');

--Insert de datos en la tabla Carros
INSERT  INTO Carros VALUES (1, 'Seat', 'Ibiza', '2014', 'Blanco', null);
INSERT  INTO Carros VALUES (2, 'Ford', 'Focus', '2016', 'Rojo', 1);
INSERT  INTO Carros VALUES (3, 'Toyota', 'Prius', '2017', 'Blanco', 4);
INSERT  INTO Carros VALUES (5, 'Renault', 'Megane', '2004', 'Azul', 2);
INSERT  INTO Carros VALUES (8, 'Mitsubishi', 'Colt', '2011', 'Rojo', 6);

--Insert de datos en la tabla Libros
INSERT  INTO Libros VALUES (2, 'El corazón de las Tinieblas', 'Joseph Conrad');
INSERT  INTO Libros VALUES (4, 'Cien años de soledad', 'Joseph Conrad');
INSERT INTO Libros VALUES (8, 'Harry Potter y la cámara de los secretos', 'J. K.Rowling');
INSERT INTO Libros VALUES (16, 'Evangelio del Flying Spaguetti Monster', 'Bobby Henderson');

--Insert de datos de la tabla lecturas
INSERT INTO Lecturas VALUES (4, 1, null);
INSERT INTO Lecturas VALUES (2, 2, null);
INSERT INTO Lecturas VALUES (8, 4, null);
INSERT INTO Lecturas VALUES (16, 5, null);
INSERT INTO Lecturas VALUES (16, 6, null);

--Margarita le ha vendido su coche a Alfonso.
UPDATE Carros SET IDPropietario=6 WHERE ID=5

--Queremos saber los nombres y apellidos de todos los que tienen 30 años o más

SELECT * FROM People WHERE (DATEDIFF(year,FechaNac, CURRENT_TIMESTAMP))>=30;

--Marca, año y modelo de todos los coches que no sean blancos ni verdes

SELECT * FROM Carros WHERE Color NOT IN ('blanco', 'verde');

--El nuevo gobierno regional ha prohibido todas las religiones, excepto la oficial. Por ello, los pastafarianos se ven obligados a ocultarse.
--Inserta un nuevo libro titulado "Vidas santas" cuyo autor es el Abate Bringas.
--Actualiza la tabla lecturas para cambiar las lecturas del Evangelio del FSM por este nuevo libro.

INSERT INTO Libros VALUES (1, 'Vidas Santas', 'Abate Bringas');
UPDATE Lecturas SET IDLibro=1 WHERE IDLibro=16;

--Eloísa también ha leído El corazón de las tinieblas y le ha gustado mucho.
INSERT INTO Lecturas VALUES (2, 4, NULL);

--Jordi se ha comprado el Seat IbIZA
UPDATE Carros SET IDPropietario=5 WHERE IDPropietario IS NULL;

--Haz una consulta que nos devuelva los ids de los colegas que han leído alguno de los libros con ID par.

SELECT IDLector FROM Lecturas WHERE IDLibro%2=0; 


