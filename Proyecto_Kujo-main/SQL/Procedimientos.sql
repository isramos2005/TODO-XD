USE db_KujoCenter
GO
-----------------------------------LOGIN---------------------------------------------------

CREATE OR ALTER PROCEDURE acce.UDP_tbUsuarios_LOGIN
@user_NombreUsuario NVARCHAR(100),
@user_Contraseña	NVARCHAR(MAX)
AS
BEGIN

	DECLARE @EncryptedPass NVARCHAR(MAX) = HASHBYTES('SHA2_512', @user_Contraseña)

	SELECT
	user_Id, 
	user_NombreUsuario, 
	T1.empl_Id, 
	T2.empl_Nombres,
	T2.empl_Apellidos,
	user_Admin, 
	role_Id,
	user_Estado
	FROM acce.tbUsuarios T1
	INNER JOIN kujo.tbEmpleados T2
	ON T1.empl_Id = T2.empl_Id
	WHERE user_NombreUsuario	= @user_NombreUsuario
	AND user_Contraseña	= @EncryptedPass
END

GO

CREATE OR ALTER PROCEDURE acce.UDP_Login_CambiarContra
@user_NombreUsuario NVARCHAR(100),
@user_Contraseña	NVARCHAR(MAX)
AS
BEGIN
	DECLARE @EncryptedPass NVARCHAR(MAX) = (SELECT HASHBYTES('SHA2_512',@user_Contraseña))

	UPDATE acce.tbUsuarios
	SET user_Contraseña = @EncryptedPass
	WHERE user_NombreUsuario = @user_NombreUsuario
	AND user_Estado = 1
END

GO


CREATE OR ALTER PROCEDURE acce.UDP_tbPantallasPorRol_MENU 
@user_Id INT
AS
BEGIN
DECLARE @Admin BIT = (	SELECT user_Admin FROM acce.tbUsuarios 
						WHERE user_Id = @user_Id)
IF @Admin = 1
BEGIN
	SELECT DISTINCT pant_Nombre,pant_Identificador,pant_href
	FROM acce.tbPantallasPorRol T1
	INNER JOIN acce.tbPantallas T2
	ON T1.pant_Id = T2.pant_Id
	WHERE pant_Estado = 1
END
ELSE IF @Admin = 0
BEGIN
	SELECT DISTINCT (pant_Nombre),pant_Identificador,pant_href
	FROM acce.tbPantallasPorRol T1
	INNER JOIN acce.tbPantallas T2
	ON T1.pant_Id = T2.pant_Id
	WHERE role_Id = ( SELECT role_Id FROM acce.tbUsuarios 
						WHERE user_Id = @user_Id)
						AND pant_Estado = 1
END
END

GO
-----------------------------------tbUsuarios---------------------------------------------------

CREATE OR ALTER PROCEDURE acce.UDP_tbUsuarios_INDEX
AS
BEGIN
SELECT	user_Id,
		user_NombreUsuario,
		T1.empl_Id,
		nombreEmpleado = CONVERT(VARCHAR,T2.empl_Nombres+' '+T2.empl_ApellIdos),
		user_Admin,
		CASE WHEN user_Admin  = 1 THEN 'SI'
		ELSE 'NO' END AS EsAdmin,
		T1.role_Id,
		CASE WHEN  role_Descripcion is null THEN 'N/A' 
		ELSE role_Descripcion END AS role_Descripcion,
		user_Estado
		FROM acce.tbUsuarios T1
		INNER JOIN kujo.tbEmpleados T2
		ON T1.empl_Id = T2.empl_Id
		LEFT JOIN acce.tbRoles T3
		ON T1.role_Id = T3.role_Id
		WHERE user_Estado = 1 AND empl_Estado = 1
		
END

GO

CREATE OR ALTER PROCEDURE acce.UDP_tbUsuarios_FIND
@user_Id		INT
AS
BEGIN
SELECT	user_Id,
		user_NombreUsuario,
		T1.empl_Id,
		nombreEmpleado = CONVERT(VARCHAR,T2.empl_Nombres+' '+T2.empl_ApellIdos),
		user_Admin,
		CASE WHEN user_Admin  = 1 THEN 'SI'
		ELSE 'NO' END AS EsAdmin,
		T1.role_Id,
		CASE WHEN  role_Descripcion is null THEN 'N/A' 
		ELSE role_Descripcion END AS role_Descripcion,
		(SELECT empl_Nombres+' '+empl_ApellIdos FROM kujo.tbEmpleados 
		WHERE empl_Id IN (SELECT empl_Id FROM acce.tbUsuarios WHERE [user_Id] = [user_UserCrea])) AS empl_Crea,
		[user_FechaCrea],
		(SELECT empl_Nombres+' '+empl_ApellIdos FROM kujo.tbEmpleados 
		WHERE empl_Id IN (SELECT empl_Id FROM acce.tbUsuarios WHERE [user_Id] = [user_UserModifica])) AS empl_Modifica,
		[user_FechaModifica]
		FROM acce.tbUsuarios T1
		INNER JOIN kujo.tbEmpleados T2
		ON T1.empl_Id = T2.empl_Id
		LEFT JOIN acce.tbRoles T3
		ON T1.role_Id = T3.role_Id
		WHERE user_Estado = 1 AND empl_Estado = 1 AND user_Id = @user_Id
		
END


GO


CREATE OR ALTER PROCEDURE acce.UDP_tbUsuarios_INSERT
	@user_NombreUsuario NVARCHAR(100),
	@user_Contraseña NVARCHAR(MAX),
	@empl_Id INT,
	@user_Admin BIT,
	@role_Id INT,
	@user_UserCrea INT
AS
BEGIN
	DECLARE @ClaveEncriptada NVARCHAR(MAX) = HASHBYTES('SHA2_512', @user_Contraseña)

	INSERT INTO acce.tbUsuarios (user_NombreUsuario, user_Contraseña, empl_Id,user_Admin,role_Id, user_UserCrea)
	VALUES (@user_NombreUsuario, @ClaveEncriptada, @empl_Id,@user_Admin,@role_Id, @user_UserCrea)
END

GO
CREATE OR ALTER PROCEDURE acce.UDP_tbUsuarios_DELETE
	@user_Id INT
AS
BEGIN
	UPDATE acce.tbUsuarios
	SET user_Estado = 0
	WHERE [user_Id] = @user_Id
END

GO

CREATE OR ALTER PROCEDURE acce.UDP_tbUsuarios_UPDATE
@user_Id					INT,
@user_Admin					BIT, 
@role_Id					INT, 
@empl_Id					INT, 
@user_UserModifica			INT
AS
BEGIN
	
	UPDATE acce.tbUsuarios
	SET
		user_Admin			=	@user_Admin, 
		role_Id				=	@role_Id, 
		empl_Id				=	@empl_Id, 
		user_UserModifica	=	@user_UserModifica, 
		user_FechaModifica	=	GETDATE()
		WHERE user_Id = @user_Id
END

GO

-----------------------------------tbRoles---------------------------------------------------


CREATE OR ALTER PROCEDURE acce.UDP_tbRoles_INDEX
AS
BEGIN

	SELECT role_Id, role_Descripcion, role_Estado, role_UserCrea, role_FechaCrea, role_UserModifica, role_FechaModifica FROM
	acce.tbRoles WHERE role_Estado = 1
END

GO

CREATE OR ALTER PROCEDURE acce.UDP_tbRoles_FIND 
@role_Id INT
AS
BEGIN

	SELECT	role_Id, 
			role_Descripcion, 
			role_Estado, 
			role_UserCrea,
			(SELECT empl_Nombres+' '+empl_ApellIdos FROM kujo.tbEmpleados 
			WHERE empl_Id IN (SELECT empl_Id FROM acce.tbUsuarios WHERE [user_Id] = role_UserCrea)) AS empl_Crea,
			role_FechaCrea, 
			role_UserModifica,
			(SELECT empl_Nombres+' '+empl_ApellIdos FROM kujo.tbEmpleados 
			WHERE empl_Id IN (SELECT empl_Id FROM acce.tbUsuarios WHERE [user_Id] = role_UserModifica)) AS empl_Modifica,
			role_FechaModifica FROM
	acce.tbRoles
	WHERE role_Id = @role_Id
END


GO

CREATE OR ALTER PROCEDURE acce.UDP_tbRoles_INSERT
@role_Descripcion	NVARCHAR(150),
@role_UserCrea		INT
AS
BEGIN
	INSERT INTO acce.tbRoles
	(role_Descripcion,role_UserCrea)
	VALUES
	(@role_Descripcion,@role_UserCrea)
END


GO


CREATE OR ALTER PROCEDURE acce.UDP_tbRoles_UPDATE
@role_Id			INT,
@role_Descripcion	NVARCHAR(150),
@role_UserModifica	INT
AS
BEGIN
	UPDATE acce.tbRoles
	SET role_Descripcion	= @role_Descripcion,
		role_UserModifica	= @role_UserModifica
		WHERE role_Id=@role_Id
END

GO

CREATE OR ALTER PROCEDURE  acce.UDP_tbRoles_DELETE
@role_Id	INT
AS
BEGIN
	UPDATE acce.tbRoles
	SET role_Estado = 0
		WHERE role_Id=@role_Id
END

GO

-----------------------------------Pantallas Por Rol---------------------------------------------------


CREATE OR ALTER PROCEDURE acce.UDP_tbPantallasPorRol_Check 
@Identificador NVARCHAR(4)
AS
BEGIN
SELECT pant_Id,pant_Nombre FROM acce.tbPantallas
WHERE SUBSTRING(pant_Identificador,0,5)= @Identificador
END

GO

CREATE OR ALTER PROCEDURE acce.UDP_tbPantallasPorRol_Checked 
@role_Id INT
AS
BEGIN
	SELECT Pant_Id FROM acce.tbPantallasPorRol
	WHERE role_Id = @role_Id
END

GO

CREATE OR ALTER PROCEDURE acce.UDP_tbPantallasPorRol_PantallasAgg
@role_Id INT,
@pant_Id INT,
@pantrol_UserCrea INT
AS
BEGIN
	INSERT INTO [acce].[tbPantallasPorRol]
	(role_Id, pant_Id, pantrol_UserCrea)
	VALUES
	(@role_Id,@pant_Id,@pantrol_UserCrea)
END

GO

CREATE OR ALTER PROCEDURE acce.UDP_tbPantallasPorRol_PantallasElim
@role_Id INT,
@pant_Id INT
AS
BEGIN
DELETE FROM  [acce].[tbPantallasPorRol]
WHERE role_Id=@role_Id AND pant_Id=@pant_Id
END
-----------------------------------DDL---------------------------------------------------


GO

CREATE OR ALTER PROCEDURE gral.UDP_tbEstadosCivilesDDL
AS
BEGIN
	SELECT estc_Id,estc_Descripcion FROM gral.tbEstadosCiviles
	WHERE estc_Estado = 1
END

GO

CREATE OR ALTER PROCEDURE kujo.UDP_tbEmpleadosDDL
AS
BEGIN
	SELECT empl_Id,(empl_Nombres+' '+empl_Apellidos)AS nombreEmpleado FROM kujo.tbEmpleados
	WHERE empl_Estado = 1
END

GO


CREATE OR ALTER PROCEDURE gral.UDP_tbDepartamentosDDL
AS
BEGIN
	SELECT dept_Id,dept_Descripcion FROM gral.tbDepartamentos
	WHERE dept_Estado = 1
END

GO

CREATE OR ALTER PROCEDURE gral.UDP_tbMunicipiosDDL
@dept_Id CHAR(2)
AS
BEGIN
	SELECT muni_Id,muni_Descripcion FROM gral.tbMunicipios T1
	INNER JOIN gral.tbDepartamentos T2
	ON T1.dept_Id = T2.dept_Id
	WHERE T1.dept_Id = @dept_Id
END

GO


CREATE OR ALTER PROCEDURE kujo.UDP_tbProveedoresDDL
AS
BEGIN
	SELECT prov_Id,prov_Nombre FROM kujo.tbProveedores
	WHERE prov_Estado = 1
END

GO


CREATE OR ALTER PROCEDURE kujo.UDP_tbCategoriasDDL
AS
BEGIN
	SELECT cate_Id,cate_Descripcion FROM kujo.tbCategorias
	WHERE cate_Estado = 1
END

----------CRUD Producto -------------

GO
CREATE OR ALTER PROCEDURE kujo.UDP_tbProducto_INDEX
AS
BEGIN 

 SELECT prod_Id, 
		prod_Descripcion, 
		T1.cate_Id,
		T2.cate_Descripcion, 
		T1.prov_Id,
		T3.prov_Nombre,
		prod_Stock, 
		prod_Precio, 
		prod_Estado, 
		prod_UserCrea, 
		prod_FechaCreacion, 
		prod_UserModifica, 
		prod_FechaModificacion
 FROM kujo.tbProductos T1
 INNER JOIN kujo.tbCategorias T2
 ON T1.cate_Id = T2.cate_Id
 INNER JOIN kujo.tbProveedores T3
 ON T1.prov_Id = T3.prov_Id
 WHERE prod_Estado = 1 AND T2.cate_Estado = 1
END

GO

CREATE OR ALTER PROCEDURE kujo.UDP_tbProducto_FIND
@prod_Id	INT
AS
BEGIN 

 SELECT prod_Id, 
		prod_Descripcion,
		T1.cate_Id,
		T2.cate_Descripcion, 
		T1.prov_Id,
		T3.prov_Nombre,
		prod_Stock,
		prod_Precio,
		prod_Estado,
		(SELECT empl_Nombres+' '+empl_ApellIdos FROM kujo.tbEmpleados 
		WHERE empl_Id IN (SELECT empl_Id FROM acce.tbUsuarios WHERE [user_Id] = [prod_UserCrea])) AS empl_Crea,
		prod_FechaCreacion, 
		(SELECT empl_Nombres+' '+empl_ApellIdos FROM kujo.tbEmpleados 
		WHERE empl_Id IN (SELECT empl_Id FROM acce.tbUsuarios WHERE [user_Id] = [prod_UserModifica])) AS empl_Modifica,
		prod_FechaModificacion
 FROM kujo.tbProductos T1
 INNER JOIN kujo.tbCategorias T2
 ON T1.cate_Id = T2.cate_Id
 INNER JOIN kujo.tbProveedores T3
 ON T1.prov_Id = T3.prov_Id
 WHERE prod_Estado = 1 AND T2.cate_Estado = 1
 AND prod_Id = @prod_Id
END


GO
CREATE OR ALTER PROCEDURE kujo.UDP_tbProducto_INSERT
@prod_Descripcion   nvarchar(150), 
@cate_Id            INT,
@prov_Id            INT,                    
@prod_Stock         INT,
@prod_Precio        DECIMAL(18,2),      
@prod_UserCrea		INT
AS
BEGIN

	INSERT INTO kujo.tbProductos
				(prod_Descripcion, 
				cate_Id, 
				prov_Id, 
				prod_Stock, 
				prod_Precio, 
				prod_UserCrea)
		 VALUES
				(@prod_Descripcion
				,@cate_Id
				,@prov_Id
				,@prod_Stock
				,@prod_Precio
				,@prod_UserCrea)

END

GO

CREATE OR ALTER PROCEDURE kujo.UDP_tbProducto_UPDATE
@prod_Id				INT, 
@prod_Descripcion       NVARCHAR(150), 
@cate_Id                 INT ,
@prov_Id                INT,                    
@prod_Stock             INT,
@prod_Precio            decimal(18,2),      
@prod_UserModifica	    INT
AS
BEGIN

	UPDATE kujo.tbProductos
	   SET prod_Descripcion		= @prod_Descripcion
		  ,cate_Id				= @cate_ID
		  ,prov_ID				= @prov_ID
		  ,prod_Stock			= @prod_Stock
		  ,prod_Precio			= @prod_Precio
		  ,prod_UserModifica	= @prod_UserModifica
		  ,prod_FechaModificacion = GETDATE()
	 WHERE prod_Id = @prod_Id

END 

GO

CREATE OR ALTER PROCEDURE kujo.UDP_tbProducto_DELETE
 @prod_ID               INT
AS
BEGIN

	UPDATE   kujo.tbProductos
	   SET   prod_Estado = 0
	 WHERE   prod_ID = @prod_ID	
END 

GO


--************************************************************--
--*********** PROCEDIMIENTOS TABLA  CLIENTES *****************--


--******** PROCEDIMIENTO INDEX CLIENTES ***********--

CREATE OR ALTER PROCEDURE kujo.UDP_tbClientes_INDEX
AS
BEGIN
	SELECT	clie_Id, 
			clie_Nombres, 
			clie_ApellIdos,
			NombreCliente = CAST(clie_Nombres+' '+clie_ApellIdos AS VARCHAR (150)), 
			clie_FechaNacimiento,
			clie_Sexo,
			CASE WHEN clie_Sexo = 'M' THEN 'Masculino'
			ELSE 'Femenino' END AS clieSexo, 
			T1.estc_Id,
			T4.estc_Descripcion,
			clie_Telefeno,
			T2.dept_Id,
			T3.dept_Descripcion,
			T1.muni_Id,
			T2.muni_Descripcion,
			clie_Direccion, 
			clie_UserCrea, 
			clie_FechaCreacion, 
			clie_UserModifica, 
			clie_FechaModificacion, 
			clie_Estado
	FROM kujo.tbClientes T1
	INNER JOIN gral.tbMunicipios T2
	ON T1.muni_Id = T2.muni_Id
	INNER JOIN gral.tbDepartamentos T3
	ON T2.dept_Id = T3.dept_Id
	INNER JOIN gral.tbEstadosCiviles T4
	ON T1.estc_Id = T4.estc_Id
	WHERE clie_Estado = 1;
END

GO



--******** PROCEDIMIENTO FIND CLIENTES ***********--

CREATE OR ALTER PROCEDURE kujo.UDP_tbClientes_FIND 
@clie_Id INT
AS
BEGIN
	SELECT	clie_Id, 
			clie_Nombres, 
			clie_ApellIdos, 
			clie_FechaNacimiento,
			clie_Sexo,
			CASE WHEN clie_Sexo = 'M' THEN 'Masculino'
			ELSE 'Femenino' END AS clieSexo, 
			T1.estc_Id,
			T4.estc_Descripcion,
			clie_Telefeno,
			T2.dept_Id,
			T3.dept_Descripcion,
			T1.muni_Id,
			T2.muni_Descripcion,
			clie_Direccion, 
			clie_UserCrea,
			(SELECT empl_Nombres+' '+empl_ApellIdos FROM kujo.tbEmpleados 
		WHERE empl_Id IN (SELECT empl_Id FROM acce.tbUsuarios WHERE [user_Id] = clie_UserCrea)) AS empl_Crea,
			clie_FechaCreacion, 
			clie_UserModifica,
			(SELECT empl_Nombres+' '+empl_ApellIdos FROM kujo.tbEmpleados 
		WHERE empl_Id IN (SELECT empl_Id FROM acce.tbUsuarios WHERE [user_Id] = clie_UserModifica)) AS empl_Modifica,
			clie_FechaModificacion, 
			clie_Estado
	FROM kujo.tbClientes T1
	INNER JOIN gral.tbMunicipios T2
	ON T1.muni_Id = T2.muni_Id
	INNER JOIN gral.tbDepartamentos T3
	ON T2.dept_Id = T3.dept_Id
	INNER JOIN gral.tbEstadosCiviles T4
	ON T1.estc_Id = T4.estc_Id
	WHERE clie_Estado = 1
	AND clie_Id = @clie_Id
END

--******** PROCEDIMIENTO INSERTAR CLIENTES ***********--
GO
CREATE OR ALTER PROCEDURE kujo.UDP_tbClientes_INSERT
(@clie_Nombres				NVARCHAR(200),  
 @clie_Apellidos			NVARCHAR(200),
 @clie_FechaNacimiento		DATE,   
 @clie_Sexo					CHAR(1),
 @estc_Id					INT,			  
 @clie_Telefeno				NVARCHAR(20),
 @muni_Id					CHAR(4),			  
 @clie_Direccion			NVARCHAR(200),		      
 @clie_UserCrea				INT)
AS
BEGIN

	INSERT INTO kujo.tbClientes
			(clie_Nombres, 
			clie_ApellIdos, 
			clie_FechaNacimiento, 
			clie_Sexo, 
			estc_Id, 
			clie_Telefeno, 
			muni_Id, 
			clie_Direccion, 
			clie_UserCrea
			)
	VALUES (@clie_Nombres,
			@clie_Apellidos,
			@clie_FechaNacimiento,
			@clie_Sexo,
			@estc_Id,
			@clie_Telefeno,
			@muni_Id,
			@clie_Direccion,
			@clie_UserCrea
			)
           
END


--******** PROCEDIMIENTO EDITAR CLIENTES ***********--
GO
CREATE OR ALTER PROCEDURE kujo.UDP_tbClientes_UPDATE
(@clie_Id					INT,
 @clie_Nombres				NVARCHAR(200),  
 @clie_Apellidos			NVARCHAR(200),
 @clie_FechaNacimiento		DATE,   
 @clie_Sexo					CHAR(1),
 @estc_Id					INT,			  
 @clie_Telefeno				NVARCHAR(20),
 @muni_Id					CHAR(4),			  
 @clie_Direccion			NVARCHAR(200),		      
 @clie_UserModifica			INT)
AS
BEGIN

	UPDATE	kujo.tbClientes
	SET		clie_Nombres			= @clie_Nombres, 
			clie_ApellIdos			= @clie_Apellidos, 
			clie_FechaNacimiento	= @clie_FechaNacimiento, 
			clie_Sexo				= @clie_Sexo, 
			estc_Id					= @estc_Id, 
			clie_Telefeno			= @clie_Telefeno, 
			muni_Id					= @muni_Id, 
			clie_Direccion			= @clie_Direccion, 
			clie_UserModifica		= @clie_UserModifica, 
			clie_FechaModificacion	=  GETDATE()
	WHERE	clie_Id = @clie_Id


END

--******** PROCEDIMIENTO ELIMINAR CLIENTES ***********--
GO
CREATE OR ALTER PROCEDURE kujo.UDP_tbClientes_DELETE
(@clie_Id INT)
AS
BEGIN

	UPDATE	kujo.tbClientes
	SET		clie_Estado = 0
	WHERE	clie_Id		= @clie_Id

END


GO


----------CRUD Facturas-------------


CREATE OR ALTER PROCEDURE kujo.UDP_TbFactura_FIND
@fact_Id INT
AS
BEGIN
SELECT	fact_Id, 
		t1.clie_Id,
		NombreCliente = CAST(clie_Nombres+' '+clie_ApellIdos AS VARCHAR (150)), 
		t1.empl_Id,
		NombreEmpleado = CAST (empl_Nombres+' '+empl_ApellIdos AS VARCHAR(150)), 
		fact_fechacompra, 
		fact_UserCrea,
		(SELECT empl_Nombres+' '+empl_ApellIdos FROM kujo.tbEmpleados 
		WHERE empl_Id IN (SELECT empl_Id FROM acce.tbUsuarios WHERE [user_Id] = [fact_UserCrea])) AS empl_Crea,
		fact_FechaCreacion, 
		fact_UserModifica,
		(SELECT empl_Nombres+' '+empl_ApellIdos FROM kujo.tbEmpleados 
		WHERE empl_Id IN (SELECT empl_Id FROM acce.tbUsuarios WHERE [user_Id] = [fact_UserModifica])) AS empl_Modifica,
		fact_FechaModificacion, 
		fact_Estado
		FROM kujo.[TbFacturas] t1 INNER JOIN kujo.TbClientes  t2
		ON T1.clie_Id = t2.clie_Id
		INNER JOIN kujo.TbEmpleados T3
		ON t1.empl_Id = T3.empl_Id
		WHERE fact_Estado = 1 AND fact_Id = @fact_Id
END

GO


CREATE OR ALTER PROCEDURE kujo.UDP_TbFacturas_INSERT
@clie_Id			INT, 
@empl_Id			INT,
@fact_UserCrea		INT
AS
BEGIN
	INSERT INTO [kujo].[TbFacturas]
	(clie_Id, empl_Id, fact_fechacompra, fact_UserCrea)
	VALUES
	(@clie_Id,@empl_Id,GETDATE(),@fact_UserCrea)

	DECLARE @id INT= (SELECT CAST(IDENT_CURRENT('kujo.tbFacturas')AS INT) AS IdNueva)
	
	EXEC  kujo.UDP_TbFactura_FIND @id
END

GO

CREATE OR ALTER PROCEDURE kujo.UDP_TbFacturas_UPDATE
@fact_Id				INT,
@clie_Id				INT, 
@empl_Id				INT,
@fact_UserModifica		INT
AS
BEGIN
	UPDATE [kujo].[TbFacturas]
	SET
		clie_Id					=	@clie_Id,
		empl_Id					=	@empl_Id, 
		fact_UserModifica		=	@fact_UserModifica, 
		fact_FechaModificacion	=	GETDATE()
		WHERE fact_Id = @fact_Id
END

GO

CREATE OR ALTER PROCEDURE kujo.UDP_TbFacturas_DELETE
@fact_Id	INT
AS
BEGIN
	UPDATE [kujo].[TbFacturas]
	SET
		fact_Estado	= 0
		WHERE fact_Id = @fact_Id

END


GO


CREATE OR ALTER PROCEDURE kujo.UDP_TbFactura_INDEX 
AS
BEGIN
SELECT	fact_Id, 
		t1.clie_Id,
		NombreCliente = CAST(clie_Nombres+' '+clie_ApellIdos AS VARCHAR (150)), 
		t1.empl_Id,NombreEmpleado = CAST (empl_Nombres+' '+empl_ApellIdos AS VARCHAR(150)), 
		fact_fechacompra, 
		fact_UserCrea, 
		fact_FechaCreacion, 
		fact_UserModifica, 
		fact_FechaModificacion, 
		fact_Estado
		FROM kujo.[TbFacturas] t1 INNER JOIN kujo.TbClientes  t2
		ON T1.clie_Id = t2.clie_Id
		INNER JOIN kujo.TbEmpleados T3
		ON t1.empl_Id = T3.empl_Id
		WHERE fact_Estado = 1 
END
GO
--******** PROCEDIMIENTOS FACTURA DETALLE ***********--


CREATE OR ALTER PROCEDURE kujo.UDP_tbFacturadetalles_Load 
@fact_Id INT
AS
BEGIN
IF @fact_Id != 0
BEGIN
	SELECT	facd_Id, 
			t2.prod_Descripcion, 
			facd_PrecioUnitario, 
			prod_Cantidad
	FROM kujo.TbFacturasDetalles t1 INNER JOIN kujo.TbProductos t2
	ON  t1.prod_Id = t2.prod_Id
	WHERE fact_Id = @fact_Id AND facd_Estado = 1
END
ELSE 
BEGIN 
	SELECT	facd_Id = 0, 
			prod_Descripcion = ' ', 
			facd_PrecioUnitario = 0, 
			prod_Cantidad=0
END
END

GO

CREATE OR ALTER PROCEDURE kujo.UDP_TbFacturasDetalles_INSERT
(@fact_Id						INT,			
 @prod_Id						INT, 
 @facd_PrecioUnitario			DECIMAL(18,2),
 @facd_Cantidad					INT,
 @facd_UserCrea					INT)
AS 
BEGIN
	
	INSERT INTO [kujo].[TbFacturasDetalles] (fact_Id, prod_Id, facd_PrecioUnitario, prod_Cantidad, facd_UserCrea)
	VALUES (@fact_Id,
			@prod_Id,
			@facd_PrecioUnitario,
			@facd_Cantidad,
			@facd_UserCrea
			);

END

GO

CREATE OR ALTER PROCEDURE kujo.UDP_TbFacturasDetalles_DELETE
(@facd_Id INT)
AS
BEGIN

	UPDATE	[kujo].[TbFacturasDetalles]
	SET		facd_Estado = 0
	WHERE	facd_Id = @facd_Id

END

GO


CREATE OR ALTER PROCEDURE kujo.UDP_TbDetalles_Factura 
@fact_Id INT
AS
BEGIN
IF @fact_Id != 0
BEGIN
SELECT	SubTotal = (SUM(facd_PrecioUnitario*prod_Cantidad)),
		IVA = CAST((SUM(facd_PrecioUnitario*prod_Cantidad))*0.15 AS DECIMAL (18,2)), 
		Total =((SUM(facd_PrecioUnitario*prod_Cantidad))+(SUM(facd_PrecioUnitario*prod_Cantidad))*0.15)  
FROM kujo.TbFacturasDetalles
WHERE facd_Estado = 1 AND fact_Id = @fact_Id
END
ELSE
BEGIN
SELECT	SubTotal =	0,
		IVA =		0,
		Total =		0  
END
END

--******** PROCEDIMIENTO REPORTE ***********--


GO

CREATE OR ALTER PROCEDURE kujo.UPD_tbFacturas_Reporte 
AS
BEGIN
	SELECT	DISTINCT Fecha = FORMAT(facd_FechaCreacion, 'd', 'es-HN'),
			SubTotal_Dia = (SUM(facd_PrecioUnitario*prod_Cantidad)),
			IVA_Dia = CAST((SUM(facd_PrecioUnitario*prod_Cantidad))*0.15 AS DECIMAL (18,2)), 
			Total_Dia =((SUM(facd_PrecioUnitario*prod_Cantidad))+(SUM(facd_PrecioUnitario*prod_Cantidad))*0.15)  
			FROM kujo.tbFacturasDetalles
			GROUP BY FORMAT( facd_FechaCreacion, 'd', 'es-HN')
END

GO

CREATE OR ALTER TRIGGER kujo.TRG_TbFacturasDetalles_Stock_Resta
   ON  kujo.[TbFacturasDetalles]
   AFTER INSERT
AS 
BEGIN
 
 DECLARE @prod_Id INT;
 DECLARE @prod_Cantidad INT;
 SELECT @prod_Id = [prod_Id], @prod_Cantidad = prod_Cantidad
 FROM INSERTED

 	SET NOCOUNT ON;

	UPDATE kujo.TbProductos
	SET
	prod_Stock = prod_Stock - @prod_Cantidad
	WHERE prod_Id = @prod_Id

END

GO

CREATE OR ALTER TRIGGER kujo.TRG_TbFacturasDetalles_Stock_Suma
   ON  kujo.[TbFacturasDetalles]
   AFTER UPDATE
AS 
BEGIN
 
 DECLARE @prod_Id INT;
 DECLARE @prod_Cantidad INT;
 SELECT @prod_Id = [prod_Id], @prod_Cantidad = prod_Cantidad
 FROM INSERTED

 	SET NOCOUNT ON;

	UPDATE kujo.TbProductos
	SET
	prod_Stock = prod_Stock + @prod_Cantidad
	WHERE prod_Id = @prod_Id

END

GO

CREATE OR ALTER PROCEDURE kujo.UPD_tbFacturas_FacturasPorEmpleado
AS
BEGIN
DECLARE @facturas INT = (SELECT  COUNT(fact_Id) FROM kujo.tbFacturas)
			
SELECT	TOP 3 nombreEmpleado =(T2.empl_Nombres+' '+T2.empl_ApellIdos),
		FacturasTotales=COUNT(T1.empl_Id),
		FacturasPorcentaje=(CONVERT(DECIMAL(18,2),COUNT(T1.empl_Id)*100)/@facturas)
		FROM kujo.tbFacturas T1
		INNER JOIN kujo.tbEmpleados T2
		ON T1.empl_Id = T2.empl_Id
		GROUP BY T1.empl_Id,(T2.empl_Nombres+' '+T2.empl_ApellIdos)
END

	


GO
--EXEC acce.UDP_TbUsuarios_INSERT 'Raiden','Eternity',1,1,0,1
--EXEC acce.UDP_TbUsuarios_INSERT 'Amaterasu','Eternity',2,0,3,1

--EXEC kujo.UDP_TbFacturas_INSERT 1,2,1
--EXEC kujo.UDP_TbFacturas_INSERT 2,3,1
--EXEC kujo.UDP_TbFacturas_INSERT 4,1,1


--EXEC kujo.UDP_TbFacturasDetalles_INSERT	1,1,1000,10,1
--EXEC kujo.UDP_TbFacturasDetalles_INSERT	2,4,1000,5,1
--EXEC kujo.UDP_TbFacturasDetalles_INSERT	3,5,1000,67,1
