USE Restricciones03

CREATE TABLE DatosRestrictivos(
ID smallint CONSTRAINT OKDatosRestrictivos PRIMARY KEY, 
Nombre char(15) UNIQUE not null,
Numpelos int,
TipoRopa char,
NumSuerte TinyInt,
Minutos TinyInt,
CONSTRAINT CK_ID CHECK (ID%2<>0),
CONSTRAINT CK_Nombre CHECK (Nombre NOT LIKE 'N%' AND NOMBRE NOT LIKE 'X%'),
CONSTRAINT CK_Numpelos CHECK(Numpelos between 0 AND 150000),
CONSTRAINT CK_Tipo_Ropa CHECK (TipoRopa IN ('C', 'F', 'E', 'P', 'B', 'N')),
CONSTRAINT CKNumSuerte CHECK ((NumSuerte between 10 AND 40) AND (NumSuerte/3=0)),
CONSTRAINT CKMinutos CHECK ((Minutos between 20 AND 85) OR (Minutos BETWEEN 120 AND 85)),
)

CREATE TABLE DatosRelacionados(
NombreRelacionado char(15)
CONSTRAINT FKDatosRelacionados_DatosRestrictivos FOREIGN KEY REFERENCES DatosRestrictivos (Nombre),
PalabraTabu char(20),
NumRarito TinyInt,
NumMasGrande SmallInt CONSTRAINT PKDatosRelacionados PRIMARY KEY,
CONSTRAINT CKPalabraTabu CHECK (PalabraTabu NOT IN ('MENA', 'Gurtel', 'Ere', 'Procés', 'sobresueldo') AND PalabraTabu NOT LIKE '%eo'),
CONSTRAINT CKNumRarito CHECK (NumRarito NOT IN (2, 3, 7, 11, 13, 17)),
CONSTRAINT CKNumMasGrande CHECK (NumMasGrande between NumRarito AND 1000), 
)

CREATE TABLE Columnas(
ID Smallint CONSTRAINT PKColumanas PRIMARY KEY, 
LimiteSuperior Smallint, 
OtroNumero SmallInt UNIQUE not null,
NumeroQueVinoDelMasAlla SmallInt
CONSTRAINT FKColumnas_DatosRelacionados FOREIGN KEY REFERENCES DatosRelacionados(NumMasGrande),
Etiqueta char(3),
CONSTRAINT CKID CHECK (ID/5=0),
CONSTRAINT CKLimiteSuperior CHECK (LimiteSuperior between 1500 and 2000),
CONSTRAINT CKEtiqueta CHECK (Etiqueta not in ('lao', 'leo', 'lio', 'luo' )),
)