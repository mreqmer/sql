USE Ejercicio10

CREATE TABLE Aula(
numero char (3)  NOT NULL
CONSTRAINT PKAula PRIMARY KEY (numero)
)

CREATE TABLE Ordenador(
id char(10)  NOT NULL
CONSTRAINT PKOrdenador PRIMARY KEY (id),
)
CREATE TABLE Alumno (
dni char(9) NOT NULL
CONSTRAINT PKAlumno PRIMARY KEY (dni),
)

CREATE TABLE Utiliza(
curso char(3),
alumno char(9)
CONSTRAINT FKAlumno FOREIGN KEY REFERENCES Alumno(dni),
ordenador char(10)
CONSTRAINT FKOrdenador FOREIGN KEY REFERENCES Ordenador(id),
CONSTRAINT PKUtiliza PRIMARY KEY (alumno, ordenador, curso),
)

CREATE TABLE Esta(
curso char(3),
aula char(3)
CONSTRAINT FKAula FOREIGN KEY REFERENCES Aula(numero),
ordenador char(10)
CONSTRAINT FKEsta FOREIGN KEY REFERENCES Ordenador(id),
CONSTRAINT PKEsta PRIMARY KEY (aula, ordenador, curso),
)
