USE ORION
GO

CREATE OR ALTER PROC sp_LoginAppMovilID /*'erick@miprestadito.com', '1301198000105'*/-- 'grisaac72@gmail.com', '01@Febrero'
@fcUsuarioAcceso VARCHAR(50),
@fcPassword VARCHAR (1000)
AS
BEGIN
DECLARE @fcPasswordEncrypt VARCHAR(2000) = (CONVERT(VARCHAR(2000), HashBytes('MD5', @fcPassword), 2))

DECLARE @filDCliente INT = (SELECT fiIDCliente FROM
[dbo].[ClientesMovil_Logins]
WHERE fcUsuarioAcceso = @fcUsuarioAcceso AND fcPassword = @fcPasswordEncrypt)

DECLARE @URL VARCHAR(150) = (SELECT fcValorLlave FROM Catalogo_Configuraciones WHERE fcNombreLlave = 'URLImagenesAppNovanet');
	

SELECT 
		[fiIDUnico], 
		[fiIDCuentaFamiliar], 
		[fiIDCliente], 
		[fcUsuarioAcceso], 
		[fcNombreUsuario], 
		[fcNmbreCorto], 
		[fcTelefono], 
		CASE WHEN [fcURLFotoPersonalizda] != '' 
		THEN CONCAT(@URL,[fcURLFotoPersonalizda])
		ELSE 'https://i.ibb.co/Vm56qDZ/logos.png' 
		END AS NombreArchivo,
		[fiTipodeUsuario]	
		FROM
		[dbo].[ClientesMovil_Logins]
		WHERE fiIDCliente  = @filDCliente

EXEC sp_ClientesMovil_InformacionBasica  @filDCliente

END


GO

GO
CREATE OR ALTER PROC sp_Productos_ListaPorCliente --38
@piIDSolicitud Int
AS
BEGIN
	DECLARE @URL VARCHAR(150) = (SELECT fcValorLlave FROM Catalogo_Configuraciones WHERE fcNombreLlave = 'URLImagenMovile') + '/';

	SELECT	 ROW_NUMBER() OVER(ORDER BY CAT.fcTipoProducto) AS RowNum
			,fiIDEquifaxGarantia
			,fiIDEquifax
			,fcIDentidad
			,EQFG.fiIDProducto
			,PROD.fcProducto
			,MARC.fcMarca
			,fiIDSolicitud
			,EQFG.fnValorProductoME AS fnValorProducto
			,EQFG.fnValorProductoMN
			,EQFG.[fnPorcentajeImpuesto2]
			,CAT.fcTipoProducto
			,EQFG.fnValorCuotaMensual
			,CAT.fcTipoProducto
			,PROD.fiIDTipoProducto
			,CASE WHEN fcImagenProducto != '' 
			THEN CONCAT(@URL, SUBSTRING(fcImagenProducto, LEN(fcImagenProducto) - CHARINDEX('\', REVERSE(fcImagenProducto)) + 2, LEN(fcImagenProducto)))
        ELSE 'https://i.ibb.co/Vm56qDZ/logos.png' END AS NombreArchivo
	FROM [ORION].[dbo].[Equifax_Garantia] EQFG
	 INNER JOIN Productos_Maestro		PROD	ON  EQFG.fiIDProducto		= PROD.fiIDProducto
	 INNER JOIN Catalogo_TipoProducto	CAT		ON	PROD.fiIDTipoProducto	= CAT.fiIDTipoProducto
	 INNER JOIN Catalogo_Marcas			MARC	ON	PROD.fiIDMarca			= MARC.fiIDMarca  
	WHERE fiIDSolicitud = @piIDSolicitud
	AND PROD.fiIDTipoProducto NOT IN (9, 7)
	ORDER BY CAT.fcTipoProducto
END

GO

CREATE OR ALTER PROC sp_ProductosAsolicitud_ListaPorCliente -- 5
@piIDSolicitud Int
AS
BEGIN
	DECLARE @URL VARCHAR(150) = (SELECT fcValorLlave FROM Catalogo_Configuraciones WHERE fcNombreLlave = 'URLImagenMovile') + '/';
	
	SELECT 
			ROW_NUMBER() OVER(ORDER BY CAT.fcTipoProducto) AS RowNum,
			PROD.fiIDProducto,
			PROD.fcProducto,
			MARC.fcMarca,
			PROD.fnValorProductoME AS fnValorProducto,
			PROD.fnValorProductoMN,
			CAT.fcTipoProducto,
			CASE WHEN fcImagenProducto != '' 
			THEN CONCAT(@URL, SUBSTRING(fcImagenProducto, LEN(fcImagenProducto) - CHARINDEX('\', REVERSE(fcImagenProducto)) + 2, LEN(fcImagenProducto)))
			ELSE 'https://i.ibb.co/Vm56qDZ/logos.png' 
			END AS NombreArchivo
	FROM Productos_Maestro PROD
	JOIN Catalogo_Marcas			MARC	ON	PROD.fiIDMarca			= MARC.fiIDMarca 
	JOIN Catalogo_TipoProducto	CAT		ON	PROD.fiIDTipoProducto		= CAT.fiIDTipoProducto
	WHERE fiIDProducto 
	NOT IN ( 
			SELECT	EQFG.fiIDProducto
					FROM [ORION].[dbo].[Equifax_Garantia] EQFG
					WHERE fiIDSolicitud = @piIDSolicitud  			
			)
	AND PROD.fiIDTipoProducto NOT IN (9, 7);
END

GO

CREATE OR ALTER PROC sp_ActualizarImagenPerfilAppMovil -- 1,'https://i.pinimg.com/564x/67/8b/9e/678b9edb57bb7a780e57425cf599a6a7.jpg'
@piIDUnico					INT,
@pcURLFotoPersonalizda		NVARCHAR(250)
AS
BEGIN
BEGIN TRY
	UPDATE [ClientesMovil_Logins]
	SET fcURLFotoPersonalizda =  @pcURLFotoPersonalizda
	WHERE fiIDUnico = @piIDUnico

	SELECT '200' CodeStatus, 'Foto de Perfil Actualiazada' MessageStatus
END TRY
BEGIN CATCH
	SELECT '500' CodeStatus, 'Ha Ocurrido un Error Inesperado' MessageStatus
END CATCH
END

GO


CREATE OR ALTER procedure [dbo].[sp_ClientesMovil_Registrar]  --'1301198000105'
(
@pcIdentidadCliente VarChar(20)
)
as
Begin
	


	DECLARE @UsuarioExiste INT = (
								SELECT	COUNT([fiIDUnico])
										FROM [dbo].[ClientesMovil_Logins]
										WHERE fiIDCliente  = (SELECT 
									ec.fiIDEquifax
									from Clientes_Maestro CTE
									INNER JOIN Equifax_Cliente ec on CTE.fiIDEquifax=ec.fiIDEquifax
									INNER JOIN OrionSolicitud_Maestro osm on osm.fiIDCliente = ec.fiIDEquifax
									where ec.fcIdentidad = @pcIdentidadCliente))

	select 
	CASE WHEN @UsuarioExiste = 1 THEN 'SI' ELSE 'NO' END AS usuarioExiste,
	ec.fiIDEquifax,
	ec.fcIdentidad,
	ec.fcNombre,
	ec.fdFechaNacimiento,
	cte.fcCorreo,
	cte.fcDireccionDetallada,
	cte.fcGeolocalizacion,
	osm.fiIDSolicitud,
	(select top 1 osd.fcRutaArchivo from OrionSolicitud_Documentos OSD where osd.fiIDOrionSolicitud = osm.fiIDSolicitud and osd.fiIDDocumento = 6) as fcrutaArchivo,
	(select top 1 osd.fcURL from OrionSolicitud_Documentos OSD where osd.fiIDOrionSolicitud = osm.fiIDSolicitud and osd.fiIDDocumento = 6) as fcrutaArchivo
	from Clientes_Maestro CTE
	INNER JOIN Equifax_Cliente ec on CTE.fiIDEquifax=ec.fiIDEquifax
	INNER JOIN OrionSolicitud_Maestro osm on osm.fiIDCliente = ec.fiIDEquifax
	where ec.fcIdentidad = @pcIdentidadCliente
end


GO
	--sp_RegistroUsuarioPrincipalAppMovil 'Kevin.Santos','Kevin123!', 10043

	CREATE OR ALTER PROC sp_RegistroUsuarioPrincipalAppMovil 
	@pcUsuarioAcceso VARCHAR(200),
	@pcPassword VARCHAR (1000),
	@piIDCliente INT
	AS
	BEGIN
	BEGIN TRY
	BEGIN TRANSACTION;
		DECLARE @EXISTEUSUARIOPROP INT = (SELECT COUNT(*) FROM [ClientesMovil_Logins] WHERE fiIDCliente = @piIDCliente);

		IF  (@EXISTEUSUARIOPROP > 0)
		BEGIN
			ROLLBACK TRANSACTION;
			SELECT 409 CodeStatus, 'Usted ya cuenta con un Usuario'  MessageStatus		
			RETURN;
		END
		
		ELSE 
		BEGIN
			DECLARE @fcPasswordEncrypt				VARCHAR	(150)	=	(CONVERT(VARCHAR(2000), HashBytes('MD5', @pcPassword), 2));

			DECLARE @fiDCuentaFamiliarORFilDCliente VARCHAR	(10)	=	(SELECT	SM.fiIDCliente 	FROM OrionSolicitud_Maestro SM
																		 WHERE fiIDCliente = @piIDCliente);

			DECLARE @fcNombre						VARCHAR	(200)	=	(SELECT	EXC.fcNombre	FROM OrionSolicitud_Maestro SM 
																		 INNER JOIN Equifax_Cliente EXC
																		 ON SM.fiIDCliente	=  EXC.fiIDEquifax
																		 WHERE fiIDCliente = @piIDCliente);

			DECLARE @fcTelefono						VARCHAR	(20)	=	(SELECT	EXC.fcTelefono	FROM OrionSolicitud_Maestro SM 
																		 INNER JOIN Equifax_Cliente EXC
																		 ON SM.fiIDCliente	=  EXC.fiIDEquifax
																		 WHERE fiIDCliente = @piIDCliente);

			DECLARE @fcCorreo						VARCHAR	(100)	=	(SELECT	CM.fcCorreo	FROM OrionSolicitud_Maestro SM 
																		 INNER JOIN Clientes_Maestro CM			
																		 ON SM.fiIDCliente	= CM.fiIDEquifax
																		 WHERE fiIDCliente = @piIDCliente );

			
		
			INSERT INTO ClientesMovil_Logins
			(fiIDCuentaFamiliar, fiIDCliente, fcUsuarioAcceso, fcPassword, fcNombreUsuario, fcTelefono, fiTipodeUsuario, fdFechaCreacion,fcToken, fcNmbreCorto, fcURLFotoPersonalizda, fdFechaPrimerAcceso, fdFechaUltimoAcceso)
			VALUES
			(@fiDCuentaFamiliarORFilDCliente, @fiDCuentaFamiliarORFilDCliente, @fcCorreo, @fcPasswordEncrypt, @fcNombre, @fcTelefono, 1, GETDATE(),NEWID(),' ', ' ', GETDATE(), GETDATE());


			SELECT 200 CodeStatus, 'Registrado con éxito'  MessageStatus		

		 END
		 COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
			SELECT 500 CodeStatus, 'Ha ocurrido un error inesperado'  MessageStatus		
			SELECT ERROR_MESSAGE() ;
		END CATCH
	END

	GO

	CREATE OR ALTER PROC sp_BuscarCorreoAppMovil-- 'erick@miprestadito.com'
	@pcCorreo VARCHAR(100)
	AS
	BEGIN
		
		DECLARE @Usuario INT =(SELECT ISNULL(fiIDUnico,0) FROM ClientesMovil_Logins
		WHERE fcUsuarioAcceso = @pcCorreo)

		IF @Usuario > 0
		BEGIN
			SELECT @Usuario CodeStatus, @pcCorreo  MessageStatus		
		END
		ELSE
		BEGIN
			SELECT 0 CodeStatus, 'Correo no Encontrado'  MessageStatus		
		END
	END

	GO

	CREATE OR ALTER PROC sp_CambiodeContraAppMovil --7079, 'Kevin123!'
	@piIDUnico	INT,
	@pcPassword	VARCHAR(1000)
	AS
	BEGIN
	BEGIN  TRY 
		DECLARE @fcPasswordEncrypt VARCHAR(2000) = (CONVERT(VARCHAR(2000), HashBytes('MD5', @pcPassword), 2))

		UPDATE ClientesMovil_Logins
		SET
			fcPassword = @fcPasswordEncrypt
		WHERE fiIDUnico = @piIDUnico

			SELECT 200 CodeStatus, 'Contraseña Actualizada con Éxito'  MessageStatus		

	END TRY
	BEGIN CATCH
			SELECT 500 CodeStatus, 'Ha ocurrido un error inesperado'  MessageStatus		
			SELECT ERROR_MESSAGE() ;
	END CATCH
	END


	GO

	CREATE OR ALTER PROC sp_Catalogo_UsuariosFamiliares_AppMovil --10016
	@piIDCuentaFamiliar INT
	AS
	BEGIN
		
		DECLARE @URL VARCHAR(150) = (SELECT fcValorLlave FROM Catalogo_Configuraciones WHERE fcNombreLlave = 'URLImagenesAppNovanet');
	
		SELECT 
			[fiIDUnico], 
			[fiIDCuentaFamiliar], 
			[fiIDCliente], 
			[fcUsuarioAcceso], 
			[fcNombreUsuario], 
			[fcNmbreCorto], 
			[fcTelefono], 
			CASE WHEN [fcURLFotoPersonalizda] != '' 
			THEN CONCAT(@URL,[fcURLFotoPersonalizda])
			ELSE 'https://i.ibb.co/Vm56qDZ/logos.png' 
			END AS NombreArchivo,
			[fiTipodeUsuario]	
			FROM
			[dbo].[ClientesMovil_Logins]
			WHERE  fiIDCuentaFamiliar = @piIDCuentaFamiliar
	END


	GO
	
	CREATE OR ALTER PROC sp_RegistroUsuarioFamiliarAppMovil --'grisaac72@gmail.com', 'Isaac', 'grisaac72@gmail.com', 'Isaac123!',10016
	@pcNombreUsuario	VARCHAR(300),
	@pcUsuarioAcceso	VARCHAR(200),
	@pcPassword			VARCHAR (1000),
	@piIDCliente		INT
	AS
	BEGIN
	BEGIN TRY
	BEGIN TRANSACTION;
		DECLARE @EXISTEUSUARIOPROP INT = (SELECT COUNT(*) FROM [ClientesMovil_Logins] WHERE fcNombreUsuario = @pcNombreUsuario);

		IF  (@EXISTEUSUARIOPROP > 0)
		BEGIN
			ROLLBACK TRANSACTION;
			SELECT 409 CodeStatus, 'Usted ya cuenta con un Usuario'  MessageStatus		
			RETURN;
		END
		
		ELSE 
		BEGIN
			DECLARE @fcPasswordEncrypt				VARCHAR	(150)	=	(CONVERT(VARCHAR(2000), HashBytes('MD5', @pcPassword), 2));

			DECLARE @fiDCuentaFamiliarORFilDCliente VARCHAR	(10)	=	(SELECT	SM.fiIDCliente 	FROM OrionSolicitud_Maestro SM
																		 WHERE fiIDCliente = @piIDCliente);

			INSERT INTO ClientesMovil_Logins
			(fiIDCuentaFamiliar,  fcUsuarioAcceso, fcPassword, fcNombreUsuario, fiTipodeUsuario, fdFechaCreacion,  fcToken, fdFechaPrimerAcceso, fdFechaUltimoAcceso)
			VALUES
			(@fiDCuentaFamiliarORFilDCliente, @pcUsuarioAcceso, @fcPasswordEncrypt,@pcNombreUsuario, 2, GETDATE(),NEWID(), GETDATE(), GETDATE());

			SELECT 200 CodeStatus, 'Registrado con éxito'  MessageStatus		

		 END
		 COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
			SELECT 500 CodeStatus, 'Ha ocurrido un error inesperado'  MessageStatus		
			SELECT ERROR_MESSAGE() ;
		END CATCH
	END

	GO

	--CREATE TABLE dbo.Solicitudes_AdicionProducto_Maestro
--(	
--	fiIDAdicionProduto	INT IDENTITY(1,1),
--	fiIDSolicitud		INT	NOT NULL,
--	fdFechadeCreacion	DATETIME,
--	fdFechadeSolicitud	DATETIME

--	CONSTRAINT PK_Solicitudes_AdicionProducto_Maestro_fiIDAdicionProduto PRIMARY KEY(fiIDAdicionProduto),
--	CONSTRAINT FK_Solicitudes_AdicionProducto_Maestro_fiIDCliente	FOREIGN KEY (fiIDSolicitud) REFERENCES OrionSolicitud_Maestro (fiIDSolicitud)

--);

--GO

--CREATE TABLE dbo.Solicitudes_AdicionProducto_Detalle
--(
--	fiIDAdicionProdutoDetalle	INT IDENTITY(1,1),
--	fiIDAdicionProduto			INT,
--	fiIDProducto				INT,
--	fiCantidad					INT

--	CONSTRAINT PK_Solicitudes_AdicionProducto_Detalle_fiIDAdicionProdutoDetalle PRIMARY KEY(fiIDAdicionProdutoDetalle),
--	CONSTRAINT FK_Solicitudes_AdicionProducto_Detalle_fiIDAdicionProduto		FOREIGN KEY (fiIDAdicionProduto) REFERENCES Solicitudes_AdicionProducto_Maestro (fiIDAdicionProduto),
--	CONSTRAINT FK_Solicitudes_AdicionProducto_Detalle_fiIDProducto				FOREIGN KEY (fiIDProducto) REFERENCES Productos_Maestro (fiIDProducto)
	
--);


CREATE OR ALTER PROC sp_Solicitudes_AdicionProducto_AppMovil
@piIDSolicitud	INT
AS
BEGIN


	SELECT MAS.fiIDAdicionProduto,
		   MAS.fiIDSolicitud,
		   MAS.fdFechadeCreacion,
		   MAS.fdFechadeSolicitud
	FROM Solicitudes_AdicionProducto_Maestro MAS
	WHERE MAS.fiIDSolicitud = @piIDSolicitud;
END

GO

CREATE OR ALTER PROC sp_Solicitudes_AdicionProducto_Detalles --3
@piIDAdicionProduto INT
AS
BEGIN
	DECLARE @URL VARCHAR(150) = (SELECT fcValorLlave FROM Catalogo_Configuraciones WHERE fcNombreLlave = 'URLImagenMovile') + '/';

		   SELECT 
				   DET.fiIDAdicionProdutoDetalle,
				   DET.fiIDAdicionProduto,
				   DET.fiIDProducto,
				   PROD.fcProducto,
				   MARC.fcMarca,
				   CAT.fcTipoProducto,
				   DET.fiCantidad,
				   CASE WHEN fcImagenProducto != '' 
				  THEN CONCAT(@URL, SUBSTRING(fcImagenProducto, LEN(fcImagenProducto) - CHARINDEX('\', REVERSE(fcImagenProducto)) + 2, LEN(fcImagenProducto)))
				   ELSE 'https://i.ibb.co/Vm56qDZ/logos.png' END AS NombreArchivo
				   FROM Solicitudes_AdicionProducto_Detalle  DET
				   INNER JOIN Productos_Maestro			PROD	ON  DET.fiIDProducto		= PROD.fiIDProducto
				   INNER JOIN Catalogo_TipoProducto		CAT		ON	PROD.fiIDTipoProducto	= CAT.fiIDTipoProducto
				   INNER JOIN Catalogo_Marcas			MARC	ON	PROD.fiIDMarca			= MARC.fiIDMarca  
				   WHERE DET.fiIDAdicionProduto = @piIDAdicionProduto
			
END

GO

CREATE OR ALTER PROC sp_SolicitudesAdicionProducto_Insertar_AppMovil --38,'[{"fiIDAdicionProduto":1,"fiIDProducto":1,"fiCantidad":2},{"fiIDAdicionProduto":1,"fiIDProducto":1,"fiCantidad":2}]'
@fiIDSolicitud INT,
@jsondetalles NVARCHAR(MAX)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Declaración de la variable para capturar el nuevo ID
        DECLARE @OutputTbl TABLE (ID INT);
        DECLARE @NewID INT;

        -- Insertar el encabezado
        INSERT INTO Solicitudes_AdicionProducto_Maestro (fiIDSolicitud, fdFechadeCreacion, fdFechadeSolicitud)
         OUTPUT INSERTED.fiIDAdicionProduto INTO @OutputTbl(ID)
        VALUES (@fiIDSolicitud, GETDATE(), GETDATE());

		  -- Obtener el nuevo ID
        SELECT @NewID = ID FROM @OutputTbl;

        -- Tabla temporal para el JSON
        DECLARE @TempSolicitudes TABLE (
            fiIDAdicionProduto INT,
            fiIDProducto INT,
            fiCantidad INT
        );

        -- Insertar JSON en la tabla temporal
        INSERT INTO @TempSolicitudes (fiIDAdicionProduto, fiIDProducto, fiCantidad)
        SELECT fiIDAdicionProduto, fiIDProducto, fiCantidad
        FROM OPENJSON(@jsondetalles)
        WITH (
            fiIDAdicionProduto INT,
            fiIDProducto INT,
            fiCantidad INT
        );

        -- Insertar detalles utilizando el nuevo ID
        INSERT INTO Solicitudes_AdicionProducto_Detalle (fiIDAdicionProduto, fiIDProducto, fiCantidad)
        SELECT @NewID, fiIDProducto, fiCantidad
        FROM @TempSolicitudes;

        -- Confirmar la transacción
        COMMIT TRANSACTION;

        -- Devolver un código de éxito y el nuevo ID
        SELECT 200 AS CodeStatus, 'Transacción exitosa' AS MessageStatus;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertir la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        
        -- Devolver el mensaje de error
        SELECT 500 AS CodeStatus, 'Ha ocurrido un error inesperado' AS MessageStatus, ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO

--comando generar firma de app
--keytool -genkey -v -keystore /key/keystore.jks -keyalg RSA \
--        -keysize 2048 -validity 10000 -alias novanet


--CREATE TABLE ClientesReferidosCreditos(
--fiIDClienteReferido			INT IDENTITY(1,1),
--fcNumeroTelefono			VARCHAR(50),
--fiIDEquifaxClienteReferente	INT NOT NULL,
--fdFechaCreacion				DATE DEFAULT GETDATE(),
--fdFechaVencimiento			DATE
--CONSTRAINT PK_ClientesReferidosCreditos_fiIDClienteReferido PRIMARY KEY(fiIDClienteReferido)
--);

GO

CREATE OR ALTER PROC sp_ClientesReferidosCreditos_Insertar
@pcNombreReferido				NVARCHAR(200),
@pcNumeroTelefono				VARCHAR(50),
@fiIDEquifaxClienteReferente	INT
AS
BEGIN
	BEGIN TRY
	DECLARE @pdFechaVencimiento DATE = (SELECT DATEADD(MONTH, 1, GETDATE()));
	
	IF EXISTS(SELECT * FROM Equifax_Cliente WHERE fcTelefono LIKE '%' + @pcNumeroTelefono + '%')
	BEGIN
		SELECT 409 AS CodeStatus, 'Este número ya esta registrado como cliente' AS MessageStatus;
	END
	ELSE IF EXISTS(SELECT * FROM ClientesReferidosCreditos WHERE fcNumeroTelefono =  @pcNumeroTelefono AND MONTH(fdFechaCreacion) = MONTH(GETDATE()) AND fiIDEquifaxClienteReferente = @fiIDEquifaxClienteReferente)
	BEGIN
		SELECT 409 AS CodeStatus, 'Ya has referido de forma reciente este número' AS MessageStatus;
	END
	ELSE
	BEGIN
	INSERT INTO ClientesReferidosCreditos
	([fcNumeroTelefono], [fcNombreReferido], [fiIDEquifaxClienteReferente],[fdFechaVencimiento])
	VALUES
	(@pcNumeroTelefono, @pcNombreReferido, @fiIDEquifaxClienteReferente, @pdFechaVencimiento)
		SELECT 200 AS CodeStatus, 'Número Referido con Éxito' AS MessageStatus;
	END
	END TRY
	BEGIN CATCH
		SELECT 500 AS CodeStatus, 'Ha ocurrido un error inesperado' AS MessageStatus;
	END CATCH
END

SELECT * FROM ClientesReferidosCreditos