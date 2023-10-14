-- Creación de la base de datos
CREATE DATABASE Agroservicio;
USE Agroservicio;

-- Tablas
CREATE TABLE Departamento (
    ID_Departamento CHAR(2) PRIMARY KEY,
    NombreDepartamento VARCHAR(10) NOT NULL,
    Pais VARCHAR(60)	
);

CREATE TABLE Municipio (
    ID_Municipio CHAR(3) PRIMARY KEY,
    NombreMunicipio VARCHAR(10) NOT NULL,
    ID_Departamento INT NOT NULL,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento (ID_Departamento)
);

CREATE TABLE Distritos (
    ID_Distrito VARCHAR(5) PRIMARY KEY IDENTITY(1, 1),
    NombreDistrito VARCHAR(10),
    ID_Municipio INT NOT NULL,
    FOREIGN KEY (ID_Municipio) REFERENCES Municipio (ID_Municipio)
);

CREATE TABLE Direcciones (
    ID_Direccion INT PRIMARY KEY IDENTITY(1, 1),
    Linea1 VARCHAR(100),
    CodigoPostal INT,
    Pais VARCHAR(50),
    ID_Distrito INT NOT NULL,
    FOREIGN KEY (ID_Distrito) REFERENCES Distritos (ID_Distrito)
);

CREATE TABLE Empleados (
    ID_Empleado INT PRIMARY KEY IDENTITY(1, 1),
    NombresEmpleado VARCHAR(60) NOT NULL,
    ApellidosEmpleado VARCHAR(60) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Correo VARCHAR(100),
    DUI VARCHAR(60) NOT NULL,
    ISSS VARCHAR(15) NOT NULL,
    ID_Direccion INT NOT NULL,
    FOREIGN KEY (ID_Direccion) REFERENCES Direcciones (ID_Direccion)
);

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY IDENTITY(1, 1),
    NombreCliente VARCHAR(60) NOT NULL,
    ApellidoCliente VARCHAR(60) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Correo VARCHAR(100),
    DUI VARCHAR(60) NOT NULL,
    ID_Direccion INT NOT NULL,
    FOREIGN KEY (ID_Direccion) REFERENCES Direcciones (ID_Direccion)
);

CREATE TABLE Proveedores (
    ID_Proveedor INT PRIMARY KEY IDENTITY(1, 1),
    NombreProveedor VARCHAR(60) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    ID_Direccion INT NOT NULL,
    FOREIGN KEY (ID_Direccion) REFERENCES Direcciones (ID_Direccion)
);

CREATE TABLE Categoria (
    ID_Categoria INT PRIMARY KEY IDENTITY(1, 1),
    NombreCategoria VARCHAR(100) NOT NULL,
    DescripcionCategoria VARCHAR(200)
);

CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY IDENTITY(1, 1),
    NombreProducto VARCHAR(100) NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    ID_Categoria INT NOT NULL,
    ID_Inventario INT NOT NULL
);

CREATE TABLE Inventarios (
    ID_Inventario INT PRIMARY KEY IDENTITY(1, 1),
    FechaRegistro DATETIME NOT NULL,
    TipoTransaccion VARCHAR(20) NOT NULL,
    Cantidad DECIMAL(10, 2) NOT NULL,
    Ubicacion VARCHAR(20) NOT NULL,
    ID_Producto INT NOT NULL,
    FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)
);

CREATE TABLE Usuarios (
    ID_Usuario INT PRIMARY KEY IDENTITY(1, 1),
    Usuario VARCHAR(60) NOT NULL,
    Clave VARCHAR(60) NOT NULL,
    ID_Empleado INT NOT NULL,
    ID_Rol INT NOT NULL
);

CREATE TABLE Roles (
    ID_Rol INT PRIMARY KEY IDENTITY(1, 1),
    NombreRol VARCHAR(40) NOT NULL
);

CREATE TABLE Opciones (
    ID_Opcion INT PRIMARY KEY IDENTITY(1, 1),
    NombreOpcion VARCHAR(40) NOT NULL
);

CREATE TABLE AsignacionRolesOpciones (
    ID_AsignacionRol INT PRIMARY KEY IDENTITY(1, 1),
    ID_Rol INT NOT NULL,
    ID_Opcion INT NOT NULL
);

CREATE TABLE Facturas (
    ID_Factura INT PRIMARY KEY IDENTITY(1, 1),
    NumeroFactura INT NOT NULL,
    Comentario VARCHAR(100),
    ID_DetalleFactura INT NOT NULL,
    ID_Cliente INT NOT NULL,
    ID_Empleado INT NOT NULL
);

CREATE TABLE DetalleFacturas (
    ID_DetalleFactura INT PRIMARY KEY IDENTITY(1, 1),
    CantidadProducto INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    ID_Producto INT NOT NULL
);