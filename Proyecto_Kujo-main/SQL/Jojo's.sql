CREATE DATABASE db_KujoCenter
GO
USE db_KujoCenter
GO
CREATE SCHEMA gral	
GO
CREATE SCHEMA acce	
GO
CREATE SCHEMA kujo	
GO

 -------------------------------------ESQUEMA ACCESS-----------------------------------
 
 ---------------------------------------tbPantallas------------------------------------

 CREATE TABLE acce.tbPantallas(
 pant_Id				INT IDENTITY(1,1),
 pant_Nombre			NVARCHAR(150)	NOT NULL,
 pant_Identificador		CHAR(8)			NOT NULL,
 pant_href				NVARCHAR(70)	NOT NULL,
 pant_Estado			BIT DEFAULT 1,
 pant_UserCrea			INT				NOT NULL,
 pant_FechaCrea			DATETIME DEFAULT GETDATE(),
 pant_UserModifica		INT,
 pant_FechaModifica	DATETIME
 CONSTRAINT PK_acce_tbPantallas_pant_Id PRIMARY KEY(pant_Id),
 CONSTRAINT UQ_acce_tbPantallas_pant_Nombre UNIQUE (pant_Nombre),
 CONSTRAINT UQ_acce_tbPantallas_pant_Identificador UNIQUE (pant_Identificador),
 CONSTRAINT UQ_acce_tbPantallas_pant_href UNIQUE (pant_href)
 );

 GO

 
INSERT INTO [acce].[tbPantallas]
			(pant_Nombre, pant_Identificador, pant_href, pant_UserCrea)
			VALUES
			('Usuarios','acceuser','/Usuarios/Listado',1),
			('Roles','accerole','/Roles/Listado',1),
			('Reportes','kujorepo','/Reportes',1),
			('Clientes','kujoclie','/Clientes/Listado',1),
			('Productos','kujoprod','/Productos/Listado',1),
			('Facturación','kujofact','/Facturas/Listado',1)

GO
 ---------------------------------------tbRoles------------------------------------

 CREATE TABLE acce.tbRoles(
 role_Id				INT IDENTITY(1,1),
 role_Descripcion		VARCHAR(150)	NOT NULL,
 role_Estado			BIT DEFAULT 1,
 role_UserCrea			INT				NOT NULL,
 role_FechaCrea			DATETIME DEFAULT GETDATE(),
 role_UserModifica		INT,
 role_FechaModifica		DATETIME
 CONSTRAINT PK_acce_tbRoles_role_Id PRIMARY KEY(role_Id),
 CONSTRAINT UQ_role_tbRoles_role_Descripcion UNIQUE(role_Descripcion)
 );

 GO

INSERT INTO [acce].[tbRoles]
	([role_Descripcion],[role_UserCrea])
	VALUES
	('Administrador de Seguridad',1),
	('Cajero',1),
	('Gerente',1)


 GO

 -------------------------------------tbPantallasPorRol------------------------------

 CREATE TABLE acce.tbPantallasPorRol(
 pantrol_Id				INT IDENTITY(1,1),
 role_Id				INT				NOT NULL,
 pant_Id				INT				NOT NULL,
 pantrol_Estado			BIT DEFAULT 1,
 pantrol_UserCrea		INT				NOT NULL,
 pantrol_FechaCrea		DATETIME DEFAULT GETDATE(),
 pantrol_UserModifica	INT,
 pantrol_FechaModifica	DATETIME,
 CONSTRAINT PK_acce_tbPantallasPorRol_pantrol_Id PRIMARY KEY(pantrol_Id),
 CONSTRAINT FK_acce_tbPantallasPorRol_tbRoles_role_Id FOREIGN KEY (role_Id) REFERENCES acce.tbRoles(role_Id),
 CONSTRAINT FK_acce_tbPantallasPorRol_tbPantallas_pant_Id FOREIGN KEY (pant_Id) REFERENCES acce.tbPantallas(pant_Id),
 );

 
GO
INSERT INTO [acce].[tbPantallasPorRol]
			(role_Id, pant_Id,pantrol_UserCrea)
			VALUES
			(1,1,1),
			(1,2,1),
			(2,4,1),
			(2,5,1),
			(3,3,1),
			(3,4,1),
			(3,5,1),
			(2,6,1)

 GO
 
 
 ---------------------------------------tbUsuarios-------------------------------------

 CREATE TABLE acce.tbUsuarios(
 user_Id				INT IDENTITY(1,1),
 user_NombreUsuario		NVARCHAR(200)	NOT NULL,
 empl_Id				INT				NOT NULL,	
 user_Contraseña		NVARCHAR(150)	NOT NULL,
 user_Admin				BIT				NOT NULL,
 role_Id				INT,
 user_Estado			BIT DEFAULT 1,
 user_UserCrea			INT				NOT NULL,
 user_FechaCrea			DATETIME DEFAULT GETDATE(),
 user_UserModifica		INT,
 user_FechaModifica		DATETIME
 CONSTRAINT PK_acce_tbUsuarios_user_Id PRIMARY KEY ([user_Id]),
 CONSTRAINT UQ_acce_tbUsuarios_user_NombreUsuario UNIQUE (user_NombreUsuario)
 );

 GO

	DECLARE @User NVARCHAR(100) = 'Admin'
	DECLARE @password NVARCHAR(MAX)=(SELECT HASHBYTES('Sha2_512', 'Admin123'));
	
	INSERT INTO acce.TbUsuarios (user_NombreUsuario, user_Contraseña,empl_Id,role_Id, user_Admin, user_UserCrea, user_Estado)
	VALUES	(@User,@password,1,null,1,1,1)

 GO

 -------------------------------------ESQUEMA GENERAL----------------------------------

 -------------------------------------tbDepartamentos----------------------------------
 CREATE TABLE gral.tbDepartamentos(
 dept_Id			CHAR(2),
 dept_Descripcion	NVARCHAR(200)	NOT NULL,
 dept_Estado		BIT DEFAULT 1,
 dept_UserCrea		INT				NOT NULL,
 dept_FechaCrea		DATETIME DEFAULT GETDATE(),
 dept_UserModifica	INT,
 dept_FechaModifica	DATETIME
 CONSTRAINT PK_gral_tbDepartamentos_dept_Id PRIMARY KEY(dept_Id),
 CONSTRAINT UQ_gral_tbDepartamentos_dept_Descripcion UNIQUE(dept_Descripcion)
 );

 GO


INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'01', N'AtlántIda', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'02', N'Colón', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'03', N'Comayagua', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'04', N'Copán', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'05', N'Cortés', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'06', N'Choluteca', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'07', N'El Paraíso', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'08', N'Francisco Morazán', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'09', N'Gracias a Dios', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'10', N'Intibucá', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'11', N'Islas de la Bahía', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'12', N'La Paz', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'13', N'Lempira', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'14', N'Ocotepeque', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'15', N'Olancho', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'16', N'Santa Bárbara', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'17', N'Valle', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))
INSERT [gral].[tbDepartamentos] ([dept_Id], [dept_Descripcion], [dept_Estado], [dept_UserCrea], [dept_FechaCrea], [dept_UserModifica], [dept_FechaModifica]) VALUES (N'18', N'Yoro', 1, 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.657' AS DateTime))


 GO
 -------------------------------------tbMunicipios------------------------------------

 CREATE TABLE gral.tbMunicipios(
 muni_Id			CHAR(4),
 dept_Id			CHAR(2)			NOT NULL,
 muni_Descripcion	NVARCHAR(200)	NOT NULL,
 muni_Estado		BIT DEFAULT 1,
 muni_UserCrea		INT				NOT NULL,
 muni_FechaCrea		DATETIME DEFAULT GETDATE(),
 muni_UserModifica	INT,
 muni_FechaModifica	DATETIME
 CONSTRAINT PK_gral_tbMunicipios_muni_Id PRIMARY KEY(muni_Id),
 CONSTRAINT FK_gral_tbMunicipios_dept_Id FOREIGN KEY (dept_Id) REFERENCES gral.tbDepartamentos (dept_Id)
 );
 

 GO

INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'01', N'0101', N'La Ceiba', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'01', N'0102', N'El Porvenir', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'01', N'0103', N'Tela', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'01', N'0104', N'Jutiapa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'01', N'0105', N'La Masica', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'01', N'0106', N'San Francisco', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'01', N'0107', N'Arizona', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'01', N'0108', N'Esparta', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'02', N'0201', N'Trujillo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'02', N'0202', N'Balfate', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'02', N'0203', N'Iriona', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'02', N'0204', N'Limón', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'02', N'0205', N'Sabá', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'02', N'0206', N'Santa Fe', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'02', N'0207', N'Santa Rosa de Aguán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'02', N'0208', N'Sonaguera', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'02', N'0209', N'Tocoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'02', N'0210', N'Bonito Oriental', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0301', N'Comayagua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0302', N'Ajuterique', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0303', N'El Rosario', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0304', N'Esquías', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0305', N'Humuya', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0306', N'La Libertad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0307', N'Lamaní', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0308', N'La TrinIdad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0309', N'Lejamaní', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0310', N'Meámbar', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0311', N'Minas de Oro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0312', N'Ojos de Agua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0313', N'San Jerónimo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0314', N'San José de Comayagua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0315', N'San José del Potrero', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0316', N'San Luis', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0317', N'San Sebastián', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0318', N'Siguatepeque', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0319', N'Villa de San Antonio', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0320', N'Las Lajas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'03', N'0321', N'Taulabé', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0401', N'Santa Rosa de Copán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0402', N'Cabañas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0403', N'Concepción', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0404', N'Copán Ruinas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0405', N'Corquín', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0406', N'Cucuyagua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0407', N'Dolores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0408', N'Dulce Nombre', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0409', N'El Paraíso', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0410', N'FlorIda', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0411', N'La Jigua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0412', N'La Unión', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0413', N'Nueva Arcadia', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0414', N'San Agustín', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0415', N'San Antonio', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
GO
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0416', N'San Jerónimo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0417', N'San José', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0418', N'San Juan de Opoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0419', N'San Nicolás', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0420', N'San Pedro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0421', N'Santa Rita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0422', N'TrinIdad de Copán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'04', N'0423', N'Veracruz', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0501', N'San Pedro Sula', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0502', N'Choloma', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0503', N'Omoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0504', N'Pimienta', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0505', N'Potrerillos', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0506', N'Puerto Cortés', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0507', N'San Antonio de Cortés', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0508', N'San Francisco de Yojoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0509', N'San Manuel', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0510', N'Santa Cruz de Yojoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0511', N'Villanueva', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'05', N'0512', N'La Lima', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0601', N'Choluteca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0602', N'Apacilagua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0603', N'Concepción de María', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0604', N'Duyure', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0605', N'El Corpus', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0606', N'El Triunfo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0607', N'Marcovia', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0608', N'Morolica', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0609', N'Namasigüe', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0610', N'Orocuina', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0611', N'Pespire', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0612', N'San Antonio de Flores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0613', N'San IsIdro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0614', N'San José', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0615', N'San Marcos de Colón', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'06', N'0616', N'Santa Ana de Yusguare', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0701', N'Yuscarán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0702', N'Alauca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0703', N'Danlí', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0704', N'El Paraíso', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0705', N'Güinope', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0706', N'Jacaleapa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0707', N'Liure', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0708', N'Morocelí', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0709', N'Oropolí', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0710', N'Potrerillos', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
GO
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0711', N'San Antonio de Flores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0712', N'San Lucas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0713', N'San Matías', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0714', N'Soledad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0715', N'Teupasenti', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0716', N'Texiguat', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0717', N'Vado Ancho', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0718', N'Yauyupe', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'07', N'0719', N'Trojes', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0801', N'Distrito Central', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0802', N'Alubarén', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0803', N'Cedros', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0804', N'Curarén', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0805', N'El Porvenir', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0806', N'Guaimaca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0807', N'La Libertad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0808', N'La Venta', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0809', N'Lepaterique', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0810', N'Maraita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0811', N'Marale', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0812', N'Nueva Armenia', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0813', N'Ojojona', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0814', N'Orica', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0815', N'Reitoca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0816', N'Sabanagrande', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0817', N'San Antonio de Oriente', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0818', N'San Buenaventura', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0819', N'San Ignacio', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0820', N'San Juan de Flores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0821', N'San Miguelito', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0822', N'Santa Ana', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0823', N'Santa Lucía', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0824', N'Talanga', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0825', N'Tatumbla', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0826', N'Valle de Ángeles', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0827', N'Villa de San Francisco', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'08', N'0828', N'Vallecillo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'09', N'0901', N'Puerto Lempira', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'09', N'0902', N'Brus Laguna', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'09', N'0903', N'Ahuas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'09', N'0904', N'Juan Francisco Bulnes', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'09', N'0905', N'Ramón Villeda Morales', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'09', N'0906', N'Wampusirpe', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1001', N'La Esperanza', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1002', N'Camasca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1003', N'Colomoncagua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1004', N'Concepción', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1005', N'Dolores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1006', N'Intibucá', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1007', N'Jesús de Otoro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1008', N'Magdalena', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1009', N'Masaguara', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1010', N'San Antonio', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1011', N'San IsIdro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1012', N'San Juan', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1013', N'San Marcos de la Sierra', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1014', N'San Miguel Guancapla', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1015', N'Santa Lucía', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1016', N'Yamaranguila', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'10', N'1017', N'San Francisco de Opalaca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'11', N'1101', N'Roatán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'11', N'1102', N'Guanaja', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'11', N'1103', N'José Santos Guardiola', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'11', N'1104', N'Utila', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1201', N'La Paz', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1202', N'Aguanqueterique', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1203', N'Cabañas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1204', N'Cane', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1205', N'Chinacla', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1206', N'Guajiquiro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1207', N'Lauterique', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1208', N'Marcala', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1209', N'Mercedes de Oriente', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1210', N'Opatoro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1211', N'San Antonio del Norte', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1212', N'San José', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1213', N'San Juan', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1214', N'San Pedro de Tutule', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1215', N'Santa Ana', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1216', N'Santa Elena', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1217', N'Santa María', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1218', N'Santiago de Puringla', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'12', N'1219', N'Yarula', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1301', N'Gracias', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1302', N'Belén', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1303', N'Candelaria', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1304', N'Cololaca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1305', N'Erandique', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1306', N'Gualcince', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1307', N'Guarita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1308', N'La Campa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1309', N'La Iguala', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1310', N'Las Flores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1311', N'La Unión', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1312', N'La Virtud', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1313', N'Lepaera', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1314', N'Mapulaca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1315', N'Piraera', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1316', N'San Andrés', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1317', N'San Francisco', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
GO
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1318', N'San Juan Guarita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1319', N'San Manuel Colohete', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1320', N'San Rafael', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1321', N'San Sebastián', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1322', N'Santa Cruz', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1323', N'Talgua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1324', N'Tambla', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1325', N'Tomalá', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1326', N'ValladolId', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1327', N'Virginia', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'13', N'1328', N'San Marcos de Caiquín', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1401', N'Ocotepeque', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1402', N'Belén Gualcho', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1403', N'Concepción', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1404', N'Dolores Merendón', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1405', N'FraternIdad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1406', N'La Encarnación', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1407', N'La Labor', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1408', N'Lucerna', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1409', N'Mercedes', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1410', N'San Fernando', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1411', N'San Francisco del Valle', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1412', N'San Jorge', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1413', N'San Marcos', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1414', N'Santa Fe', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1415', N'Sensenti', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'14', N'1416', N'Sinuapa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1501', N'Juticalpa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1502', N'Campamento', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1503', N'Catacamas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1504', N'Concordia', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1505', N'Dulce Nombre de Culmí', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1506', N'El Rosario', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1507', N'Esquipulas del Norte', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1508', N'Gualaco', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1509', N'Guarizama', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1510', N'Guata', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1511', N'Guayape', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1512', N'Jano', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1513', N'La Unión', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1514', N'Mangulile', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1515', N'Manto', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1516', N'Salamá', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1517', N'San Esteban', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1518', N'San Francisco de Becerra', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1519', N'San Francisco de la Paz', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1520', N'Santa María del Real', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1521', N'Silca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1522', N'Yocón', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'15', N'1523', N'Patuca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1601', N'Santa Bárbara', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1602', N'Arada', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1603', N'Atima', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1604', N'Azacualpa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1605', N'Ceguaca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1606', N'Concepción del Norte', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1607', N'Concepción del Sur', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1608', N'Chinda', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1609', N'El Níspero', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1610', N'Gualala', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1611', N'Ilama', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1612', N'Las Vegas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1613', N'Macuelizo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1614', N'Naranjito', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1615', N'Nuevo Celilac', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1616', N'Nueva Frontera', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1617', N'Petoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1618', N'Protección', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1619', N'Quimistán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1620', N'San Francisco de Ojuera', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1621', N'San José de las Colinas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1622', N'San Luis', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1623', N'San Marcos', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1624', N'San Nicolás', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1625', N'San Pedro Zacapa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1626', N'San Vicente Centenario', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1627', N'Santa Rita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'16', N'1628', N'TrinIdad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'17', N'1701', N'Nacaome', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'17', N'1702', N'Alianza', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'17', N'1703', N'Amapala', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'17', N'1704', N'Aramecina', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'17', N'1705', N'CarIdad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'17', N'1706', N'Goascorán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'17', N'1707', N'Langue', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'17', N'1708', N'San Francisco de Coray', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'17', N'1709', N'San Lorenzo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'18', N'1801', N'Yoro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'18', N'1802', N'Arenal', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'18', N'1803', N'El Negrito', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'18', N'1804', N'El Progreso', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'18', N'1805', N'Jocón', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'18', N'1806', N'Morazán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'18', N'1807', N'Olanchito', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'18', N'1808', N'Santa Rita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'18', N'1809', N'Sulaco', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'18', N'1810', N'Victoria', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([dept_Id], [muni_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'18', N'1811', N'Yorito', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))

 GO
 -------------------------------------tbEstadosCiviles---------------------------------

 CREATE TABLE gral.tbEstadosCiviles(
 estc_Id			INT IDENTITY(1,1),
 estc_Descripcion	NVARCHAR(100)			NOT NULL,
 estc_Estado		BIT DEFAULT 1,
 estc_UserCrea		INT						NOT NULL,
 estc_FechaCrea		DATETIME DEFAULT GETDATE(),
 estc_UserModifica	INT,
 estc_FechaModifica	DATETIME
 CONSTRAINT PK_gral_tbEstadosCiviles_estc_Id PRIMARY KEY (estc_Id),
 CONSTRAINT UQ_gral_tbEstadosCiviles_estc_Descripcion UNIQUE (estc_Descripcion)
 );

 GO
 
INSERT INTO gral.tbEstadosCiviles
(estc_Descripcion,estc_UserCrea)
VALUES
('Soltero(a)',1),
('Casado(a)',1),
('Divorciado(a)',1),
('Viudo(a)',1),
('Union Libre',1)
GO

 GO
 -------------------------------------ESQUEMA KUJO-----------------------------------

 -------------------------------------tbCategorias---------------------------------
 CREATE TABLE kujo.tbCategorias(
cate_Id						INT IDENTITY(1,1),
cate_Descripcion			NVARCHAR(100),
cate_UserCrea				INT				NOT NULL,
cate_FechaCreacion			DATETIME		NOT NULL DEFAULT(GETDATE()),
cate_UserModifica			INT,
cate_FechaModificacion		DATETIME,
cate_Estado					BIT				NOT NULL DEFAULT(1)
CONSTRAINT PK_kujo_tb_Categorias_cate_Id PRIMARY KEY (cate_Id)
);

GO

INSERT INTO kujo.tbCategorias
(cate_Descripcion,cate_UserCrea)
VALUES
('Telefonía',1),
('Cobertores',1),
('Cargadores y Cables',1),
('Vidrios Templados',1),
('Almacenamiento',1)

GO
 -------------------------------------tbProveedores---------------------------------

CREATE TABLE kujo.tbProveedores(
prov_Id						INT IDENTITY(1,1),
prov_Nombre					NVARCHAR(200)	NOT NULL,
prov_Contacto				NVARCHAR(250)	NOT NULL,
muni_Id						CHAR(4)			NOT NULL,
prov_Direccion				NVARCHAR(300)	NOT NULL,
prov_Estado					BIT				NOT NULL  DEFAULT 1,
prov_UserCrea				INT				NOT NULL,
prov_FechaCreacion			DATETIME		NOT NULL DEFAULT GETDATE(),
prov_UserModifica			INT,
prov_FechaModificacion		DATETIME,
CONSTRAINT PK_kujo_tbProveedores_prov_Id PRIMARY KEY (prov_Id),
CONSTRAINT FK_kujo_tbProveedores_tbMunicipios_muni_Id  FOREIGN KEY (muni_Id) REFERENCES gral.tbMunicipios(muni_Id)
);

GO

INSERT INTO kujo.tbProveedores
(prov_Nombre,muni_Id,prov_Contacto,prov_Direccion,prov_UserCrea)
VALUES
('Importadora Gisselle','0801','Javiera Paz','Azacualpa',1),
('Samsung Honduras','0501','Cristal Molly','Barrio Medina',1),
('IPlace','0101','Julliette Moore','La Ceiba',1)

GO
 --------------------------------------tbProductos----------------------------------

CREATE TABLE kujo.tbProductos(
prod_Id						INT IDENTITY(1,1),
prod_Descripcion			NVARCHAR(150),
cate_Id						INT				NOT NULL,
prov_Id						INT				NOT NULL,
prod_Stock					INT				NOT NULL,
prod_Precio					DECIMAL(18,2)	NOT NULL,
prod_Estado					BIT				NOT NULL DEFAULT(1),
prod_UserCrea				INT				NOT NULL ,
prod_FechaCreacion			DATETIME		NOT NULL DEFAULT(GETDATE()),
prod_UserModifica			INT,
prod_FechaModificacion		DATETIME
CONSTRAINT	PK_kujo_tbProductos_prod_Id PRIMARY KEY (prod_Id),
CONSTRAINT	FK_kujo_tbProductos_tbCategorias_cate_Id FOREIGN KEY (cate_Id) REFERENCES kujo.tbCategorias(cate_Id),
CONSTRAINT	FK_kujo_tbProductod_tbProveedores_prov_Id FOREIGN KEY (prov_Id) REFERENCES kujo.tbProveedores (prov_Id)
);

INSERT INTO kujo.TbProductos
(prod_Descripcion,cate_Id,prov_Id,prod_Stock,prod_Precio,prod_UserCrea)
VALUES
('Samsung S22 5G',1,1,1000,1400.00,1),
('Iphone 14',1,1,1000,1400.00,1),
('Iphone 14 Pro Max',1,1,1000,1400.00,1),
('Samusung S21 FE',1,1,1000,1400.00,1),
('Iphone 13',1,1,1000,1400.00,1),
('Iphone 12',1,1,1000,1400.00,1),
('Samsung A80',1,1,1000,1400.00,1),
('Cobertor de Silicon Samsung S22 5G',2,1,1000,1000.00,1),
('Cobertor de Silicon Iphone 14',2,1,1000,1400.00,1),
('Cobertor de Silicon Iphone 14 Pro Max',2,1,1000,1400.00,1),
('Cargador tipo USB C',3,1,1000,1400.00,1),
('Cable USB B a USB C',3,1,1000,1400.00,1),
('Cable USB B a micro USB ',3,1,1000,2000.00,1),
('Cable HDMI',3,1,1000,1300.00,1),
('Vidrio Templado Samsung S22',4,1,1000,1800.00,1),
('Vidrio Templado Iphone 14',4,1,1000,1800.00,1),
('Vidrio Templado Iphone 14 Pro Max',4,1,1000,1800.00,1),
('Memoria SD 16 GB ',5,1,1000,1800.00,1),
('Memoria SD 124 GB',5,1,1000,1800.00,1),
('Memoria SD 256 GB',5,1,1000,1800.00,1)

GO
--------------------------------------tbSucursales----------------------------------

CREATE TABLE kujo.tbSucursales(
sucu_Id						INT IDENTITY(1,1),
sucu_Nombre					NVARCHAR(200)	NOT NULL,
muni_Id						CHAR(4)			NOT NULL,
sucu_Direccion				NVARCHAR(200),
sucu_Estado					BIT				NOT NULL DEFAULT(1),
sucu_UserCrea			INT				NOT NULL,
sucu_FechaCreacion			DATETIME		NOT NULL DEFAULT(GETDATE()),
sucu_UserModifica		INT,
sucu_FechaModificacion		DATETIME
CONSTRAINT PK_kujo_tbSucursales_sucu_Id PRIMARY KEY (sucu_Id),
CONSTRAINT PK_kujo_tbSucursales_tbMunicipios_muni_Id FOREIGN KEY (muni_Id) REFERENCES gral.tbMunicipios(muni_Id)
);

GO
INSERT INTO kujo.tbSucursales
(sucu_Nombre,muni_Id,sucu_Direccion,sucu_UserCrea)
VALUES
('Jojo´s Sucursal SPS','0501','SPS',1),
('Jojo´s Sucursal DC','0801','Tegucigalpa',1),
('Jojo´s Sucursal La Ceiba','0101','La Ceiba',1)


GO
--------------------------------tbEmpleados------------------------------------------

CREATE TABLE kujo.tbEmpleados(
empl_Id						INT IDENTITY(1,1),
empl_Nombres				NVARCHAR(200)	NOT NULL,
empl_ApellIdos				NVARCHAR(200)	NOT NULL,
empl_FechaNacimiento		DATE			NOT NULL,
empl_Sexo					CHAR(1)			NOT NULL,
estc_Id						INT				NOT NULL,
empl_Telefeno				NVARCHAR(20)	NOT NULL,
muni_Id						CHAR(4)			NOT NULL,
empl_Direccion				NVARCHAR(200),
sucu_Id						INT				NOT NULL,
empl_Estado					BIT				NOT NULL DEFAULT(1),
empl_UserCrea				INT				NOT NULL,
empl_FechaCreacion			DATETIME		NOT NULL DEFAULT(GETDATE()),
empl_UserModifica			INT,
empl_FechaModificacion		DATETIME
CONSTRAINT PK_kujo_tbEmpleados_empl_Id PRIMARY KEY(empl_Id),
CONSTRAINT CK_kujo_tbEmpleados_empl_Sexo CHECK(empl_sexo IN ('F', 'M')),
CONSTRAINT FK_kujo_tbEmpleados_tbSucursales_sucu_Id FOREIGN KEY(sucu_Id) REFERENCES kujo.tbSucursales(sucu_Id),
CONSTRAINT FK_kujo_tbEmpleados_tbEstadosCiviles_estc_Id FOREIGN KEY (estc_Id) REFERENCES gral.tbEstadosCiviles (estc_Id),
CONSTRAINT FK_kujo_tbEmpleados_tbMunicipios_muni_Id FOREIGN KEY (muni_Id) REFERENCES gral.tbMunicipios (muni_Id)
);

GO


INSERT INTO kujo.tbEmpleados
(	empl_Nombres, 
	empl_ApellIdos, 
	empl_FechaNacimiento, 
	empl_Sexo, 
	estc_Id,
	empl_Telefeno, 
	muni_Id, 
	empl_Direccion, 
	sucu_Id, 
	empl_UserCrea)
VALUES
(	'Jafet','Gomez','02-01-2005','M',1,'98129299','0501','SPS',1,1),
(	'Cristian','Aguilar','10-01-2005','M',1,'33201809','0501','SPS',1,1),
(	'Julyssa','Medina','06-01-2005','F',2,'98826754','0501','Tegucigalpa',2,1),
(	'Carlos','Ruiz','06-01-2005','M',2,'97630978','0501','Tegucigalpa',2,1),
(	'Daniel','Espinoza','06-01-2005','M',3,'32789739','0501','Tela',3,1),
(	'Chris','Aguilar','06-01-2005','M',3,'56452809','0501','La Ceiba',3,1)



GO
--------------------------------tbClientes------------------------------------------

CREATE TABLE kujo.tbClientes(
clie_Id						INT IDENTITY(1,1),
clie_Nombres				NVARCHAR(200)		NOT NULL,
clie_ApellIdos				NVARCHAR(200)		NOT NULL,
clie_FechaNacimiento		DATE				NOT NULL,
clie_Sexo					CHAR(1)				NOT NULL,
estc_Id						INT					NOT NULL,
clie_Telefeno				NVARCHAR(20)		NOT NULL,
muni_Id						CHAR(4)				NOT NULL,
clie_Direccion				NVARCHAR(200),
clie_Estado					BIT					NOT NULL DEFAULT(1),
clie_UserCrea				INT					NOT NULL,
clie_FechaCreacion			DATETIME			NOT NULL DEFAULT(GETDATE()),
clie_UserModifica			INT,
clie_FechaModificacion		DATETIME
CONSTRAINT PK_kujo_tbClientes_clie_Id PRIMARY KEY (clie_Id),
CONSTRAINT CK_kujo_tbClientes_clie_Sexo CHECK(clie_Sexo IN ('F', 'M')),
CONSTRAINT FK_kujo_tbClientes_tbEstadosCiviles_eciv_Id FOREIGN KEY (estc_Id) REFERENCES gral.tbEstadosCiviles (estc_Id),
CONSTRAINT FK_kujo_tbClientes_tbMunicipios_muni_Id FOREIGN KEY (muni_Id) REFERENCES gral.tbMunicipios (muni_Id)
);

GO

INSERT INTO kujo.tbClientes
(	clie_Nombres, 
	clie_ApellIdos, 
	clie_FechaNacimiento, 
	clie_Sexo, 
	estc_Id, 
	clie_Telefeno, 
	muni_Id, 
	clie_Direccion, 
	clie_UserCrea)
	VALUES
(	'Isaac','Gomez','02-01-2005','M',1,'98129299','0501','SPS',1),
(	'Alexander','Aguilar','10-01-2005','M',1,'33201809','0501','SPS',1),
(	'Selvin','Medina','06-01-2005','M',1,'98826754','0501','SPS',1),
(	'Alexa','Toledo','06-01-2005','F',1,'98826754','0501','SPS',1),
(	'Lindesey','Lohan','06-01-2005','F',1,'98826754','0501','SPS',1)

GO
----------------------------------------tbFactura------------------------------------------

CREATE TABLE kujo.tbFacturas(
fact_Id						INT IDENTITY(1,1),
clie_Id						INT			NOT NULL,
empl_Id						INT			NOT NULL,
fact_fechacompra			DATETIME	NOT NULL DEFAULT(GETDATE()),
fact_estadocompra			BIT			NOT NULL DEFAULT 1,
fact_Estado					BIT			NOT NULL DEFAULT(1),
fact_UserCrea				INT			NOT NULL,
fact_FechaCreacion			DATETIME	NOT NULL DEFAULT(GETDATE()),
fact_UserModifica			INT,
fact_FechaModificacion		DATETIME,
CONSTRAINT	PK_kujo_tbFacturas_fact_Id PRIMARY KEY (fact_Id),
CONSTRAINT	FK_kujo_tbFacturas_tbClientes_clie_Id FOREIGN KEY (clie_Id) REFERENCES kujo.tbClientes (clie_Id),
CONSTRAINT	FK_kujo_tbFacturas_tbEmpleados_empl_Id FOREIGN KEY (empl_Id) REFERENCES kujo.tbEmpleados (empl_Id)
);

GO
-------------------------------------tbFacturaDetalle-------------------------------------

CREATE TABLE kujo.tbFacturasDetalles(
facd_Id						INT IDENTITY(1,1),
fact_Id						INT				NOT NULL,
prod_Id						INT				NOT NULL,
facd_PrecioUnitario			DECIMAL(18,2)	NOT NULL,
prod_Cantidad				INT				NOT NULL,
facd_UserCrea				INT				NOT NULL,
facd_FechaCreacion			DATETIME		NOT NULL DEFAULT(GETDATE()),
facd_UserModifica			INT,
facd_FechaModificacion		DATETIME,
facd_Estado					BIT				NOT NULL DEFAULT(1)
CONSTRAINT	PK_kujo_tbFacturasDetalles_facd_Id PRIMARY KEY (facd_Id),
CONSTRAINT	FK_kujo_tbFacturasDetalles_tb_Facturas_fact_Id FOREIGN KEY (fact_Id) REFERENCES kujo.tbFacturas (fact_Id)
);


--------------------------------------------------ALTERS---------------------------------------------------------

GO

--********* ALTERAR Pantallas **************--
ALTER TABLE [acce].[tbPantallas]
ADD CONSTRAINT FK_kujo_tbPantallas_pant_UserCrea_acce_tbUsuarios_user_Id FOREIGN KEY (pant_UserCrea) REFERENCES acce.tbUsuarios([user_Id]),
	CONSTRAINT FK_kujo_tbPantallas_pant_UserModifica_acce_tbUsuarios_user_Id FOREIGN KEY (pant_UserModifica) REFERENCES acce.tbUsuarios([user_Id]);

GO

--********* ALTERAR Pantallas Por Rol **************--
ALTER TABLE [acce].[tbPantallasPorRol]
ADD CONSTRAINT FK_kujo_tbPantallasPorRol_pantrol_UserCrea_acce_tbUsuarios_user_Id FOREIGN KEY (pantrol_UserCrea) REFERENCES [acce].[tbUsuarios] ([user_Id]),
	CONSTRAINT FK_kujo_tbPantallasPorRol_pantrol_UserModifica_acce_tbUsuarios_user_Id FOREIGN KEY (pantrol_UserModifica) REFERENCES [acce].[tbUsuarios] ([user_Id])

GO

--********* ALTERAR Roles **************--
ALTER TABLE [acce].[tbRoles]
ADD CONSTRAINT FK_kujo_tbRoles_role_UserCrea_acce_tbUsuarios_user_Id FOREIGN KEY (role_UserCrea) REFERENCES [acce].[tbUsuarios] ([user_Id]),
    CONSTRAINT FK_kujo_tbRoles_role_UserModifica_acce_tbUsuarios_user_Id FOREIGN KEY (role_UserModifica) REFERENCES [acce].[tbUsuarios] ([user_Id])

GO

--********* ALTERAR Usuarios **************--
ALTER TABLE [acce].[tbUsuarios]
ADD CONSTRAINT FK_acce_tbUsuarios_user_UserCrea_tbUsuarios_user_Id FOREIGN KEY (user_UserCrea) REFERENCES [acce].[tbUsuarios] ([user_Id]),
    CONSTRAINT FK_acce_tbUsuarios_user_UserModifica_tbUsuarios_user_Id FOREIGN KEY (user_UserModifica) REFERENCES [acce].[tbUsuarios] ([user_Id]),
    CONSTRAINT FK_acce_tbUsuarios_tbEmpleados_empl_Id FOREIGN KEY (empl_Id) REFERENCES [kujo].[tbEmpleados] (empl_Id)

GO

--********* ALTERAR Departamentos **************--
ALTER TABLE [gral].[tbDepartamentos]
ADD CONSTRAINT FK_gral_tbDepartamentos_dept_UserCrea_acce_tbUsuarios_user_Id FOREIGN KEY (dept_UserCrea) REFERENCES [acce].[tbUsuarios]([user_Id]),
    CONSTRAINT FK_gral_tbDepartamentos_dept_UserModifica_acce_tbUsuarios_user_Id FOREIGN KEY (dept_UserModifica) REFERENCES [acce].[tbUsuarios]([user_Id]);

GO

--********* ALTERAR Municipios **************--
ALTER TABLE [gral].[tbMunicipios]
ADD CONSTRAINT FK_gral_tbMunicipios_muni_UserCrea_acce_tbUsuarios_user_Id FOREIGN KEY (muni_UserCrea) REFERENCES acce.tbUsuarios([user_Id]),
    CONSTRAINT FK_gral_tbMunicipios_muni_UserModifica_acce_tbUsuarios_user_Id FOREIGN KEY (muni_UserModifica) REFERENCES acce.tbUsuarios([user_Id]);

GO

--********* ALTERAR Estados Civiles **************--
ALTER TABLE [gral].[tbEstadosCiviles]
ADD CONSTRAINT FK_gral_tbEstadosCiviles_estc_UserCrea_acce_tbUsuarios_user_Id FOREIGN KEY (estc_UserCrea) REFERENCES acce.tbUsuarios([user_Id]),
    CONSTRAINT FK_gral_tbEstadosCiviles_estc_UserModifica_acce_tbUsuarios_user_Id FOREIGN KEY (estc_UserModifica) REFERENCES acce.tbUsuarios([user_Id]);

GO
				  
--********* ALTERAR Categorias **************--
ALTER TABLE		kujo.tbCategorias
ADD CONSTRAINT	FK_kujo_tbCategorias_UserCrea_usua_Id		FOREIGN KEY(cate_UserCrea) REFERENCES acce.tbUsuarios([user_Id]),
	CONSTRAINT	FK_kujo_tbCategorias_UserModifica_usua_Id	FOREIGN KEY(cate_UserModifica) REFERENCES acce.tbUsuarios([user_Id]);


--********* ALTERAR PROVEEDORES **************--
ALTER TABLE		kujo.tbProveedores
ADD CONSTRAINT	FK_kujo_tbProveedores_UserCrea_usua_Id		FOREIGN KEY(prov_UserCrea) REFERENCES acce.tbUsuarios([user_Id]),
	CONSTRAINT	FK_kujo_tbProveedores_UserModifica_usua_Id	FOREIGN KEY(prov_UserModifica) REFERENCES acce.tbUsuarios([user_Id]);


--********* ALTERAR PRODUCTOS **************--
ALTER TABLE		kujo.tbProductos
ADD CONSTRAINT	FK_kujo_tbProductos_UserCrea_usua_Id		FOREIGN KEY(prod_UserCrea) REFERENCES acce.tbUsuarios([user_Id]),
	CONSTRAINT	FK_kujo_tbProductos_UserModifica_usua_Id	FOREIGN KEY(prod_UserModifica) REFERENCES acce.tbUsuarios([user_Id]);


--********* ALTERAR SUCURSALES **************--
ALTER TABLE		kujo.tbSucursales
ADD CONSTRAINT	FK_kujo_tbSucursales_UserCrea_usua_Id		FOREIGN KEY(sucu_UserCrea) REFERENCES acce.tbUsuarios([user_Id]),
	CONSTRAINT	FK_kujo_tbSucursales_UserModifica_usua_Id	FOREIGN KEY(sucu_UserModifica) REFERENCES acce.tbUsuarios([user_Id]);


--********* ALTERAR EMPLEADOS **************--
ALTER TABLE		kujo.tbEmpleados
ADD CONSTRAINT	FK_kujo_tbEmpleados_UserCrea_usua_Id		FOREIGN KEY(empl_UserCrea) REFERENCES acce.tbUsuarios([user_Id]),
	CONSTRAINT	FK_kujo_tbEmpleados_UserModifica_usua_Id	FOREIGN KEY(empl_UserModifica) REFERENCES acce.tbUsuarios([user_Id]);


--********* ALTERAR CLIENTES **************--
ALTER TABLE		kujo.tbClientes
ADD CONSTRAINT	FK_kujo_tbClientes_UserCrea_usua_Id		FOREIGN KEY(clie_UserCrea) REFERENCES acce.tbUsuarios([user_Id]),
	CONSTRAINT	FK_kujo_tbClientes_UserModifica_usua_Id	FOREIGN KEY(clie_UserModifica) REFERENCES acce.tbUsuarios([user_Id]);


--********* ALTERAR FACTURA **************--
ALTER TABLE		kujo.tbFacturas
ADD CONSTRAINT	FK_kujo_tbFacturas_UserCrea_usua_Id		FOREIGN KEY(fact_UserCrea) REFERENCES acce.tbUsuarios([user_Id]),
	CONSTRAINT	FK_kujo_tbFacturas_UserModifica_usua_Id	FOREIGN KEY(fact_UserModifica) REFERENCES acce.tbUsuarios([user_Id]);


--********* ALTERAR FACTURA DETALLE **************--
ALTER TABLE		kujo.tbFacturasDetalles
ADD CONSTRAINT	FK_kujo_tbFacturasDetalles_UserCrea_usua_Id		FOREIGN KEY(facd_UserCrea) REFERENCES acce.tbUsuarios([user_Id]),
	CONSTRAINT	FK_kujo_tbFacturasDetalles_UserModifica_usua_Id	FOREIGN KEY(facd_UserModifica) REFERENCES acce.tbUsuarios([user_Id]);



