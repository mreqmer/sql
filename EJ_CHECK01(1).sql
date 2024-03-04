USE Restricciones01

CREATE TABLE Criaturas_Extrañas(
ID smallint CONSTRAINT PK_cRISTURAS_EXTRAÑAS PRIMARY KEY,
Nombre varchar(30),
FechaNac date,
NumeroPie smallint,
NivelIngles nchar(2),
Historieta varchar,
CONSTRAINT CK_FechaNac CHECK (FechaNac<Current_TimeStamp),
CONSTRAINT CK_NivelIngles CHECK (NivelIngles IN ('A1','A2','B1','B2','C1','C2')),
constraint  CK_Historieta CHECK (Historieta<>(CONVERT (VARCHAR, ID) + 'Pecadores' + CONVERT(VARCHAR, NumeroPie)))
)
