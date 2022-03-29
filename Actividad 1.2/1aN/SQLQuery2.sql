USE MASTER
GO
CREATE DATABASE Relacion_1aN
GO
USE Relacion_1aN
GO
CREATE TABLE Marca(
Id int not null PRIMARY KEY identity(1,1),
Nombre VARCHAR(150) not null UNIQUE,
)
GO
CREATE TABLE Producto(
IdProducto int not null PRIMARY KEY identity(1,1),
IdMarca int not null FOREIGN KEY REFERENCES Marca(Id),
Descripcion VARCHAR(250)
)