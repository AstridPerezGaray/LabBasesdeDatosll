CREATE VIEW VistaFacturas AS
SELECT
    F.ID_Factura,
    F.NumeroFactura,
    F.Comentario,
    F.FormaDePago,
    F.ID_DetalleFactura,
    F.ID_Cliente,
    C.NombreCliente AS Nombre_Cliente,
    C.ApellidoCliente AS Apellido_Cliente,
    C.Telefono AS Telefono_Cliente,
    C.Correo AS Correo_Cliente,
    C.DUI AS DUI_Cliente,
    C.TipoCliente AS Tipo_Cliente,
    C.FechaRegistro AS Fecha_Registro_Cliente,
    F.ID_Empleado,
    E.NombresEmpleado AS Nombres_Empleado,
    E.ApellidosEmpleado AS Apellidos_Empleado,
    E.Telefono AS Telefono_Empleado,
    E.Correo AS Correo_Empleado,
    E.DUI AS DUI_Empleado,
    E.ISSS AS ISSS_Empleado
FROM Facturas F
LEFT JOIN Clientes C ON F.ID_Cliente = C.ID_Cliente
LEFT JOIN Empleados E ON F.ID_Empleado = E.ID_Empleado;


select * from VistaFacturas;