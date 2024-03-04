use Ferretería

CREATE TABLE Tipo(
	tipo varchar(10) not null CONSTRAINT PKTipo PRIMARY KEY,
	descripción varchar(20),
)

CREATE TABLE Producto(
	tipo varchar(10) not null,
	nombre varchar(15) not null,
	precio money,
	CONSTRAINT PKProducto PRIMARY KEY (tipo, nombre),
	CONSTRAINT FKProducto_Tipo FOREIGN KEY (tipo) REFERENCES Tipo(tipo) ON DELETE NO ACTION ON UPDATE NO ACTION,
)
CREATE TABLE Venta(
	tipo varchar(10) not null,
	nombre varchar(15) not null,
	fecha DATE not null,
	cantidad smallint,
	CONSTRAINT PKVenta PRIMARY KEY (tipo, nombre, fecha),
	CONSTRAINT FKVenta_Producto FOREIGN KEY (tipo, nombre) REFERENCES Producto(tipo, nombre) ON DELETE SET NULL,
)
CREATE TABLE Tienda(
	id int IDENTITY not null,
	nombre varchar(15),
	CONSTRAINT PKTienda PRIMARY KEY (id),
)
CREATE TABLE Vende(
	tipo varchar(10)not null,
	nombre varchar(15) not null,
	idTienda int IDENTITY not null,
	CONSTRAINT FKVende_Producto FOREIGN KEY (tipo, nombre) REFERENCES Producto(tipo, nombre),
	CONSTRAINT FKVende_Tienda FOREIGN KEY (idTienda) REFERENCES Tienda(id),
	CONSTRAINT PKVende PRIMARY KEY (tipo, nombre, idTienda),
)


