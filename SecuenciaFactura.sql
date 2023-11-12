Use Agroservicio


CREATE SEQUENCE SecuenciaFacturas
    START WITH 1
    INCREMENT BY 1;


	ALTER TABLE Facturas
    ADD CONSTRAINT DF_NumeroFactura DEFAULT (NEXT VALUE FOR SecuenciaFacturas) FOR NumeroFactura;


	
	select * from Facturas