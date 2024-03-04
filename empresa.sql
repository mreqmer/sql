GO
use Ejercicio02
drop database if exists  Empresa
create database Empresa
GO

GO
use empresa

CREATE TABLE Empleados (
numemp int,
nombre varchar(40),
edad smallint,
oficina int,
puesto varchar(10),
fecha_contrato DATE,
jefe int,
cuota money,
ventas int,
)

CREATE TABLE Clientes(
numclie int,
nombre varchar(40),
resp int,
limitecredito money,
)

CREATE TABLE Oficinas(
oficina int,
ciudad varchar(40),
region varchar(40),
dir int,
objetivo varchar(40),
ventas int,
)

CREATE TABLE Productos(
idfab int,
idproducto int,
descripcion varchar(40),
precio money,
existencias int,

)

CREATE TABLE Pedidos(
numpedido int, 
fechapedido date, 
clie int,
resp int,
fab int,
producto int, 
cant int, 
importe money,
)
/* Restricciones not null */
ALTER TABLE Empleados ALTER COLUMN  numemp int not null;
ALTER TABLE Empleados ALTER COLUMN jefe int not null;
ALTER TABlE Clientes ALTER COLUMN  numclie int not null;
ALTER TABlE Clientes ALTER COLUMN  resp int not null;
ALTER TABLE Oficinas ALTER COLUMN oficina int not null;
ALTER TABLE Oficinas ALTER COLUMN dir int not null;
ALTER TABLE Productos ALTER COLUMN idfab int not null;
ALTER TABLE Productos ALTER COLUMN iproducto int not null;
ALTER TABlE Pedidos ALTER COLUMN  numpedido int not null;
ALTER TABlE Pedidos ALTER COLUMN  resp int not null;
ALTER TABlE Pedidos ALTER COLUMN fab int not null;
ALTER TABlE Pedidos ALTER COLUMN producto int not null;

/*Restricciones PK*/
ALTER TABLE Empleados ADD CONSTRAINT PKEmpleado PRIMARY KEY (numemp);
ALTER TABLE Clientes ADD CONSTRAINT PKClientes PRIMARY KEY (numclie);
ALTER TABLE Oficinas ADD CONSTRAINT PKOficinas  PRIMARY KEY (oficina);
ALTER TABLE Productos ADD CONSTRAINT PKProductos PRIMARY KEY (idfab, idproducto);
ALTER TABLE Pedidos ADD CONSTRAINT PKPedidos PRIMARY KEY (numpredido);

/*foreign keys */
ALTER TABLE Empleados ADD CONSTRAINT FKCliente_Jefe FOREIGN KEY (jefe) REFERENCES Empleados(numemp);
ALTER TABLE Clientes ADD CONSTRAINT FKCliente_Empoleados FOREIGN KEY (resp) REFERENCES Empleados(numemp);
ALTER TABLE Oficinas ADD CONSTRAINT FKOficina_Empleados FOREIGN KEY (dir) REFERENCES Empleados(numemp);
ALTER TABLE Pedidos ADD CONSTRAINT FKPedidos_Cliente FOREIGN KEY (clie) REFERENCES Clientes(numclie);
ALTER TABLE Pedidos ADD CONSTRAINT FKPedidos_Empleados FOREIGN KEY (resp) REFERENCES Empleados(numemp);
ALTER TABLE Pedidos ADD CONSTRAINT FKPedidos_Productos FOREIGN KEY (fab, producto) REFERENCES Productos(idfab, idproducto);

/*añadir campos a tablas*/
ALTER TABLE Empleados ADD sueldo int;
ALTER TABLE Cliente ADD cuenta_bancaria int;
ALTER TABLE Productos ADD color int;
GO

/*cambio de datos*/
ALTER TABLE Empelados ALTER COLUMN sueldo money;
ALTER TABLE Empelados ALTER COLUMN nombre varchar(50);


GO
/*borrado de restricciones*/
ALTER TABLE Empleados DROP CONSTRAINT PKEmpleado;
ALTER TABLE Clientes DROP CONSTRAINT PKClientes;
ALTER TABLE Oficinas DROP CONSTRAINT PKOficinas;
ALTER TABLE Productos DROP CONSTRAINT PKProductos;
ALTER TABLE Pedidos DROP CONSTRAINT PKPedidos;
ALTER TABLE Empleados DROP CONSTRAINT FKCliente_Jefe;
ALTER TABLE Clientes DROP CONSTRAINT FKCliente_Empoleados;
ALTER TABLE Oficinas DROP CONSTRAINT FKOficina_Empleados;
ALTER TABLE Pedidos DROP CONSTRAINT FKPedidos_Cliente;
ALTER TABLE Pedidos DROP CONSTRAINT FKPedidos_Empleados;
ALTER TABLE Pedidos DROP CONSTRAINT FKPedidos_Productos;

GO

