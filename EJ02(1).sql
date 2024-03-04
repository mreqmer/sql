USE Ejercicio02

CREATE TABLE Empleado(
DNI char(9) CONSTRAINT PKEmpleado PRIMARY KEY,
)

CREATE TABLE Departamento(
NumDpto varchar(5) CONSTRAINT PKDepartamento PRIMARY KEY,
)

CREATE TABLE Trabaja(
DNI_Empleado char(9) 
CONSTRAINT FKTrabaja_Empelado FOREIGN KEY REFERENCES Empleado(DNI),
NumDpto_Departamento varchar(5)
CONSTRAINT FKTrabaja_Departamento FOREIGN KEY REFERENCES Departamento(NumDpto),
)