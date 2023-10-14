USE Agroservicio;
GO

-- Procedimiento almacenado de inserci�n para agregar un nuevo empleado
CREATE PROCEDURE AgregarNuevoEmpleado
(
    @NombresEmpleado VARCHAR(60),
    @ApellidosEmpleado VARCHAR(60),
    @Telefono VARCHAR(10),
    @Correo VARCHAR(100),
    @DUI VARCHAR(60),
    @ISSS VARCHAR(15),
    @ID_Direccion INT
)
AS
BEGIN
    INSERT INTO Empleados (NombresEmpleado, ApellidosEmpleado, Telefono, Correo, DUI, ISSS, ID_Direccion)
    VALUES (@NombresEmpleado, @ApellidosEmpleado, @Telefono, @Correo, @DUI, @ISSS, @ID_Direccion);
END;


-- EXEC del procedimiento de inserci�n
EXEC AgregarNuevoEmpleado 'Juan', 'P�rez', '1234567890', 'juan@example.com', '1234567890', '12345', 1; -- Cambia los valores seg�n tus necesidades

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
    JOIN Municipio Municipio ON Distrito.ID_Municipio = Municipio.ID_Municipio
    JOIN Departamento D ON Municipio.ID_Departamento = D.ID_Departamento;
END;

-- EXEC del procedimiento de consulta
EXEC ConsultarEmpleadosYDepartamentos;