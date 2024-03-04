USE Ejercicio09

CREATE TABLE Aula(
numero char (3)  NOT NULL
CONSTRAINT PKAula PRIMARY KEY (numero)
)

CREATE TABLE Ordenador(
id char(10)  NOT NULL
CONSTRAINT PKOrdenador PRIMARY KEY (id),
aula char (3) NOT NULL
CONSTRAINT FKAula FOREIGN KEY REFERENCES Aula(numero),
)
CREATE TABLE Alumno (
dni char(9) NOT NULL
CONSTRAINT PKAlumno PRIMARY KEY (dni),
ordenador char(10) NOT NULL
CONSTRAINT FKOrdenador FOREIGN KEY REFERENCES Ordenador(id)
)