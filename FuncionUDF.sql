USE Agroservicio;
GO

-- Crear una UDF con valores de tabla para obtener empleados por departamento
CREATE FUNCTION ObtenerEmpleadosPorDepartamento (@DepartamentoID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT NombresEmpleado, ApellidosEmpleado
    FROM Empleados
    WHERE ID_Departamento = @DepartamentoID
);

-- Usamos de la UDF con valores de tabla
SELECT *
FROM dbo.ObtenerEmpleadosPorDepartamento(1); -- Cambie el número de departamento
