USE Restricciones02

CREATE TABLE CriaturitasRaras(
	ID tinyint Not NULL,
	Nombre nvarchar(30) Not NULL,
	FechaNac Date NULL, 
	NumeroPie SmallInt NULL,
	NivelIngles NChar(2) NULL,
	Historieta VarChar(300) NULL,
	NumeroChico TinyInt NULL,
	NumeroGrande BigInt NULL,
	NumeroIntermedio SmallInt NULL,
	Temperatura Decimal(3,1) NULL,
	CONSTRAINT [PK_CriaturitasEx] PRIMARY KEY(ID),
	CONSTRAINT CKNumeroPie CHECK (NumeroPie between 25 AND 60),
	CONSTRAINT CKNumeroChico CHECK (NumeroChico < 100),
	CONSTRAINT CKNumeroGrande CHECK (NumeroGrande>(NumeroChico*100)),
	CONSTRAINT CKNumeroIntermedio CHECK ((NumeroIntermedio<>(NumeroChico & NumeroGrande) AND (NumeroIntermedio%2 = 2))),
	CONSTRAINT CKFechaNacimiento CHECK (FechaNac<Current_TimeStamp),
	CONSTRAINT CK_NivelIngles CHECK (NivelIngles IN ('A1','A2','B1','B2','C1','C2')),
	CONSTRAINT CKHistorieta CHECK (Historieta NOT LIKE '%oscuro%' AND Historieta NOT LIKE '%apocalipsis%'),
	CONSTRAINT CKTemperatura CHECK (Temperatura between 32.5 AND 44),
 )

