USE Ejercicio11

CREATE TABLE Aplicacion(
titulo char (20)  NOT NULL
CONSTRAINT PKAplicaciones PRIMARY KEY (titulo)
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
tiempo TIME,
alumno char(9) NOT NULL
CONSTRAINT FKAlumno FOREIGN KEY REFERENCES Alumno(dni),
ordenador char(10)NOT NULL
CONSTRAINT FKOrdenador FOREIGN KEY REFERENCES Ordenador(id), 
aplicacion char (20) not null
CONSTRAINT FKAplicacion FOREIGN KEY REFERENCES Aplicacion(titulo),
CONSTRAINT PKUtiliza PRIMARY KEY (alumno, aplicacion)
)
