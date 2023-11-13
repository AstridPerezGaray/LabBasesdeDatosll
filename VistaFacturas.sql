use Agroservicio;

CREATE VIEW VistaFacturas AS
SELECT
    F.ID_Factura,
    F.NumeroFactura,
    F.Comentario,
    F.FormaDePago,
    DF.ID_DetalleFactura,
    F.ID_Cliente,
    C.NombreCliente,
    C.ApellidoCliente,
    C.TelefonoCliente,
    C.TipoCliente,
    F.ID_Empleado,
    E.NombresEmpleado,
    E.ApellidosEmpleado,
    DF.CantidadProducto,
    DF.PrecioUnitario,
    DF.Subtotal,
    DF.IMPUESTO_IVA,
    DF.Total
FROM Facturas F
LEFT JOIN Clientes C ON F.ID_Cliente = C.ID_Cliente
LEFT JOIN Empleados E ON F.ID_Empleado = E.ID_Empleado
LEFT JOIN DetalleFacturas DF ON F.ID_DetalleFactura = DF.ID_DetalleFactura;

select * from VistaFacturas;





