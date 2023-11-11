USE Agroservicio;
GO

CREATE PROCEDURE AgregarNuevoEmpleado
(
    @NombresEmpleado VARCHAR(60),
    @ApellidosEmpleado VARCHAR(60),
    @FechaNac DATE,
    @Telefono VARCHAR(10),
    @Correo VARCHAR(100),
    @DUI VARCHAR(10),
    @ISSS INT,
    @ID_Direccion INT,
    @ID_TipoEmpleado INT
)
AS
BEGIN
    INSERT INTO Empleados (NombresEmpleado, ApellidosEmpleado, FechaNac, Telefono, Correo, DUI, ISSS, ID_Direccion, ID_TipoEmpleado)
    VALUES (@NombresEmpleado, @ApellidosEmpleado, @FechaNac, @Telefono, @Correo, @DUI, @ISSS, @ID_Direccion, @ID_TipoEmpleado);
END;

-- EXEC del procedimiento de inserción
EXEC AgregarNuevoEmpleado 
    @NombresEmpleado = 'Juan',
    @ApellidosEmpleado = 'Perez',
    @FechaNac = '1990-05-15',
    @Telefono = '777555444',
    @Correo = 'juan.perez@example.com',
    @DUI = '123456789',
    @ISSS = 123456789,
    @ID_Direccion = 1,
    @ID_TipoEmpleado = 1; 

EXEC AgregarNuevoEmpleado 
    @NombresEmpleado = 'María',
    @ApellidosEmpleado = 'García',
    @FechaNac = '1985-09-20',
    @Telefono = '555333222',
    @Correo = 'maria.garcia@example.com',
    @DUI = '987654321',
    @ISSS = 987654321,
    @ID_Direccion = 1, 
    @ID_TipoEmpleado = 1; 

USE Agroservicio;
GO

-- Procedimiento almacenado de consulta con JOIN para mostrar empleados y departamentos
CREATE PROCEDURE ConsultarEmpleadosYDepartamentos
AS
BEGIN
    SELECT E.NombresEmpleado, E.ApellidosEmpleado, D.NombreDepartamento
    FROM Empleados E
    JOIN Direcciones Direccion ON E.ID_Direccion = Direccion.ID_Direccion
    JOIN Distritos Distrito ON Direccion.ID_Distrito = Distrito.ID_Distrito
    JOIN Municipios Municipio ON Distrito.ID_Municipio = Municipio.ID_Municipio
    JOIN Departamentos D ON Municipio.ID_Departamento = D.ID_Departamento;
END;

-- EXEC del procedimiento de consulta
EXEC ConsultarEmpleadosYDepartamentos;
