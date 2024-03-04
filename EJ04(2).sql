go
use Librería
go 
CREATE TABLE Libro(
	ISBN varchar(13) not null,
	Títutlo varchar(10),
	Editorial varchar(10),
	Autor varchar (15),
)
go
CREATE TABLE Editorial(
	Nombre varchar(10) not null,
	teléfono char(9),
)
go
CREATE TABLE Autor(
	Nombre varchar(15) not null,
	añoNacimiento date
)
go
CREATE TABLE Stock(
	ISBN varchar(13) not null,
	cantidad smallint,
)
go

--PK
ALTER TABLE Libro ADD CONSTRAINT PKLibro PRIMARY KEY (ISBN);
ALTER TABLE Editorial ADD CONSTRAINT PKEditorial PRIMARY KEY (Nombre);
ALTER TABLE Autor ADD CONSTRAINT PKAutor PRIMARY KEY (Nombre);
ALTER TABLE Stock ADD CONSTRAINT PKStock PRIMARY KEY (ISBN);
--FK

ALTER TABLE Libro ADD CONSTRAINT FKLibro_Autor FOREIGN KEY (Autor) REFERENCES Autor(Nombre) ON UPDATE NO ACTION ON DELETE SET NULL;
ALTER TABLE Libro ADD CONSTRAINT FKLibro_Editorial FOREIGN KEY (Editorial) REFERENCES Editorial(Nombre) ON UPDATE NO ACTION ON DELETE CASCADE;
ALTER TABLE Stock ADD CONSTRAINT FKStock_Libro FOREIGN KEY (ISBN) REFERENCES Libro(ISBN) ON UPDATE NO ACTION  ON DELETE NO ACTION;

--BORRADO 

ALTER TABLE Libro DROP CONSTRAINT FKLibro_Autor;
ALTER TABLE Libro DROP CONSTRAINT FKLibro_Editorial;
ALTER TABLE Stock DROP CONSTRAINT FKStock_Libro;


