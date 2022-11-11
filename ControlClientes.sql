CREATE DATABASE ControlCliente;
USE ControlCliente;

CREATE TABLE Cliente
(
IdCliente int primary key not null auto_increment,
Nombre varchar (25), 
ApellidoPaterno varchar (25),
ApellidoMaterno varchar (25),
Telefono varchar (14),
NumTarjeta int,
Empresa varchar (25),
RFC varchar (14)
);

CREATE TABLE TipoSoftware
(
IdTipoSoftware int primary key not null auto_increment,
Nombre varchar (25),
Categoría varchar (25),
VersiónActual varchar (10)
);

CREATE TABLE SoftwareCliente
(
IdSoftwareC int primary key not null auto_increment,
Id_Cliente int not null,
Id_TipoSoftware int not null ,
Cantidad int,
Descuento int,
FechaInicio date,
FechaFin date,
FechaCorte date,
Estado boolean,
VersiónSoftware varchar (10),
foreign key (Id_Cliente) references Cliente(IdCliente),
foreign key (Id_TipoSoftware) references TipoSoftware(IdTipoSoftware)
);

CREATE TABLE Licencia
(
IdLicencia int primary key not null auto_increment,
Id_TipoSoftware int not null, 
Descripción varchar (25),
Precio double,
TipoLicencia int,
DíasPrórroga int,
foreign key (Id_TipoSoftware) references TipoSoftware(IdTipoSoftware)
);

CREATE TABLE Pagos
(
Id_SoftwareC int not null, 
Monto double,
Descuento int,
MétodoPago varchar (25),
FechaPago date,
Iva int,
PrecioSinIva double,
PrecioConDescuento double,
PrecioNeto double,
foreign key (Id_SoftwareC) references SoftwareCliente(IdSoftwareC)
);



