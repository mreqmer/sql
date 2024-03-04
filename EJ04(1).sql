USE Ejercicio04

CREATE TABLE Cliente(
DNI char(9) Not null,
CONSTRAINT PKCliente PRIMARY KEY (DNI),
)

CREATE TABLE Traje(
Modelo VarChar(30) Not null,
CONSTRAINT PKTraje PRIMARY KEY (Modelo),
)

CREATE TABLE Compra(
DNI_Cliente char(9) Not null
CONSTRAINT FKCliente FOREIGN KEY REFERENCES Cliente (DNI),
Modelo_Traje VarChar(30) Not null
CONSTRAINT FKTraje FOREIGN KEY REFERENCES Traje (Modelo),
Fecha Date Not null,
Unidades SmallInt Not null,
CONSTRAINT PKCliente_Traje PRIMARY KEY (DNI_Cliente, Modelo_Traje, Fecha),
)