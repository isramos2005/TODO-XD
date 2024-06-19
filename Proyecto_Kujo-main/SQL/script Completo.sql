USE [db_KujoCenter]
GO
/****** Object:  Schema [acce]    Script Date: 9/4/2023 08:34:24 PM ******/
CREATE SCHEMA [acce]
GO
/****** Object:  Schema [gral]    Script Date: 9/4/2023 08:34:24 PM ******/
CREATE SCHEMA [gral]
GO
/****** Object:  Schema [kujo]    Script Date: 9/4/2023 08:34:24 PM ******/
CREATE SCHEMA [kujo]
GO
/****** Object:  Table [acce].[tbPantallas]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [acce].[tbPantallas](
	[pant_Id] [int] IDENTITY(1,1) NOT NULL,
	[pant_Nombre] [nvarchar](150) NOT NULL,
	[pant_Identificador] [char](8) NOT NULL,
	[pant_href] [nvarchar](70) NOT NULL,
	[pant_Estado] [bit] NULL,
	[pant_UserCrea] [int] NOT NULL,
	[pant_FechaCrea] [datetime] NULL,
	[pant_UserModifica] [int] NULL,
	[pant_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_acce_tbPantallas_pant_Id] PRIMARY KEY CLUSTERED 
(
	[pant_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [acce].[tbPantallasPorRol]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [acce].[tbPantallasPorRol](
	[pantrol_Id] [int] IDENTITY(1,1) NOT NULL,
	[role_Id] [int] NOT NULL,
	[pant_Id] [int] NOT NULL,
	[pantrol_Estado] [bit] NULL,
	[pantrol_UserCrea] [int] NOT NULL,
	[pantrol_FechaCrea] [datetime] NULL,
	[pantrol_UserModifica] [int] NULL,
	[pantrol_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_acce_tbPantallasPorRol_pantrol_Id] PRIMARY KEY CLUSTERED 
(
	[pantrol_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [acce].[tbRoles]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [acce].[tbRoles](
	[role_Id] [int] IDENTITY(1,1) NOT NULL,
	[role_Descripcion] [varchar](150) NOT NULL,
	[role_Estado] [bit] NULL,
	[role_UserCrea] [int] NOT NULL,
	[role_FechaCrea] [datetime] NULL,
	[role_UserModifica] [int] NULL,
	[role_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_acce_tbRoles_role_Id] PRIMARY KEY CLUSTERED 
(
	[role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [acce].[tbUsuarios]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [acce].[tbUsuarios](
	[user_Id] [int] IDENTITY(1,1) NOT NULL,
	[user_NombreUsuario] [nvarchar](200) NOT NULL,
	[empl_Id] [int] NOT NULL,
	[user_Contraseña] [nvarchar](150) NOT NULL,
	[user_Admin] [bit] NOT NULL,
	[role_Id] [int] NULL,
	[user_Estado] [bit] NULL,
	[user_UserCrea] [int] NOT NULL,
	[user_FechaCrea] [datetime] NULL,
	[user_UserModifica] [int] NULL,
	[user_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_acce_tbUsuarios_user_Id] PRIMARY KEY CLUSTERED 
(
	[user_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gral].[tbDepartamentos]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gral].[tbDepartamentos](
	[dept_Id] [char](2) NOT NULL,
	[dept_Descripcion] [nvarchar](200) NOT NULL,
	[dept_Estado] [bit] NULL,
	[dept_UserCrea] [int] NOT NULL,
	[dept_FechaCrea] [datetime] NULL,
	[dept_UserModifica] [int] NULL,
	[dept_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_gral_tbDepartamentos_dept_Id] PRIMARY KEY CLUSTERED 
(
	[dept_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gral].[tbEstadosCiviles]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gral].[tbEstadosCiviles](
	[estc_Id] [int] IDENTITY(1,1) NOT NULL,
	[estc_Descripcion] [nvarchar](100) NOT NULL,
	[estc_Estado] [bit] NULL,
	[estc_UserCrea] [int] NOT NULL,
	[estc_FechaCrea] [datetime] NULL,
	[estc_UserModifica] [int] NULL,
	[estc_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_gral_tbEstadosCiviles_estc_Id] PRIMARY KEY CLUSTERED 
(
	[estc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gral].[tbMunicipios]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gral].[tbMunicipios](
	[muni_Id] [char](4) NOT NULL,
	[dept_Id] [char](2) NOT NULL,
	[muni_Descripcion] [nvarchar](200) NOT NULL,
	[muni_Estado] [bit] NULL,
	[muni_UserCrea] [int] NOT NULL,
	[muni_FechaCrea] [datetime] NULL,
	[muni_UserModifica] [int] NULL,
	[muni_FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_gral_tbMunicipios_muni_Id] PRIMARY KEY CLUSTERED 
(
	[muni_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [kujo].[tbCategorias]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kujo].[tbCategorias](
	[cate_Id] [int] IDENTITY(1,1) NOT NULL,
	[cate_Descripcion] [nvarchar](100) NULL,
	[cate_UserCrea] [int] NOT NULL,
	[cate_FechaCreacion] [datetime] NOT NULL,
	[cate_UserModifica] [int] NULL,
	[cate_FechaModificacion] [datetime] NULL,
	[cate_Estado] [bit] NOT NULL,
 CONSTRAINT [PK_kujo_tb_Categorias_cate_Id] PRIMARY KEY CLUSTERED 
(
	[cate_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [kujo].[tbClientes]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kujo].[tbClientes](
	[clie_Id] [int] IDENTITY(1,1) NOT NULL,
	[clie_Nombres] [nvarchar](200) NOT NULL,
	[clie_ApellIdos] [nvarchar](200) NOT NULL,
	[clie_FechaNacimiento] [date] NOT NULL,
	[clie_Sexo] [char](1) NOT NULL,
	[estc_Id] [int] NOT NULL,
	[clie_Telefeno] [nvarchar](20) NOT NULL,
	[muni_Id] [char](4) NOT NULL,
	[clie_Direccion] [nvarchar](200) NULL,
	[clie_Estado] [bit] NOT NULL,
	[clie_UserCrea] [int] NOT NULL,
	[clie_FechaCreacion] [datetime] NOT NULL,
	[clie_UserModifica] [int] NULL,
	[clie_FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_kujo_tbClientes_clie_Id] PRIMARY KEY CLUSTERED 
(
	[clie_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [kujo].[tbEmpleados]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kujo].[tbEmpleados](
	[empl_Id] [int] IDENTITY(1,1) NOT NULL,
	[empl_Nombres] [nvarchar](200) NOT NULL,
	[empl_ApellIdos] [nvarchar](200) NOT NULL,
	[empl_FechaNacimiento] [date] NOT NULL,
	[empl_Sexo] [char](1) NOT NULL,
	[estc_Id] [int] NOT NULL,
	[empl_Telefeno] [nvarchar](20) NOT NULL,
	[muni_Id] [char](4) NOT NULL,
	[empl_Direccion] [nvarchar](200) NULL,
	[sucu_Id] [int] NOT NULL,
	[empl_Estado] [bit] NOT NULL,
	[empl_UserCrea] [int] NOT NULL,
	[empl_FechaCreacion] [datetime] NOT NULL,
	[empl_UserModifica] [int] NULL,
	[empl_FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_kujo_tbEmpleados_empl_Id] PRIMARY KEY CLUSTERED 
(
	[empl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [kujo].[tbFacturas]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kujo].[tbFacturas](
	[fact_Id] [int] IDENTITY(1,1) NOT NULL,
	[clie_Id] [int] NOT NULL,
	[empl_Id] [int] NOT NULL,
	[fact_fechacompra] [datetime] NOT NULL,
	[fact_estadocompra] [bit] NOT NULL,
	[fact_Estado] [bit] NOT NULL,
	[fact_UserCrea] [int] NOT NULL,
	[fact_FechaCreacion] [datetime] NOT NULL,
	[fact_UserModifica] [int] NULL,
	[fact_FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_kujo_tbFacturas_fact_Id] PRIMARY KEY CLUSTERED 
(
	[fact_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [kujo].[tbFacturasDetalles]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kujo].[tbFacturasDetalles](
	[facd_Id] [int] IDENTITY(1,1) NOT NULL,
	[fact_Id] [int] NOT NULL,
	[prod_Id] [int] NOT NULL,
	[facd_PrecioUnitario] [decimal](18, 2) NOT NULL,
	[prod_Cantidad] [int] NOT NULL,
	[facd_UserCrea] [int] NOT NULL,
	[facd_FechaCreacion] [datetime] NOT NULL,
	[facd_UserModifica] [int] NULL,
	[facd_FechaModificacion] [datetime] NULL,
	[facd_Estado] [bit] NOT NULL,
 CONSTRAINT [PK_kujo_tbFacturasDetalles_facd_Id] PRIMARY KEY CLUSTERED 
(
	[facd_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [kujo].[tbProductos]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kujo].[tbProductos](
	[prod_Id] [int] IDENTITY(1,1) NOT NULL,
	[prod_Descripcion] [nvarchar](150) NULL,
	[cate_Id] [int] NOT NULL,
	[prov_Id] [int] NOT NULL,
	[prod_Stock] [int] NOT NULL,
	[prod_Precio] [decimal](18, 2) NOT NULL,
	[prod_Estado] [bit] NOT NULL,
	[prod_UserCrea] [int] NOT NULL,
	[prod_FechaCreacion] [datetime] NOT NULL,
	[prod_UserModifica] [int] NULL,
	[prod_FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_kujo_tbProductos_prod_Id] PRIMARY KEY CLUSTERED 
(
	[prod_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [kujo].[tbProveedores]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kujo].[tbProveedores](
	[prov_Id] [int] IDENTITY(1,1) NOT NULL,
	[prov_Nombre] [nvarchar](200) NOT NULL,
	[prov_Contacto] [nvarchar](250) NOT NULL,
	[muni_Id] [char](4) NOT NULL,
	[prov_Direccion] [nvarchar](300) NOT NULL,
	[prov_Estado] [bit] NOT NULL,
	[prov_UserCrea] [int] NOT NULL,
	[prov_FechaCreacion] [datetime] NOT NULL,
	[prov_UserModifica] [int] NULL,
	[prov_FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_kujo_tbProveedores_prov_Id] PRIMARY KEY CLUSTERED 
(
	[prov_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [kujo].[tbSucursales]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kujo].[tbSucursales](
	[sucu_Id] [int] IDENTITY(1,1) NOT NULL,
	[sucu_Nombre] [nvarchar](200) NOT NULL,
	[muni_Id] [char](4) NOT NULL,
	[sucu_Direccion] [nvarchar](200) NULL,
	[sucu_Estado] [bit] NOT NULL,
	[sucu_UserCrea] [int] NOT NULL,
	[sucu_FechaCreacion] [datetime] NOT NULL,
	[sucu_UserModifica] [int] NULL,
	[sucu_FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_kujo_tbSucursales_sucu_Id] PRIMARY KEY CLUSTERED 
(
	[sucu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [acce].[tbPantallas] ON 

INSERT [acce].[tbPantallas] ([pant_Id], [pant_Nombre], [pant_Identificador], [pant_href], [pant_Estado], [pant_UserCrea], [pant_FechaCrea], [pant_UserModifica], [pant_FechaModifica]) VALUES (1, N'Usuarios', N'acceuser', N'/Usuarios/Listado', 1, 1, CAST(N'2023-04-06T19:27:29.887' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallas] ([pant_Id], [pant_Nombre], [pant_Identificador], [pant_href], [pant_Estado], [pant_UserCrea], [pant_FechaCrea], [pant_UserModifica], [pant_FechaModifica]) VALUES (2, N'Roles', N'accerole', N'/Roles/Listado', 1, 1, CAST(N'2023-04-06T19:27:29.887' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallas] ([pant_Id], [pant_Nombre], [pant_Identificador], [pant_href], [pant_Estado], [pant_UserCrea], [pant_FechaCrea], [pant_UserModifica], [pant_FechaModifica]) VALUES (3, N'Reportes', N'kujorepo', N'/Reportes', 1, 1, CAST(N'2023-04-06T19:27:29.887' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallas] ([pant_Id], [pant_Nombre], [pant_Identificador], [pant_href], [pant_Estado], [pant_UserCrea], [pant_FechaCrea], [pant_UserModifica], [pant_FechaModifica]) VALUES (4, N'Clientes', N'kujoclie', N'/Clientes/Listado', 1, 1, CAST(N'2023-04-06T19:27:29.887' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallas] ([pant_Id], [pant_Nombre], [pant_Identificador], [pant_href], [pant_Estado], [pant_UserCrea], [pant_FechaCrea], [pant_UserModifica], [pant_FechaModifica]) VALUES (5, N'Productos', N'kujoprod', N'/Productos/Listado', 1, 1, CAST(N'2023-04-06T19:27:29.887' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallas] ([pant_Id], [pant_Nombre], [pant_Identificador], [pant_href], [pant_Estado], [pant_UserCrea], [pant_FechaCrea], [pant_UserModifica], [pant_FechaModifica]) VALUES (6, N'Facturación', N'kujofact', N'/Facturas/Listado', 1, 1, CAST(N'2023-04-06T19:27:29.887' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [acce].[tbPantallas] OFF
GO
SET IDENTITY_INSERT [acce].[tbPantallasPorRol] ON 

INSERT [acce].[tbPantallasPorRol] ([pantrol_Id], [role_Id], [pant_Id], [pantrol_Estado], [pantrol_UserCrea], [pantrol_FechaCrea], [pantrol_UserModifica], [pantrol_FechaModifica]) VALUES (2, 1, 2, 1, 1, CAST(N'2023-04-06T19:27:30.457' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallasPorRol] ([pantrol_Id], [role_Id], [pant_Id], [pantrol_Estado], [pantrol_UserCrea], [pantrol_FechaCrea], [pantrol_UserModifica], [pantrol_FechaModifica]) VALUES (3, 2, 4, 1, 1, CAST(N'2023-04-06T19:27:30.457' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallasPorRol] ([pantrol_Id], [role_Id], [pant_Id], [pantrol_Estado], [pantrol_UserCrea], [pantrol_FechaCrea], [pantrol_UserModifica], [pantrol_FechaModifica]) VALUES (4, 2, 5, 1, 1, CAST(N'2023-04-06T19:27:30.457' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallasPorRol] ([pantrol_Id], [role_Id], [pant_Id], [pantrol_Estado], [pantrol_UserCrea], [pantrol_FechaCrea], [pantrol_UserModifica], [pantrol_FechaModifica]) VALUES (5, 3, 3, 1, 1, CAST(N'2023-04-06T19:27:30.457' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallasPorRol] ([pantrol_Id], [role_Id], [pant_Id], [pantrol_Estado], [pantrol_UserCrea], [pantrol_FechaCrea], [pantrol_UserModifica], [pantrol_FechaModifica]) VALUES (6, 3, 4, 1, 1, CAST(N'2023-04-06T19:27:30.457' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallasPorRol] ([pantrol_Id], [role_Id], [pant_Id], [pantrol_Estado], [pantrol_UserCrea], [pantrol_FechaCrea], [pantrol_UserModifica], [pantrol_FechaModifica]) VALUES (7, 3, 5, 1, 1, CAST(N'2023-04-06T19:27:30.457' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallasPorRol] ([pantrol_Id], [role_Id], [pant_Id], [pantrol_Estado], [pantrol_UserCrea], [pantrol_FechaCrea], [pantrol_UserModifica], [pantrol_FechaModifica]) VALUES (8, 2, 6, 1, 1, CAST(N'2023-04-06T19:27:30.457' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallasPorRol] ([pantrol_Id], [role_Id], [pant_Id], [pantrol_Estado], [pantrol_UserCrea], [pantrol_FechaCrea], [pantrol_UserModifica], [pantrol_FechaModifica]) VALUES (10, 3, 6, 1, 2, CAST(N'2023-04-07T15:53:16.397' AS DateTime), NULL, NULL)
INSERT [acce].[tbPantallasPorRol] ([pantrol_Id], [role_Id], [pant_Id], [pantrol_Estado], [pantrol_UserCrea], [pantrol_FechaCrea], [pantrol_UserModifica], [pantrol_FechaModifica]) VALUES (13, 1, 1, 1, 2, CAST(N'2023-04-07T22:42:58.933' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [acce].[tbPantallasPorRol] OFF
GO
SET IDENTITY_INSERT [acce].[tbRoles] ON 

INSERT [acce].[tbRoles] ([role_Id], [role_Descripcion], [role_Estado], [role_UserCrea], [role_FechaCrea], [role_UserModifica], [role_FechaModifica]) VALUES (1, N'Administrador de Seguridad', 1, 1, CAST(N'2023-04-06T19:27:30.260' AS DateTime), NULL, NULL)
INSERT [acce].[tbRoles] ([role_Id], [role_Descripcion], [role_Estado], [role_UserCrea], [role_FechaCrea], [role_UserModifica], [role_FechaModifica]) VALUES (2, N'Cajero', 1, 1, CAST(N'2023-04-06T19:27:30.260' AS DateTime), NULL, NULL)
INSERT [acce].[tbRoles] ([role_Id], [role_Descripcion], [role_Estado], [role_UserCrea], [role_FechaCrea], [role_UserModifica], [role_FechaModifica]) VALUES (3, N'Gerente', 1, 1, CAST(N'2023-04-06T19:27:30.260' AS DateTime), NULL, NULL)
INSERT [acce].[tbRoles] ([role_Id], [role_Descripcion], [role_Estado], [role_UserCrea], [role_FechaCrea], [role_UserModifica], [role_FechaModifica]) VALUES (9, N'Test 3', 1, 10, CAST(N'2023-04-09T05:03:38.420' AS DateTime), NULL, NULL)
INSERT [acce].[tbRoles] ([role_Id], [role_Descripcion], [role_Estado], [role_UserCrea], [role_FechaCrea], [role_UserModifica], [role_FechaModifica]) VALUES (10, N'Test', 0, 10, CAST(N'2023-04-09T05:05:57.080' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [acce].[tbRoles] OFF
GO
SET IDENTITY_INSERT [acce].[tbUsuarios] ON 

INSERT [acce].[tbUsuarios] ([user_Id], [user_NombreUsuario], [empl_Id], [user_Contraseña], [user_Admin], [role_Id], [user_Estado], [user_UserCrea], [user_FechaCrea], [user_UserModifica], [user_FechaModifica]) VALUES (1, N'Admin', 4, N'୍찤哑豷毖ү訨⚮韟憩혽ﬖ淠뻎鯌䲾㳩኎ꋜ夞쀵ঋ協鉈棅솸鈫櫲䠤', 1, 0, 0, 1, CAST(N'2023-04-06T19:27:30.500' AS DateTime), 2, CAST(N'2023-04-06T19:57:29.900' AS DateTime))
INSERT [acce].[tbUsuarios] ([user_Id], [user_NombreUsuario], [empl_Id], [user_Contraseña], [user_Admin], [role_Id], [user_Estado], [user_UserCrea], [user_FechaCrea], [user_UserModifica], [user_FechaModifica]) VALUES (2, N'IsHatake', 1, N'헌䌺祥�ю鈐暢ၡ�䳧첟⡩ꕓ蟫附ල즫نᐁ蝍쿪쓫㪏ᯌ䒚ㆁ⭙⹁', 0, 1, 1, 1, CAST(N'2023-04-06T19:27:39.120' AS DateTime), NULL, NULL)
INSERT [acce].[tbUsuarios] ([user_Id], [user_NombreUsuario], [empl_Id], [user_Contraseña], [user_Admin], [role_Id], [user_Estado], [user_UserCrea], [user_FechaCrea], [user_UserModifica], [user_FechaModifica]) VALUES (3, N'Raiden', 1, N'ᥪ᧥ⶹ㛀✡Ꜣ骙玗ఔ觸A襑뵱⤾達腧⽵쫨ഏ徴莩쐆栭儻鋭嚨絶恇䨑ზ换', 1, 0, 1, 1, CAST(N'2023-04-06T19:27:39.120' AS DateTime), NULL, NULL)
INSERT [acce].[tbUsuarios] ([user_Id], [user_NombreUsuario], [empl_Id], [user_Contraseña], [user_Admin], [role_Id], [user_Estado], [user_UserCrea], [user_FechaCrea], [user_UserModifica], [user_FechaModifica]) VALUES (4, N'Amaterasu', 2, N'ᥪ᧥ⶹ㛀✡Ꜣ骙玗ఔ觸A襑뵱⤾達腧⽵쫨ഏ徴莩쐆栭儻鋭嚨絶恇䨑ზ换', 0, 3, 1, 1, CAST(N'2023-04-06T19:27:39.120' AS DateTime), NULL, NULL)
INSERT [acce].[tbUsuarios] ([user_Id], [user_NombreUsuario], [empl_Id], [user_Contraseña], [user_Admin], [role_Id], [user_Estado], [user_UserCrea], [user_FechaCrea], [user_UserModifica], [user_FechaModifica]) VALUES (10, N'Tomioka', 3, N'⦆쌢Ⅎ쥐䎸☻죕ﭟడ䥌鈧멌筳鉀洽騦邃鹉ѐ儱訚ꅂ耬ꊾ쓖㲬鴻殟膺ౣ', 1, 0, 1, 4, CAST(N'2023-04-06T19:28:50.093' AS DateTime), NULL, NULL)
INSERT [acce].[tbUsuarios] ([user_Id], [user_NombreUsuario], [empl_Id], [user_Contraseña], [user_Admin], [role_Id], [user_Estado], [user_UserCrea], [user_FechaCrea], [user_UserModifica], [user_FechaModifica]) VALUES (13, N'JS', 6, N'⦆쌢Ⅎ쥐䎸☻죕ﭟడ䥌鈧멌筳鉀洽騦邃鹉ѐ儱訚ꅂ耬ꊾ쓖㲬鴻殟膺ౣ', 0, 2, 1, 2, CAST(N'2023-04-07T14:41:07.203' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [acce].[tbUsuarios] OFF
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
SET IDENTITY_INSERT [gral].[tbEstadosCiviles] ON 

INSERT [gral].[tbEstadosCiviles] ([estc_Id], [estc_Descripcion], [estc_Estado], [estc_UserCrea], [estc_FechaCrea], [estc_UserModifica], [estc_FechaModifica]) VALUES (1, N'Soltero(a)', 1, 1, CAST(N'2023-04-06T19:27:31.483' AS DateTime), NULL, NULL)
INSERT [gral].[tbEstadosCiviles] ([estc_Id], [estc_Descripcion], [estc_Estado], [estc_UserCrea], [estc_FechaCrea], [estc_UserModifica], [estc_FechaModifica]) VALUES (2, N'Casado(a)', 1, 1, CAST(N'2023-04-06T19:27:31.483' AS DateTime), NULL, NULL)
INSERT [gral].[tbEstadosCiviles] ([estc_Id], [estc_Descripcion], [estc_Estado], [estc_UserCrea], [estc_FechaCrea], [estc_UserModifica], [estc_FechaModifica]) VALUES (3, N'Divorciado(a)', 1, 1, CAST(N'2023-04-06T19:27:31.483' AS DateTime), NULL, NULL)
INSERT [gral].[tbEstadosCiviles] ([estc_Id], [estc_Descripcion], [estc_Estado], [estc_UserCrea], [estc_FechaCrea], [estc_UserModifica], [estc_FechaModifica]) VALUES (4, N'Viudo(a)', 1, 1, CAST(N'2023-04-06T19:27:31.483' AS DateTime), NULL, NULL)
INSERT [gral].[tbEstadosCiviles] ([estc_Id], [estc_Descripcion], [estc_Estado], [estc_UserCrea], [estc_FechaCrea], [estc_UserModifica], [estc_FechaModifica]) VALUES (5, N'Union Libre', 1, 1, CAST(N'2023-04-06T19:27:31.483' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [gral].[tbEstadosCiviles] OFF
GO
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0101', N'01', N'La Ceiba', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0102', N'01', N'El Porvenir', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0103', N'01', N'Tela', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0104', N'01', N'Jutiapa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0105', N'01', N'La Masica', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0106', N'01', N'San Francisco', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0107', N'01', N'Arizona', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0108', N'01', N'Esparta', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0201', N'02', N'Trujillo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0202', N'02', N'Balfate', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0203', N'02', N'Iriona', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0204', N'02', N'Limón', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0205', N'02', N'Sabá', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0206', N'02', N'Santa Fe', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0207', N'02', N'Santa Rosa de Aguán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0208', N'02', N'Sonaguera', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0209', N'02', N'Tocoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0210', N'02', N'Bonito Oriental', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0301', N'03', N'Comayagua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0302', N'03', N'Ajuterique', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0303', N'03', N'El Rosario', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0304', N'03', N'Esquías', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0305', N'03', N'Humuya', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0306', N'03', N'La Libertad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0307', N'03', N'Lamaní', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0308', N'03', N'La TrinIdad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0309', N'03', N'Lejamaní', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0310', N'03', N'Meámbar', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0311', N'03', N'Minas de Oro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0312', N'03', N'Ojos de Agua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0313', N'03', N'San Jerónimo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0314', N'03', N'San José de Comayagua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0315', N'03', N'San José del Potrero', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0316', N'03', N'San Luis', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0317', N'03', N'San Sebastián', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0318', N'03', N'Siguatepeque', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0319', N'03', N'Villa de San Antonio', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0320', N'03', N'Las Lajas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0321', N'03', N'Taulabé', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0401', N'04', N'Santa Rosa de Copán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0402', N'04', N'Cabañas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0403', N'04', N'Concepción', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0404', N'04', N'Copán Ruinas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0405', N'04', N'Corquín', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0406', N'04', N'Cucuyagua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0407', N'04', N'Dolores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0408', N'04', N'Dulce Nombre', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0409', N'04', N'El Paraíso', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0410', N'04', N'FlorIda', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0411', N'04', N'La Jigua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0412', N'04', N'La Unión', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0413', N'04', N'Nueva Arcadia', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0414', N'04', N'San Agustín', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0415', N'04', N'San Antonio', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0416', N'04', N'San Jerónimo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0417', N'04', N'San José', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0418', N'04', N'San Juan de Opoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0419', N'04', N'San Nicolás', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0420', N'04', N'San Pedro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0421', N'04', N'Santa Rita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0422', N'04', N'TrinIdad de Copán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0423', N'04', N'Veracruz', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0501', N'05', N'San Pedro Sula', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0502', N'05', N'Choloma', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0503', N'05', N'Omoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0504', N'05', N'Pimienta', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0505', N'05', N'Potrerillos', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0506', N'05', N'Puerto Cortés', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0507', N'05', N'San Antonio de Cortés', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0508', N'05', N'San Francisco de Yojoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0509', N'05', N'San Manuel', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0510', N'05', N'Santa Cruz de Yojoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0511', N'05', N'Villanueva', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0512', N'05', N'La Lima', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0601', N'06', N'Choluteca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0602', N'06', N'Apacilagua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0603', N'06', N'Concepción de María', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0604', N'06', N'Duyure', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0605', N'06', N'El Corpus', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0606', N'06', N'El Triunfo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0607', N'06', N'Marcovia', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0608', N'06', N'Morolica', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0609', N'06', N'Namasigüe', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0610', N'06', N'Orocuina', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0611', N'06', N'Pespire', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0612', N'06', N'San Antonio de Flores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0613', N'06', N'San IsIdro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0614', N'06', N'San José', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0615', N'06', N'San Marcos de Colón', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0616', N'06', N'Santa Ana de Yusguare', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0701', N'07', N'Yuscarán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0702', N'07', N'Alauca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0703', N'07', N'Danlí', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0704', N'07', N'El Paraíso', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0705', N'07', N'Güinope', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0706', N'07', N'Jacaleapa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0707', N'07', N'Liure', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0708', N'07', N'Morocelí', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0709', N'07', N'Oropolí', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0710', N'07', N'Potrerillos', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
GO
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0711', N'07', N'San Antonio de Flores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0712', N'07', N'San Lucas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0713', N'07', N'San Matías', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0714', N'07', N'Soledad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0715', N'07', N'Teupasenti', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0716', N'07', N'Texiguat', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0717', N'07', N'Vado Ancho', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0718', N'07', N'Yauyupe', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0719', N'07', N'Trojes', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0801', N'08', N'Distrito Central', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0802', N'08', N'Alubarén', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0803', N'08', N'Cedros', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0804', N'08', N'Curarén', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0805', N'08', N'El Porvenir', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0806', N'08', N'Guaimaca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0807', N'08', N'La Libertad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0808', N'08', N'La Venta', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0809', N'08', N'Lepaterique', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0810', N'08', N'Maraita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0811', N'08', N'Marale', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0812', N'08', N'Nueva Armenia', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0813', N'08', N'Ojojona', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0814', N'08', N'Orica', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0815', N'08', N'Reitoca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0816', N'08', N'Sabanagrande', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0817', N'08', N'San Antonio de Oriente', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0818', N'08', N'San Buenaventura', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0819', N'08', N'San Ignacio', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0820', N'08', N'San Juan de Flores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0821', N'08', N'San Miguelito', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0822', N'08', N'Santa Ana', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0823', N'08', N'Santa Lucía', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0824', N'08', N'Talanga', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0825', N'08', N'Tatumbla', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0826', N'08', N'Valle de Ángeles', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0827', N'08', N'Villa de San Francisco', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0828', N'08', N'Vallecillo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0901', N'09', N'Puerto Lempira', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0902', N'09', N'Brus Laguna', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0903', N'09', N'Ahuas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0904', N'09', N'Juan Francisco Bulnes', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0905', N'09', N'Ramón Villeda Morales', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'0906', N'09', N'Wampusirpe', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1001', N'10', N'La Esperanza', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1002', N'10', N'Camasca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1003', N'10', N'Colomoncagua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1004', N'10', N'Concepción', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1005', N'10', N'Dolores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1006', N'10', N'Intibucá', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1007', N'10', N'Jesús de Otoro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1008', N'10', N'Magdalena', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1009', N'10', N'Masaguara', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1010', N'10', N'San Antonio', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1011', N'10', N'San IsIdro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1012', N'10', N'San Juan', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1013', N'10', N'San Marcos de la Sierra', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1014', N'10', N'San Miguel Guancapla', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1015', N'10', N'Santa Lucía', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1016', N'10', N'Yamaranguila', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1017', N'10', N'San Francisco de Opalaca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1101', N'11', N'Roatán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1102', N'11', N'Guanaja', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1103', N'11', N'José Santos Guardiola', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1104', N'11', N'Utila', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1201', N'12', N'La Paz', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1202', N'12', N'Aguanqueterique', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1203', N'12', N'Cabañas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1204', N'12', N'Cane', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1205', N'12', N'Chinacla', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1206', N'12', N'Guajiquiro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1207', N'12', N'Lauterique', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1208', N'12', N'Marcala', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1209', N'12', N'Mercedes de Oriente', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1210', N'12', N'Opatoro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1211', N'12', N'San Antonio del Norte', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1212', N'12', N'San José', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1213', N'12', N'San Juan', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1214', N'12', N'San Pedro de Tutule', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1215', N'12', N'Santa Ana', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1216', N'12', N'Santa Elena', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1217', N'12', N'Santa María', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1218', N'12', N'Santiago de Puringla', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1219', N'12', N'Yarula', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1301', N'13', N'Gracias', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1302', N'13', N'Belén', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1303', N'13', N'Candelaria', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1304', N'13', N'Cololaca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1305', N'13', N'Erandique', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1306', N'13', N'Gualcince', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1307', N'13', N'Guarita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1308', N'13', N'La Campa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1309', N'13', N'La Iguala', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1310', N'13', N'Las Flores', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1311', N'13', N'La Unión', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1312', N'13', N'La Virtud', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1313', N'13', N'Lepaera', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1314', N'13', N'Mapulaca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1315', N'13', N'Piraera', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1316', N'13', N'San Andrés', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1317', N'13', N'San Francisco', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
GO
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1318', N'13', N'San Juan Guarita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1319', N'13', N'San Manuel Colohete', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1320', N'13', N'San Rafael', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1321', N'13', N'San Sebastián', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1322', N'13', N'Santa Cruz', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1323', N'13', N'Talgua', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1324', N'13', N'Tambla', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1325', N'13', N'Tomalá', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1326', N'13', N'ValladolId', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1327', N'13', N'Virginia', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1328', N'13', N'San Marcos de Caiquín', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1401', N'14', N'Ocotepeque', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1402', N'14', N'Belén Gualcho', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1403', N'14', N'Concepción', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1404', N'14', N'Dolores Merendón', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1405', N'14', N'FraternIdad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1406', N'14', N'La Encarnación', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1407', N'14', N'La Labor', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1408', N'14', N'Lucerna', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1409', N'14', N'Mercedes', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1410', N'14', N'San Fernando', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1411', N'14', N'San Francisco del Valle', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1412', N'14', N'San Jorge', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1413', N'14', N'San Marcos', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1414', N'14', N'Santa Fe', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1415', N'14', N'Sensenti', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1416', N'14', N'Sinuapa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1501', N'15', N'Juticalpa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1502', N'15', N'Campamento', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1503', N'15', N'Catacamas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1504', N'15', N'Concordia', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1505', N'15', N'Dulce Nombre de Culmí', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1506', N'15', N'El Rosario', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1507', N'15', N'Esquipulas del Norte', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1508', N'15', N'Gualaco', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1509', N'15', N'Guarizama', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1510', N'15', N'Guata', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1511', N'15', N'Guayape', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1512', N'15', N'Jano', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1513', N'15', N'La Unión', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1514', N'15', N'Mangulile', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1515', N'15', N'Manto', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1516', N'15', N'Salamá', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1517', N'15', N'San Esteban', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1518', N'15', N'San Francisco de Becerra', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1519', N'15', N'San Francisco de la Paz', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1520', N'15', N'Santa María del Real', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1521', N'15', N'Silca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1522', N'15', N'Yocón', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1523', N'15', N'Patuca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1601', N'16', N'Santa Bárbara', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1602', N'16', N'Arada', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1603', N'16', N'Atima', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1604', N'16', N'Azacualpa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1605', N'16', N'Ceguaca', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1606', N'16', N'Concepción del Norte', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1607', N'16', N'Concepción del Sur', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1608', N'16', N'Chinda', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1609', N'16', N'El Níspero', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1610', N'16', N'Gualala', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1611', N'16', N'Ilama', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1612', N'16', N'Las Vegas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1613', N'16', N'Macuelizo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1614', N'16', N'Naranjito', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1615', N'16', N'Nuevo Celilac', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1616', N'16', N'Nueva Frontera', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1617', N'16', N'Petoa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1618', N'16', N'Protección', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1619', N'16', N'Quimistán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1620', N'16', N'San Francisco de Ojuera', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1621', N'16', N'San José de las Colinas', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1622', N'16', N'San Luis', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1623', N'16', N'San Marcos', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1624', N'16', N'San Nicolás', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1625', N'16', N'San Pedro Zacapa', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1626', N'16', N'San Vicente Centenario', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1627', N'16', N'Santa Rita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1628', N'16', N'TrinIdad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1701', N'17', N'Nacaome', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1702', N'17', N'Alianza', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1703', N'17', N'Amapala', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1704', N'17', N'Aramecina', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1705', N'17', N'CarIdad', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1706', N'17', N'Goascorán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1707', N'17', N'Langue', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1708', N'17', N'San Francisco de Coray', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1709', N'17', N'San Lorenzo', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1801', N'18', N'Yoro', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1802', N'18', N'Arenal', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1803', N'18', N'El Negrito', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1804', N'18', N'El Progreso', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1805', N'18', N'Jocón', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1806', N'18', N'Morazán', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1807', N'18', N'Olanchito', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1808', N'18', N'Santa Rita', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1809', N'18', N'Sulaco', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1810', N'18', N'Victoria', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
INSERT [gral].[tbMunicipios] ([muni_Id], [dept_Id], [muni_Descripcion], [muni_Estado], [muni_UserCrea], [muni_FechaCrea], [muni_UserModifica], [muni_FechaModifica]) VALUES (N'1811', N'18', N'Yorito', 1, 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime), 1, CAST(N'2023-03-02T08:01:28.720' AS DateTime))
GO
SET IDENTITY_INSERT [kujo].[tbCategorias] ON 

INSERT [kujo].[tbCategorias] ([cate_Id], [cate_Descripcion], [cate_UserCrea], [cate_FechaCreacion], [cate_UserModifica], [cate_FechaModificacion], [cate_Estado]) VALUES (1, N'Telefonía', 1, CAST(N'2023-04-06T19:27:31.890' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbCategorias] ([cate_Id], [cate_Descripcion], [cate_UserCrea], [cate_FechaCreacion], [cate_UserModifica], [cate_FechaModificacion], [cate_Estado]) VALUES (2, N'Cobertores', 1, CAST(N'2023-04-06T19:27:31.890' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbCategorias] ([cate_Id], [cate_Descripcion], [cate_UserCrea], [cate_FechaCreacion], [cate_UserModifica], [cate_FechaModificacion], [cate_Estado]) VALUES (3, N'Cargadores y Cables', 1, CAST(N'2023-04-06T19:27:31.890' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbCategorias] ([cate_Id], [cate_Descripcion], [cate_UserCrea], [cate_FechaCreacion], [cate_UserModifica], [cate_FechaModificacion], [cate_Estado]) VALUES (4, N'Vidrios Templados', 1, CAST(N'2023-04-06T19:27:31.890' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbCategorias] ([cate_Id], [cate_Descripcion], [cate_UserCrea], [cate_FechaCreacion], [cate_UserModifica], [cate_FechaModificacion], [cate_Estado]) VALUES (5, N'Almacenamiento', 1, CAST(N'2023-04-06T19:27:31.890' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [kujo].[tbCategorias] OFF
GO
SET IDENTITY_INSERT [kujo].[tbClientes] ON 

INSERT [kujo].[tbClientes] ([clie_Id], [clie_Nombres], [clie_ApellIdos], [clie_FechaNacimiento], [clie_Sexo], [estc_Id], [clie_Telefeno], [muni_Id], [clie_Direccion], [clie_Estado], [clie_UserCrea], [clie_FechaCreacion], [clie_UserModifica], [clie_FechaModificacion]) VALUES (1, N'Isaac', N'Gomez', CAST(N'2005-02-01' AS Date), N'M', 1, N'98129299', N'0501', N'SPS', 1, 1, CAST(N'2023-04-06T19:27:32.847' AS DateTime), 10, CAST(N'2023-04-09T04:54:54.337' AS DateTime))
INSERT [kujo].[tbClientes] ([clie_Id], [clie_Nombres], [clie_ApellIdos], [clie_FechaNacimiento], [clie_Sexo], [estc_Id], [clie_Telefeno], [muni_Id], [clie_Direccion], [clie_Estado], [clie_UserCrea], [clie_FechaCreacion], [clie_UserModifica], [clie_FechaModificacion]) VALUES (2, N'Alexander', N'Aguilar', CAST(N'2005-10-01' AS Date), N'M', 1, N'33201809', N'0501', N'SPS', 1, 1, CAST(N'2023-04-06T19:27:32.847' AS DateTime), NULL, NULL)
INSERT [kujo].[tbClientes] ([clie_Id], [clie_Nombres], [clie_ApellIdos], [clie_FechaNacimiento], [clie_Sexo], [estc_Id], [clie_Telefeno], [muni_Id], [clie_Direccion], [clie_Estado], [clie_UserCrea], [clie_FechaCreacion], [clie_UserModifica], [clie_FechaModificacion]) VALUES (3, N'Selvin', N'Medina', CAST(N'2005-06-01' AS Date), N'M', 1, N'98826754', N'0511', N'SPS', 1, 1, CAST(N'2023-04-06T19:27:32.847' AS DateTime), 10, CAST(N'2023-04-09T04:54:03.620' AS DateTime))
INSERT [kujo].[tbClientes] ([clie_Id], [clie_Nombres], [clie_ApellIdos], [clie_FechaNacimiento], [clie_Sexo], [estc_Id], [clie_Telefeno], [muni_Id], [clie_Direccion], [clie_Estado], [clie_UserCrea], [clie_FechaCreacion], [clie_UserModifica], [clie_FechaModificacion]) VALUES (4, N'Alexa', N'Toledo', CAST(N'2005-06-01' AS Date), N'F', 1, N'98826754', N'0501', N'SPS', 1, 1, CAST(N'2023-04-06T19:27:32.847' AS DateTime), NULL, NULL)
INSERT [kujo].[tbClientes] ([clie_Id], [clie_Nombres], [clie_ApellIdos], [clie_FechaNacimiento], [clie_Sexo], [estc_Id], [clie_Telefeno], [muni_Id], [clie_Direccion], [clie_Estado], [clie_UserCrea], [clie_FechaCreacion], [clie_UserModifica], [clie_FechaModificacion]) VALUES (5, N'Lindesey beauty', N'Lohan', CAST(N'2005-06-01' AS Date), N'F', 1, N'98826754', N'0501', N'SPS', 1, 1, CAST(N'2023-04-06T19:27:32.847' AS DateTime), 10, CAST(N'2023-04-09T04:28:05.963' AS DateTime))
INSERT [kujo].[tbClientes] ([clie_Id], [clie_Nombres], [clie_ApellIdos], [clie_FechaNacimiento], [clie_Sexo], [estc_Id], [clie_Telefeno], [muni_Id], [clie_Direccion], [clie_Estado], [clie_UserCrea], [clie_FechaCreacion], [clie_UserModifica], [clie_FechaModificacion]) VALUES (6, N'Prueba', N'DOS', CAST(N'2023-04-09' AS Date), N'M', 4, N'98129299', N'1701', N'Alianza', 1, 2, CAST(N'2023-04-09T02:04:09.600' AS DateTime), NULL, NULL)
INSERT [kujo].[tbClientes] ([clie_Id], [clie_Nombres], [clie_ApellIdos], [clie_FechaNacimiento], [clie_Sexo], [estc_Id], [clie_Telefeno], [muni_Id], [clie_Direccion], [clie_Estado], [clie_UserCrea], [clie_FechaCreacion], [clie_UserModifica], [clie_FechaModificacion]) VALUES (7, N'Lindesey beauty', N'DOS', CAST(N'2023-04-29' AS Date), N'F', 1, N'98129299', N'1214', N'Alianza', 1, 10, CAST(N'2023-04-09T04:28:54.430' AS DateTime), 10, CAST(N'2023-04-09T04:29:21.263' AS DateTime))
SET IDENTITY_INSERT [kujo].[tbClientes] OFF
GO
SET IDENTITY_INSERT [kujo].[tbEmpleados] ON 

INSERT [kujo].[tbEmpleados] ([empl_Id], [empl_Nombres], [empl_ApellIdos], [empl_FechaNacimiento], [empl_Sexo], [estc_Id], [empl_Telefeno], [muni_Id], [empl_Direccion], [sucu_Id], [empl_Estado], [empl_UserCrea], [empl_FechaCreacion], [empl_UserModifica], [empl_FechaModificacion]) VALUES (1, N'Jafet', N'Gomez', CAST(N'2005-02-01' AS Date), N'M', 1, N'98129299', N'0501', N'SPS', 1, 1, 1, CAST(N'2023-04-06T19:27:32.790' AS DateTime), NULL, NULL)
INSERT [kujo].[tbEmpleados] ([empl_Id], [empl_Nombres], [empl_ApellIdos], [empl_FechaNacimiento], [empl_Sexo], [estc_Id], [empl_Telefeno], [muni_Id], [empl_Direccion], [sucu_Id], [empl_Estado], [empl_UserCrea], [empl_FechaCreacion], [empl_UserModifica], [empl_FechaModificacion]) VALUES (2, N'Cristian', N'Aguilar', CAST(N'2005-10-01' AS Date), N'M', 1, N'33201809', N'0501', N'SPS', 1, 1, 1, CAST(N'2023-04-06T19:27:32.790' AS DateTime), NULL, NULL)
INSERT [kujo].[tbEmpleados] ([empl_Id], [empl_Nombres], [empl_ApellIdos], [empl_FechaNacimiento], [empl_Sexo], [estc_Id], [empl_Telefeno], [muni_Id], [empl_Direccion], [sucu_Id], [empl_Estado], [empl_UserCrea], [empl_FechaCreacion], [empl_UserModifica], [empl_FechaModificacion]) VALUES (3, N'Julyssa', N'Medina', CAST(N'2005-06-01' AS Date), N'F', 2, N'98826754', N'0501', N'Tegucigalpa', 2, 1, 1, CAST(N'2023-04-06T19:27:32.790' AS DateTime), NULL, NULL)
INSERT [kujo].[tbEmpleados] ([empl_Id], [empl_Nombres], [empl_ApellIdos], [empl_FechaNacimiento], [empl_Sexo], [estc_Id], [empl_Telefeno], [muni_Id], [empl_Direccion], [sucu_Id], [empl_Estado], [empl_UserCrea], [empl_FechaCreacion], [empl_UserModifica], [empl_FechaModificacion]) VALUES (4, N'Carlos', N'Ruiz', CAST(N'2005-06-01' AS Date), N'M', 2, N'97630978', N'0501', N'Tegucigalpa', 2, 1, 1, CAST(N'2023-04-06T19:27:32.790' AS DateTime), NULL, NULL)
INSERT [kujo].[tbEmpleados] ([empl_Id], [empl_Nombres], [empl_ApellIdos], [empl_FechaNacimiento], [empl_Sexo], [estc_Id], [empl_Telefeno], [muni_Id], [empl_Direccion], [sucu_Id], [empl_Estado], [empl_UserCrea], [empl_FechaCreacion], [empl_UserModifica], [empl_FechaModificacion]) VALUES (5, N'Daniel', N'Espinoza', CAST(N'2005-06-01' AS Date), N'M', 3, N'32789739', N'0501', N'Tela', 3, 1, 1, CAST(N'2023-04-06T19:27:32.790' AS DateTime), NULL, NULL)
INSERT [kujo].[tbEmpleados] ([empl_Id], [empl_Nombres], [empl_ApellIdos], [empl_FechaNacimiento], [empl_Sexo], [estc_Id], [empl_Telefeno], [muni_Id], [empl_Direccion], [sucu_Id], [empl_Estado], [empl_UserCrea], [empl_FechaCreacion], [empl_UserModifica], [empl_FechaModificacion]) VALUES (6, N'Chris', N'Aguilar', CAST(N'2005-06-01' AS Date), N'M', 3, N'56452809', N'0501', N'La Ceiba', 3, 1, 1, CAST(N'2023-04-06T19:27:32.790' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [kujo].[tbEmpleados] OFF
GO
SET IDENTITY_INSERT [kujo].[tbFacturas] ON 

INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (1, 1, 2, CAST(N'2023-04-07T18:21:06.383' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T18:21:06.383' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (2, 2, 3, CAST(N'2023-04-07T18:21:36.520' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T18:21:36.520' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (3, 3, 1, CAST(N'2023-04-07T18:21:36.520' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T18:21:36.520' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (4, 4, 1, CAST(N'2023-04-07T19:51:16.593' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T19:51:16.593' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (5, 2, 1, CAST(N'2023-04-07T20:58:28.380' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T20:58:28.380' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (6, 1, 3, CAST(N'2023-04-07T21:00:50.420' AS DateTime), 1, 1, 3, CAST(N'2023-04-07T21:00:50.420' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (7, 1, 2, CAST(N'2023-04-07T21:03:18.910' AS DateTime), 1, 1, 2, CAST(N'2023-04-07T21:03:18.910' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (8, 1, 3, CAST(N'2023-04-07T21:09:23.747' AS DateTime), 1, 1, 3, CAST(N'2023-04-07T21:09:23.747' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (9, 1, 3, CAST(N'2023-04-07T21:11:52.553' AS DateTime), 1, 1, 3, CAST(N'2023-04-07T21:11:52.553' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (10, 1, 2, CAST(N'2023-04-07T21:21:14.440' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T21:21:14.440' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (11, 1, 2, CAST(N'2023-04-07T21:21:30.103' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T21:21:30.103' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (12, 2, 3, CAST(N'2023-04-07T21:21:30.103' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T21:21:30.103' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (13, 4, 1, CAST(N'2023-04-07T21:21:30.107' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T21:21:30.107' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (14, 1, 2, CAST(N'2023-04-07T21:28:12.000' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T21:28:12.000' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (15, 2, 2, CAST(N'2023-04-07T21:30:05.637' AS DateTime), 1, 1, 2, CAST(N'2023-04-07T21:30:05.637' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (16, 1, 2, CAST(N'2023-04-07T21:34:56.930' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T21:34:56.930' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (17, 4, 1, CAST(N'2023-04-07T21:55:40.063' AS DateTime), 1, 1, 1, CAST(N'2023-04-07T21:55:40.063' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (18, 4, 4, CAST(N'2023-04-07T22:00:43.400' AS DateTime), 1, 0, 1, CAST(N'2023-04-07T22:00:43.400' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (19, 1, 1, CAST(N'2023-04-08T17:09:55.970' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T17:09:55.970' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (20, 1, 1, CAST(N'2023-04-08T17:10:15.007' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T17:10:15.007' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (21, 4, 1, CAST(N'2023-04-08T17:18:14.017' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T17:18:14.017' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (22, 5, 1, CAST(N'2023-04-08T17:21:00.727' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T17:21:00.727' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (23, 2, 1, CAST(N'2023-04-08T17:54:42.137' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T17:54:42.137' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (24, 2, 1, CAST(N'2023-04-08T17:55:28.310' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T17:55:28.310' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (25, 5, 1, CAST(N'2023-04-08T18:01:22.170' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T18:01:22.170' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (26, 5, 1, CAST(N'2023-04-08T18:02:32.907' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T18:02:32.907' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (27, 3, 1, CAST(N'2023-04-08T18:08:12.083' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T18:08:12.083' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (28, 5, 1, CAST(N'2023-04-08T18:15:17.690' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T18:15:17.690' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (29, 4, 1, CAST(N'2023-04-08T18:19:04.733' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T18:19:04.733' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (30, 2, 3, CAST(N'2023-04-08T21:53:43.167' AS DateTime), 1, 1, 1, CAST(N'2023-04-08T21:53:43.167' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (31, 5, 1, CAST(N'2023-04-08T22:45:37.230' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T22:45:37.230' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (32, 4, 1, CAST(N'2023-04-08T22:51:39.687' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T22:51:39.687' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (33, 2, 1, CAST(N'2023-04-08T22:58:12.167' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T22:58:12.167' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (34, 2, 1, CAST(N'2023-04-08T23:00:04.023' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T23:00:04.023' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (35, 1, 1, CAST(N'2023-04-08T23:18:55.573' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T23:18:55.573' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (36, 4, 1, CAST(N'2023-04-08T23:49:15.740' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T23:49:15.740' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (37, 4, 1, CAST(N'2023-04-08T23:52:02.513' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T23:52:02.513' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (38, 5, 1, CAST(N'2023-04-08T23:56:20.893' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T23:56:20.893' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (39, 5, 1, CAST(N'2023-04-08T23:59:45.497' AS DateTime), 1, 1, 2, CAST(N'2023-04-08T23:59:45.497' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (40, 3, 1, CAST(N'2023-04-09T00:56:02.443' AS DateTime), 1, 1, 2, CAST(N'2023-04-09T00:56:02.443' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (41, 4, 1, CAST(N'2023-04-09T01:00:00.450' AS DateTime), 1, 1, 2, CAST(N'2023-04-09T01:00:00.450' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (42, 5, 1, CAST(N'2023-04-09T01:51:25.817' AS DateTime), 1, 1, 2, CAST(N'2023-04-09T01:51:25.817' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (43, 2, 1, CAST(N'2023-04-09T02:19:05.933' AS DateTime), 1, 1, 2, CAST(N'2023-04-09T02:19:05.933' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (44, 4, 1, CAST(N'2023-04-09T02:22:01.923' AS DateTime), 1, 1, 2, CAST(N'2023-04-09T02:22:01.923' AS DateTime), NULL, NULL)
INSERT [kujo].[tbFacturas] ([fact_Id], [clie_Id], [empl_Id], [fact_fechacompra], [fact_estadocompra], [fact_Estado], [fact_UserCrea], [fact_FechaCreacion], [fact_UserModifica], [fact_FechaModificacion]) VALUES (45, 5, 3, CAST(N'2023-04-09T14:17:22.667' AS DateTime), 1, 1, 10, CAST(N'2023-04-09T14:17:22.667' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [kujo].[tbFacturas] OFF
GO
SET IDENTITY_INSERT [kujo].[tbFacturasDetalles] ON 

INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (1, 1, 1, CAST(1000.00 AS Decimal(18, 2)), 10, 1, CAST(N'2023-04-07T18:26:50.833' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (2, 2, 4, CAST(1000.00 AS Decimal(18, 2)), 5, 1, CAST(N'2023-04-06T18:26:50.867' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (3, 3, 5, CAST(1000.00 AS Decimal(18, 2)), 67, 1, CAST(N'2023-04-07T18:26:50.867' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (5, 2, 4, CAST(1000.00 AS Decimal(18, 2)), 5, 1, CAST(N'2023-04-08T21:54:06.150' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (6, 2, 4, CAST(1000.00 AS Decimal(18, 2)), 5, 1, CAST(N'2023-04-08T21:54:07.697' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (7, 2, 1, CAST(100.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-08T21:59:17.910' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (8, 31, 7, CAST(1400.00 AS Decimal(18, 2)), 6, 2, CAST(N'2023-04-08T22:47:26.060' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (9, 31, 7, CAST(1400.00 AS Decimal(18, 2)), 6, 2, CAST(N'2023-04-08T22:47:46.910' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (10, 32, 2, CAST(1400.00 AS Decimal(18, 2)), 3, 2, CAST(N'2023-04-08T22:51:57.237' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (11, 33, 19, CAST(1800.00 AS Decimal(18, 2)), 8, 2, CAST(N'2023-04-08T22:58:41.850' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (12, 34, 7, CAST(1400.00 AS Decimal(18, 2)), 8, 2, CAST(N'2023-04-08T23:00:25.130' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (13, 34, 5, CAST(1400.00 AS Decimal(18, 2)), 2, 2, CAST(N'2023-04-08T23:01:06.510' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (14, 35, 16, CAST(1800.00 AS Decimal(18, 2)), 3, 2, CAST(N'2023-04-08T23:19:29.887' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (15, 35, 20, CAST(1800.00 AS Decimal(18, 2)), 1, 2, CAST(N'2023-04-08T23:19:37.490' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (16, 36, 18, CAST(1800.00 AS Decimal(18, 2)), 8, 2, CAST(N'2023-04-08T23:49:38.913' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (17, 37, 3, CAST(1400.00 AS Decimal(18, 2)), 9, 2, CAST(N'2023-04-08T23:52:14.570' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (18, 37, 10, CAST(1400.00 AS Decimal(18, 2)), 3, 2, CAST(N'2023-04-08T23:53:01.297' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (19, 37, 10, CAST(1400.00 AS Decimal(18, 2)), 3, 2, CAST(N'2023-04-08T23:53:23.053' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (20, 37, 19, CAST(1800.00 AS Decimal(18, 2)), 2, 2, CAST(N'2023-04-08T23:53:44.747' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (21, 37, 16, CAST(1800.00 AS Decimal(18, 2)), 3, 2, CAST(N'2023-04-08T23:54:58.270' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (22, 38, 19, CAST(1800.00 AS Decimal(18, 2)), 4, 2, CAST(N'2023-04-08T23:56:27.603' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (23, 39, 5, CAST(1400.00 AS Decimal(18, 2)), 3, 2, CAST(N'2023-04-09T00:00:10.590' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (24, 41, 3, CAST(1400.00 AS Decimal(18, 2)), 5, 2, CAST(N'2023-04-09T01:00:16.833' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (25, 41, 6, CAST(1400.00 AS Decimal(18, 2)), 2, 2, CAST(N'2023-04-09T01:01:29.513' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (26, 42, 8, CAST(1000.00 AS Decimal(18, 2)), 4, 2, CAST(N'2023-04-09T01:51:44.913' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (27, 42, 11, CAST(1400.00 AS Decimal(18, 2)), 4, 2, CAST(N'2023-04-09T01:52:40.917' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (28, 42, 1, CAST(1400.00 AS Decimal(18, 2)), 7, 2, CAST(N'2023-04-09T01:54:06.950' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (29, 42, 20, CAST(1800.00 AS Decimal(18, 2)), 4, 2, CAST(N'2023-04-09T01:55:28.990' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (30, 42, 9, CAST(1400.00 AS Decimal(18, 2)), 1, 2, CAST(N'2023-04-09T01:55:53.723' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (31, 42, 19, CAST(1800.00 AS Decimal(18, 2)), 5, 2, CAST(N'2023-04-09T02:00:15.093' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (32, 42, 13, CAST(2000.00 AS Decimal(18, 2)), 3, 2, CAST(N'2023-04-09T02:00:22.150' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (33, 42, 11, CAST(1400.00 AS Decimal(18, 2)), 2, 2, CAST(N'2023-04-09T02:00:30.790' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (34, 42, 11, CAST(1400.00 AS Decimal(18, 2)), 7, 2, CAST(N'2023-04-09T02:00:39.407' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (35, 42, 19, CAST(1800.00 AS Decimal(18, 2)), 9, 2, CAST(N'2023-04-09T02:00:45.837' AS DateTime), NULL, NULL, 0)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (36, 42, 8, CAST(1000.00 AS Decimal(18, 2)), 1, 2, CAST(N'2023-04-09T02:00:53.373' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (37, 43, 5, CAST(1400.00 AS Decimal(18, 2)), 1, 2, CAST(N'2023-04-09T02:19:19.460' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (38, 44, 4, CAST(1400.00 AS Decimal(18, 2)), 3, 2, CAST(N'2023-04-09T02:22:24.093' AS DateTime), NULL, NULL, 0)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (39, 44, 11, CAST(1400.00 AS Decimal(18, 2)), 5, 2, CAST(N'2023-04-09T02:23:14.377' AS DateTime), NULL, NULL, 1)
INSERT [kujo].[tbFacturasDetalles] ([facd_Id], [fact_Id], [prod_Id], [facd_PrecioUnitario], [prod_Cantidad], [facd_UserCrea], [facd_FechaCreacion], [facd_UserModifica], [facd_FechaModificacion], [facd_Estado]) VALUES (40, 45, 16, CAST(1800.00 AS Decimal(18, 2)), 1, 10, CAST(N'2023-04-09T14:17:32.383' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [kujo].[tbFacturasDetalles] OFF
GO
SET IDENTITY_INSERT [kujo].[tbProductos] ON 

INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (1, N'Samsung S22 5G', 1, 1, 992, CAST(1400.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (2, N'Iphone 14', 1, 1, 997, CAST(1400.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (3, N'Iphone 14 Pro Max', 1, 1, 986, CAST(1400.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (4, N'Samusung S21 FE', 1, 1, 990, CAST(1400.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (5, N'Iphone 13', 1, 1, 994, CAST(1400.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (6, N'Iphone 12', 1, 1, 998, CAST(1400.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (7, N'Samsung A80', 1, 1, 980, CAST(1400.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (8, N'Cobertor de Silicon Samsung S22 5G', 2, 1, 995, CAST(1000.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (9, N'Cobertor de Silicon Iphone 14', 2, 1, 999, CAST(1400.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (10, N'Cobertor de Silicon Iphone 14 Pro Max', 2, 1, 994, CAST(1400.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (11, N'Cargador tipo USB C', 3, 1, 982, CAST(1400.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (12, N'Cable USB B a USB C', 3, 1, 1000, CAST(1400.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (13, N'Cable USB B a micro USB ', 3, 1, 997, CAST(2000.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (14, N'Cable HDMI', 3, 1, 1000, CAST(1300.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (15, N'Vidrio Templado Samsung S22', 4, 1, 1000, CAST(1800.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (16, N'Vidrio Templado Iphone 14', 4, 1, 993, CAST(1800.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (17, N'Vidrio Templado Iphone 14 Pro Max', 4, 1, 1000, CAST(1800.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (18, N'Memoria SD 16 GB ', 5, 1, 992, CAST(1800.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (19, N'Memoria SD 124 GB', 5, 1, 981, CAST(1800.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (20, N'Memoria SD 256 GB', 5, 1, 995, CAST(1800.00 AS Decimal(18, 2)), 1, 1, CAST(N'2023-04-06T19:27:32.317' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProductos] ([prod_Id], [prod_Descripcion], [cate_Id], [prov_Id], [prod_Stock], [prod_Precio], [prod_Estado], [prod_UserCrea], [prod_FechaCreacion], [prod_UserModifica], [prod_FechaModificacion]) VALUES (21, N'Prueba y Error', 2, 1, 200, CAST(500.00 AS Decimal(18, 2)), 1, 10, CAST(N'2023-04-09T04:57:22.520' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [kujo].[tbProductos] OFF
GO
SET IDENTITY_INSERT [kujo].[tbProveedores] ON 

INSERT [kujo].[tbProveedores] ([prov_Id], [prov_Nombre], [prov_Contacto], [muni_Id], [prov_Direccion], [prov_Estado], [prov_UserCrea], [prov_FechaCreacion], [prov_UserModifica], [prov_FechaModificacion]) VALUES (1, N'Importadora Gisselle', N'Javiera Paz', N'0801', N'Azacualpa', 1, 1, CAST(N'2023-04-06T19:27:32.100' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProveedores] ([prov_Id], [prov_Nombre], [prov_Contacto], [muni_Id], [prov_Direccion], [prov_Estado], [prov_UserCrea], [prov_FechaCreacion], [prov_UserModifica], [prov_FechaModificacion]) VALUES (2, N'Samsung Honduras', N'Cristal Molly', N'0501', N'Barrio Medina', 1, 1, CAST(N'2023-04-06T19:27:32.100' AS DateTime), NULL, NULL)
INSERT [kujo].[tbProveedores] ([prov_Id], [prov_Nombre], [prov_Contacto], [muni_Id], [prov_Direccion], [prov_Estado], [prov_UserCrea], [prov_FechaCreacion], [prov_UserModifica], [prov_FechaModificacion]) VALUES (3, N'IPlace', N'Julliette Moore', N'0101', N'La Ceiba', 1, 1, CAST(N'2023-04-06T19:27:32.100' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [kujo].[tbProveedores] OFF
GO
SET IDENTITY_INSERT [kujo].[tbSucursales] ON 

INSERT [kujo].[tbSucursales] ([sucu_Id], [sucu_Nombre], [muni_Id], [sucu_Direccion], [sucu_Estado], [sucu_UserCrea], [sucu_FechaCreacion], [sucu_UserModifica], [sucu_FechaModificacion]) VALUES (1, N'Jojo´s Sucursal SPS', N'0501', N'SPS', 1, 1, CAST(N'2023-04-06T19:27:32.473' AS DateTime), NULL, NULL)
INSERT [kujo].[tbSucursales] ([sucu_Id], [sucu_Nombre], [muni_Id], [sucu_Direccion], [sucu_Estado], [sucu_UserCrea], [sucu_FechaCreacion], [sucu_UserModifica], [sucu_FechaModificacion]) VALUES (2, N'Jojo´s Sucursal DC', N'0801', N'Tegucigalpa', 1, 1, CAST(N'2023-04-06T19:27:32.473' AS DateTime), NULL, NULL)
INSERT [kujo].[tbSucursales] ([sucu_Id], [sucu_Nombre], [muni_Id], [sucu_Direccion], [sucu_Estado], [sucu_UserCrea], [sucu_FechaCreacion], [sucu_UserModifica], [sucu_FechaModificacion]) VALUES (3, N'Jojo´s Sucursal La Ceiba', N'0101', N'La Ceiba', 1, 1, CAST(N'2023-04-06T19:27:32.473' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [kujo].[tbSucursales] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_acce_tbPantallas_pant_href]    Script Date: 9/4/2023 08:34:24 PM ******/
ALTER TABLE [acce].[tbPantallas] ADD  CONSTRAINT [UQ_acce_tbPantallas_pant_href] UNIQUE NONCLUSTERED 
(
	[pant_href] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_acce_tbPantallas_pant_Identificador]    Script Date: 9/4/2023 08:34:24 PM ******/
ALTER TABLE [acce].[tbPantallas] ADD  CONSTRAINT [UQ_acce_tbPantallas_pant_Identificador] UNIQUE NONCLUSTERED 
(
	[pant_Identificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_acce_tbPantallas_pant_Nombre]    Script Date: 9/4/2023 08:34:24 PM ******/
ALTER TABLE [acce].[tbPantallas] ADD  CONSTRAINT [UQ_acce_tbPantallas_pant_Nombre] UNIQUE NONCLUSTERED 
(
	[pant_Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_role_tbRoles_role_Descripcion]    Script Date: 9/4/2023 08:34:24 PM ******/
ALTER TABLE [acce].[tbRoles] ADD  CONSTRAINT [UQ_role_tbRoles_role_Descripcion] UNIQUE NONCLUSTERED 
(
	[role_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_acce_tbUsuarios_user_NombreUsuario]    Script Date: 9/4/2023 08:34:24 PM ******/
ALTER TABLE [acce].[tbUsuarios] ADD  CONSTRAINT [UQ_acce_tbUsuarios_user_NombreUsuario] UNIQUE NONCLUSTERED 
(
	[user_NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_gral_tbDepartamentos_dept_Descripcion]    Script Date: 9/4/2023 08:34:24 PM ******/
ALTER TABLE [gral].[tbDepartamentos] ADD  CONSTRAINT [UQ_gral_tbDepartamentos_dept_Descripcion] UNIQUE NONCLUSTERED 
(
	[dept_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_gral_tbEstadosCiviles_estc_Descripcion]    Script Date: 9/4/2023 08:34:24 PM ******/
ALTER TABLE [gral].[tbEstadosCiviles] ADD  CONSTRAINT [UQ_gral_tbEstadosCiviles_estc_Descripcion] UNIQUE NONCLUSTERED 
(
	[estc_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [acce].[tbPantallas] ADD  DEFAULT ((1)) FOR [pant_Estado]
GO
ALTER TABLE [acce].[tbPantallas] ADD  DEFAULT (getdate()) FOR [pant_FechaCrea]
GO
ALTER TABLE [acce].[tbPantallasPorRol] ADD  DEFAULT ((1)) FOR [pantrol_Estado]
GO
ALTER TABLE [acce].[tbPantallasPorRol] ADD  DEFAULT (getdate()) FOR [pantrol_FechaCrea]
GO
ALTER TABLE [acce].[tbRoles] ADD  DEFAULT ((1)) FOR [role_Estado]
GO
ALTER TABLE [acce].[tbRoles] ADD  DEFAULT (getdate()) FOR [role_FechaCrea]
GO
ALTER TABLE [acce].[tbUsuarios] ADD  DEFAULT ((1)) FOR [user_Estado]
GO
ALTER TABLE [acce].[tbUsuarios] ADD  DEFAULT (getdate()) FOR [user_FechaCrea]
GO
ALTER TABLE [gral].[tbDepartamentos] ADD  DEFAULT ((1)) FOR [dept_Estado]
GO
ALTER TABLE [gral].[tbDepartamentos] ADD  DEFAULT (getdate()) FOR [dept_FechaCrea]
GO
ALTER TABLE [gral].[tbEstadosCiviles] ADD  DEFAULT ((1)) FOR [estc_Estado]
GO
ALTER TABLE [gral].[tbEstadosCiviles] ADD  DEFAULT (getdate()) FOR [estc_FechaCrea]
GO
ALTER TABLE [gral].[tbMunicipios] ADD  DEFAULT ((1)) FOR [muni_Estado]
GO
ALTER TABLE [gral].[tbMunicipios] ADD  DEFAULT (getdate()) FOR [muni_FechaCrea]
GO
ALTER TABLE [kujo].[tbCategorias] ADD  DEFAULT (getdate()) FOR [cate_FechaCreacion]
GO
ALTER TABLE [kujo].[tbCategorias] ADD  DEFAULT ((1)) FOR [cate_Estado]
GO
ALTER TABLE [kujo].[tbClientes] ADD  DEFAULT ((1)) FOR [clie_Estado]
GO
ALTER TABLE [kujo].[tbClientes] ADD  DEFAULT (getdate()) FOR [clie_FechaCreacion]
GO
ALTER TABLE [kujo].[tbEmpleados] ADD  DEFAULT ((1)) FOR [empl_Estado]
GO
ALTER TABLE [kujo].[tbEmpleados] ADD  DEFAULT (getdate()) FOR [empl_FechaCreacion]
GO
ALTER TABLE [kujo].[tbFacturas] ADD  DEFAULT (getdate()) FOR [fact_fechacompra]
GO
ALTER TABLE [kujo].[tbFacturas] ADD  DEFAULT ((1)) FOR [fact_estadocompra]
GO
ALTER TABLE [kujo].[tbFacturas] ADD  DEFAULT ((1)) FOR [fact_Estado]
GO
ALTER TABLE [kujo].[tbFacturas] ADD  DEFAULT (getdate()) FOR [fact_FechaCreacion]
GO
ALTER TABLE [kujo].[tbFacturasDetalles] ADD  DEFAULT (getdate()) FOR [facd_FechaCreacion]
GO
ALTER TABLE [kujo].[tbFacturasDetalles] ADD  DEFAULT ((1)) FOR [facd_Estado]
GO
ALTER TABLE [kujo].[tbProductos] ADD  DEFAULT ((1)) FOR [prod_Estado]
GO
ALTER TABLE [kujo].[tbProductos] ADD  DEFAULT (getdate()) FOR [prod_FechaCreacion]
GO
ALTER TABLE [kujo].[tbProveedores] ADD  DEFAULT ((1)) FOR [prov_Estado]
GO
ALTER TABLE [kujo].[tbProveedores] ADD  DEFAULT (getdate()) FOR [prov_FechaCreacion]
GO
ALTER TABLE [kujo].[tbSucursales] ADD  DEFAULT ((1)) FOR [sucu_Estado]
GO
ALTER TABLE [kujo].[tbSucursales] ADD  DEFAULT (getdate()) FOR [sucu_FechaCreacion]
GO
ALTER TABLE [acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbPantallas_pant_UserCrea_acce_tbUsuarios_user_Id] FOREIGN KEY([pant_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [acce].[tbPantallas] CHECK CONSTRAINT [FK_kujo_tbPantallas_pant_UserCrea_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbPantallas_pant_UserModifica_acce_tbUsuarios_user_Id] FOREIGN KEY([pant_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [acce].[tbPantallas] CHECK CONSTRAINT [FK_kujo_tbPantallas_pant_UserModifica_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [acce].[tbPantallasPorRol]  WITH CHECK ADD  CONSTRAINT [FK_acce_tbPantallasPorRol_tbPantallas_pant_Id] FOREIGN KEY([pant_Id])
REFERENCES [acce].[tbPantallas] ([pant_Id])
GO
ALTER TABLE [acce].[tbPantallasPorRol] CHECK CONSTRAINT [FK_acce_tbPantallasPorRol_tbPantallas_pant_Id]
GO
ALTER TABLE [acce].[tbPantallasPorRol]  WITH CHECK ADD  CONSTRAINT [FK_acce_tbPantallasPorRol_tbRoles_role_Id] FOREIGN KEY([role_Id])
REFERENCES [acce].[tbRoles] ([role_Id])
GO
ALTER TABLE [acce].[tbPantallasPorRol] CHECK CONSTRAINT [FK_acce_tbPantallasPorRol_tbRoles_role_Id]
GO
ALTER TABLE [acce].[tbPantallasPorRol]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbPantallasPorRol_pantrol_UserCrea_acce_tbUsuarios_user_Id] FOREIGN KEY([pantrol_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [acce].[tbPantallasPorRol] CHECK CONSTRAINT [FK_kujo_tbPantallasPorRol_pantrol_UserCrea_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [acce].[tbPantallasPorRol]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbPantallasPorRol_pantrol_UserModifica_acce_tbUsuarios_user_Id] FOREIGN KEY([pantrol_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [acce].[tbPantallasPorRol] CHECK CONSTRAINT [FK_kujo_tbPantallasPorRol_pantrol_UserModifica_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbRoles_role_UserCrea_acce_tbUsuarios_user_Id] FOREIGN KEY([role_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [acce].[tbRoles] CHECK CONSTRAINT [FK_kujo_tbRoles_role_UserCrea_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbRoles_role_UserModifica_acce_tbUsuarios_user_Id] FOREIGN KEY([role_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [acce].[tbRoles] CHECK CONSTRAINT [FK_kujo_tbRoles_role_UserModifica_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_acce_tbUsuarios_tbEmpleados_empl_Id] FOREIGN KEY([empl_Id])
REFERENCES [kujo].[tbEmpleados] ([empl_Id])
GO
ALTER TABLE [acce].[tbUsuarios] CHECK CONSTRAINT [FK_acce_tbUsuarios_tbEmpleados_empl_Id]
GO
ALTER TABLE [acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_acce_tbUsuarios_user_UserCrea_tbUsuarios_user_Id] FOREIGN KEY([user_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [acce].[tbUsuarios] CHECK CONSTRAINT [FK_acce_tbUsuarios_user_UserCrea_tbUsuarios_user_Id]
GO
ALTER TABLE [acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_acce_tbUsuarios_user_UserModifica_tbUsuarios_user_Id] FOREIGN KEY([user_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [acce].[tbUsuarios] CHECK CONSTRAINT [FK_acce_tbUsuarios_user_UserModifica_tbUsuarios_user_Id]
GO
ALTER TABLE [gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [FK_gral_tbDepartamentos_dept_UserCrea_acce_tbUsuarios_user_Id] FOREIGN KEY([dept_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [gral].[tbDepartamentos] CHECK CONSTRAINT [FK_gral_tbDepartamentos_dept_UserCrea_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [FK_gral_tbDepartamentos_dept_UserModifica_acce_tbUsuarios_user_Id] FOREIGN KEY([dept_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [gral].[tbDepartamentos] CHECK CONSTRAINT [FK_gral_tbDepartamentos_dept_UserModifica_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [FK_gral_tbEstadosCiviles_estc_UserCrea_acce_tbUsuarios_user_Id] FOREIGN KEY([estc_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [gral].[tbEstadosCiviles] CHECK CONSTRAINT [FK_gral_tbEstadosCiviles_estc_UserCrea_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [FK_gral_tbEstadosCiviles_estc_UserModifica_acce_tbUsuarios_user_Id] FOREIGN KEY([estc_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [gral].[tbEstadosCiviles] CHECK CONSTRAINT [FK_gral_tbEstadosCiviles_estc_UserModifica_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [FK_gral_tbMunicipios_dept_Id] FOREIGN KEY([dept_Id])
REFERENCES [gral].[tbDepartamentos] ([dept_Id])
GO
ALTER TABLE [gral].[tbMunicipios] CHECK CONSTRAINT [FK_gral_tbMunicipios_dept_Id]
GO
ALTER TABLE [gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [FK_gral_tbMunicipios_muni_UserCrea_acce_tbUsuarios_user_Id] FOREIGN KEY([muni_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [gral].[tbMunicipios] CHECK CONSTRAINT [FK_gral_tbMunicipios_muni_UserCrea_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [FK_gral_tbMunicipios_muni_UserModifica_acce_tbUsuarios_user_Id] FOREIGN KEY([muni_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [gral].[tbMunicipios] CHECK CONSTRAINT [FK_gral_tbMunicipios_muni_UserModifica_acce_tbUsuarios_user_Id]
GO
ALTER TABLE [kujo].[tbCategorias]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbCategorias_UserCrea_usua_Id] FOREIGN KEY([cate_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbCategorias] CHECK CONSTRAINT [FK_kujo_tbCategorias_UserCrea_usua_Id]
GO
ALTER TABLE [kujo].[tbCategorias]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbCategorias_UserModifica_usua_Id] FOREIGN KEY([cate_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbCategorias] CHECK CONSTRAINT [FK_kujo_tbCategorias_UserModifica_usua_Id]
GO
ALTER TABLE [kujo].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbClientes_tbEstadosCiviles_eciv_Id] FOREIGN KEY([estc_Id])
REFERENCES [gral].[tbEstadosCiviles] ([estc_Id])
GO
ALTER TABLE [kujo].[tbClientes] CHECK CONSTRAINT [FK_kujo_tbClientes_tbEstadosCiviles_eciv_Id]
GO
ALTER TABLE [kujo].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbClientes_tbMunicipios_muni_Id] FOREIGN KEY([muni_Id])
REFERENCES [gral].[tbMunicipios] ([muni_Id])
GO
ALTER TABLE [kujo].[tbClientes] CHECK CONSTRAINT [FK_kujo_tbClientes_tbMunicipios_muni_Id]
GO
ALTER TABLE [kujo].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbClientes_UserCrea_usua_Id] FOREIGN KEY([clie_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbClientes] CHECK CONSTRAINT [FK_kujo_tbClientes_UserCrea_usua_Id]
GO
ALTER TABLE [kujo].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbClientes_UserModifica_usua_Id] FOREIGN KEY([clie_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbClientes] CHECK CONSTRAINT [FK_kujo_tbClientes_UserModifica_usua_Id]
GO
ALTER TABLE [kujo].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbEmpleados_tbEstadosCiviles_estc_Id] FOREIGN KEY([estc_Id])
REFERENCES [gral].[tbEstadosCiviles] ([estc_Id])
GO
ALTER TABLE [kujo].[tbEmpleados] CHECK CONSTRAINT [FK_kujo_tbEmpleados_tbEstadosCiviles_estc_Id]
GO
ALTER TABLE [kujo].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbEmpleados_tbMunicipios_muni_Id] FOREIGN KEY([muni_Id])
REFERENCES [gral].[tbMunicipios] ([muni_Id])
GO
ALTER TABLE [kujo].[tbEmpleados] CHECK CONSTRAINT [FK_kujo_tbEmpleados_tbMunicipios_muni_Id]
GO
ALTER TABLE [kujo].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbEmpleados_tbSucursales_sucu_Id] FOREIGN KEY([sucu_Id])
REFERENCES [kujo].[tbSucursales] ([sucu_Id])
GO
ALTER TABLE [kujo].[tbEmpleados] CHECK CONSTRAINT [FK_kujo_tbEmpleados_tbSucursales_sucu_Id]
GO
ALTER TABLE [kujo].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbEmpleados_UserCrea_usua_Id] FOREIGN KEY([empl_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbEmpleados] CHECK CONSTRAINT [FK_kujo_tbEmpleados_UserCrea_usua_Id]
GO
ALTER TABLE [kujo].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbEmpleados_UserModifica_usua_Id] FOREIGN KEY([empl_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbEmpleados] CHECK CONSTRAINT [FK_kujo_tbEmpleados_UserModifica_usua_Id]
GO
ALTER TABLE [kujo].[tbFacturas]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbFacturas_tbClientes_clie_Id] FOREIGN KEY([clie_Id])
REFERENCES [kujo].[tbClientes] ([clie_Id])
GO
ALTER TABLE [kujo].[tbFacturas] CHECK CONSTRAINT [FK_kujo_tbFacturas_tbClientes_clie_Id]
GO
ALTER TABLE [kujo].[tbFacturas]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbFacturas_tbEmpleados_empl_Id] FOREIGN KEY([empl_Id])
REFERENCES [kujo].[tbEmpleados] ([empl_Id])
GO
ALTER TABLE [kujo].[tbFacturas] CHECK CONSTRAINT [FK_kujo_tbFacturas_tbEmpleados_empl_Id]
GO
ALTER TABLE [kujo].[tbFacturas]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbFacturas_UserCrea_usua_Id] FOREIGN KEY([fact_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbFacturas] CHECK CONSTRAINT [FK_kujo_tbFacturas_UserCrea_usua_Id]
GO
ALTER TABLE [kujo].[tbFacturas]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbFacturas_UserModifica_usua_Id] FOREIGN KEY([fact_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbFacturas] CHECK CONSTRAINT [FK_kujo_tbFacturas_UserModifica_usua_Id]
GO
ALTER TABLE [kujo].[tbFacturasDetalles]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbFacturasDetalles_tb_Facturas_fact_Id] FOREIGN KEY([fact_Id])
REFERENCES [kujo].[tbFacturas] ([fact_Id])
GO
ALTER TABLE [kujo].[tbFacturasDetalles] CHECK CONSTRAINT [FK_kujo_tbFacturasDetalles_tb_Facturas_fact_Id]
GO
ALTER TABLE [kujo].[tbFacturasDetalles]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbFacturasDetalles_UserCrea_usua_Id] FOREIGN KEY([facd_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbFacturasDetalles] CHECK CONSTRAINT [FK_kujo_tbFacturasDetalles_UserCrea_usua_Id]
GO
ALTER TABLE [kujo].[tbFacturasDetalles]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbFacturasDetalles_UserModifica_usua_Id] FOREIGN KEY([facd_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbFacturasDetalles] CHECK CONSTRAINT [FK_kujo_tbFacturasDetalles_UserModifica_usua_Id]
GO
ALTER TABLE [kujo].[tbProductos]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbProductod_tbProveedores_prov_Id] FOREIGN KEY([prov_Id])
REFERENCES [kujo].[tbProveedores] ([prov_Id])
GO
ALTER TABLE [kujo].[tbProductos] CHECK CONSTRAINT [FK_kujo_tbProductod_tbProveedores_prov_Id]
GO
ALTER TABLE [kujo].[tbProductos]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbProductos_tbCategorias_cate_Id] FOREIGN KEY([cate_Id])
REFERENCES [kujo].[tbCategorias] ([cate_Id])
GO
ALTER TABLE [kujo].[tbProductos] CHECK CONSTRAINT [FK_kujo_tbProductos_tbCategorias_cate_Id]
GO
ALTER TABLE [kujo].[tbProductos]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbProductos_UserCrea_usua_Id] FOREIGN KEY([prod_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbProductos] CHECK CONSTRAINT [FK_kujo_tbProductos_UserCrea_usua_Id]
GO
ALTER TABLE [kujo].[tbProductos]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbProductos_UserModifica_usua_Id] FOREIGN KEY([prod_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbProductos] CHECK CONSTRAINT [FK_kujo_tbProductos_UserModifica_usua_Id]
GO
ALTER TABLE [kujo].[tbProveedores]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbProveedores_tbMunicipios_muni_Id] FOREIGN KEY([muni_Id])
REFERENCES [gral].[tbMunicipios] ([muni_Id])
GO
ALTER TABLE [kujo].[tbProveedores] CHECK CONSTRAINT [FK_kujo_tbProveedores_tbMunicipios_muni_Id]
GO
ALTER TABLE [kujo].[tbProveedores]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbProveedores_UserCrea_usua_Id] FOREIGN KEY([prov_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbProveedores] CHECK CONSTRAINT [FK_kujo_tbProveedores_UserCrea_usua_Id]
GO
ALTER TABLE [kujo].[tbProveedores]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbProveedores_UserModifica_usua_Id] FOREIGN KEY([prov_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbProveedores] CHECK CONSTRAINT [FK_kujo_tbProveedores_UserModifica_usua_Id]
GO
ALTER TABLE [kujo].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbSucursales_UserCrea_usua_Id] FOREIGN KEY([sucu_UserCrea])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbSucursales] CHECK CONSTRAINT [FK_kujo_tbSucursales_UserCrea_usua_Id]
GO
ALTER TABLE [kujo].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [FK_kujo_tbSucursales_UserModifica_usua_Id] FOREIGN KEY([sucu_UserModifica])
REFERENCES [acce].[tbUsuarios] ([user_Id])
GO
ALTER TABLE [kujo].[tbSucursales] CHECK CONSTRAINT [FK_kujo_tbSucursales_UserModifica_usua_Id]
GO
ALTER TABLE [kujo].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [PK_kujo_tbSucursales_tbMunicipios_muni_Id] FOREIGN KEY([muni_Id])
REFERENCES [gral].[tbMunicipios] ([muni_Id])
GO
ALTER TABLE [kujo].[tbSucursales] CHECK CONSTRAINT [PK_kujo_tbSucursales_tbMunicipios_muni_Id]
GO
ALTER TABLE [kujo].[tbClientes]  WITH CHECK ADD  CONSTRAINT [CK_kujo_tbClientes_clie_Sexo] CHECK  (([clie_Sexo]='M' OR [clie_Sexo]='F'))
GO
ALTER TABLE [kujo].[tbClientes] CHECK CONSTRAINT [CK_kujo_tbClientes_clie_Sexo]
GO
ALTER TABLE [kujo].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [CK_kujo_tbEmpleados_empl_Sexo] CHECK  (([empl_sexo]='M' OR [empl_sexo]='F'))
GO
ALTER TABLE [kujo].[tbEmpleados] CHECK CONSTRAINT [CK_kujo_tbEmpleados_empl_Sexo]
GO
/****** Object:  StoredProcedure [acce].[UDP_Login_CambiarContra]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [acce].[UDP_Login_CambiarContra]
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
/****** Object:  StoredProcedure [acce].[UDP_tbPantallasPorRol_Check]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------------------Pantallas Por Rol---------------------------------------------------


CREATE   PROCEDURE [acce].[UDP_tbPantallasPorRol_Check] 
@Identificador NVARCHAR(4)
AS
BEGIN
SELECT pant_Id,pant_Nombre FROM acce.tbPantallas
WHERE SUBSTRING(pant_Identificador,0,5)= @Identificador
END

GO
/****** Object:  StoredProcedure [acce].[UDP_tbPantallasPorRol_Checked]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [acce].[UDP_tbPantallasPorRol_Checked] 
@role_Id INT
AS
BEGIN
	SELECT Pant_Id FROM acce.tbPantallasPorRol
	WHERE role_Id = @role_Id
END

GO
/****** Object:  StoredProcedure [acce].[UDP_tbPantallasPorRol_MENU]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [acce].[UDP_tbPantallasPorRol_MENU] 
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
/****** Object:  StoredProcedure [acce].[UDP_tbPantallasPorRol_PantallasAgg]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [acce].[UDP_tbPantallasPorRol_PantallasAgg]
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
/****** Object:  StoredProcedure [acce].[UDP_tbPantallasPorRol_PantallasElim]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [acce].[UDP_tbPantallasPorRol_PantallasElim]
@role_Id INT,
@pant_Id INT
AS
BEGIN
DELETE FROM  [acce].[tbPantallasPorRol]
WHERE role_Id=@role_Id AND pant_Id=@pant_Id
END
-----------------------------------DDL---------------------------------------------------


GO
/****** Object:  StoredProcedure [acce].[UDP_tbRoles_DELETE]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE  [acce].[UDP_tbRoles_DELETE]
@role_Id	INT
AS
BEGIN
	UPDATE acce.tbRoles
	SET role_Estado = 0
		WHERE role_Id=@role_Id
END

GO
/****** Object:  StoredProcedure [acce].[UDP_tbRoles_FIND]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [acce].[UDP_tbRoles_FIND] 
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
/****** Object:  StoredProcedure [acce].[UDP_tbRoles_INDEX]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------------------tbRoles---------------------------------------------------


CREATE   PROCEDURE [acce].[UDP_tbRoles_INDEX]
AS
BEGIN

	SELECT role_Id, role_Descripcion, role_Estado, role_UserCrea, role_FechaCrea, role_UserModifica, role_FechaModifica FROM
	acce.tbRoles WHERE role_Estado = 1
END

GO
/****** Object:  StoredProcedure [acce].[UDP_tbRoles_INSERT]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [acce].[UDP_tbRoles_INSERT]
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
/****** Object:  StoredProcedure [acce].[UDP_tbRoles_UPDATE]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [acce].[UDP_tbRoles_UPDATE]
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
/****** Object:  StoredProcedure [acce].[UDP_tbUsuarios_DELETE]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [acce].[UDP_tbUsuarios_DELETE]
	@user_Id INT
AS
BEGIN
	UPDATE acce.tbUsuarios
	SET user_Estado = 0
	WHERE [user_Id] = @user_Id
END

GO
/****** Object:  StoredProcedure [acce].[UDP_tbUsuarios_FIND]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [acce].[UDP_tbUsuarios_FIND]
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
/****** Object:  StoredProcedure [acce].[UDP_tbUsuarios_INDEX]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------tbUsuarios---------------------------------------------------

CREATE   PROCEDURE [acce].[UDP_tbUsuarios_INDEX]
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
/****** Object:  StoredProcedure [acce].[UDP_tbUsuarios_INSERT]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [acce].[UDP_tbUsuarios_INSERT]
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
/****** Object:  StoredProcedure [acce].[UDP_tbUsuarios_LOGIN]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------LOGIN---------------------------------------------------

CREATE   PROCEDURE [acce].[UDP_tbUsuarios_LOGIN]
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
/****** Object:  StoredProcedure [acce].[UDP_tbUsuarios_UPDATE]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [acce].[UDP_tbUsuarios_UPDATE]
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
/****** Object:  StoredProcedure [gral].[UDP_tbDepartamentosDDL]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [gral].[UDP_tbDepartamentosDDL]
AS
BEGIN
	SELECT dept_Id,dept_Descripcion FROM gral.tbDepartamentos
	WHERE dept_Estado = 1
END

GO
/****** Object:  StoredProcedure [gral].[UDP_tbEstadosCivilesDDL]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [gral].[UDP_tbEstadosCivilesDDL]
AS
BEGIN
	SELECT estc_Id,estc_Descripcion FROM gral.tbEstadosCiviles
	WHERE estc_Estado = 1
END

GO
/****** Object:  StoredProcedure [gral].[UDP_tbMunicipiosDDL]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [gral].[UDP_tbMunicipiosDDL]
@dept_Id CHAR(2)
AS
BEGIN
	SELECT muni_Id,muni_Descripcion FROM gral.tbMunicipios T1
	INNER JOIN gral.tbDepartamentos T2
	ON T1.dept_Id = T2.dept_Id
	WHERE T1.dept_Id = @dept_Id
END

GO
/****** Object:  StoredProcedure [kujo].[UDP_tbCategoriasDDL]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [kujo].[UDP_tbCategoriasDDL]
AS
BEGIN
	SELECT cate_Id,cate_Descripcion FROM kujo.tbCategorias
	WHERE cate_Estado = 1
END

----------CRUD Producto -------------

GO
/****** Object:  StoredProcedure [kujo].[UDP_tbClientes_DELETE]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [kujo].[UDP_tbClientes_DELETE]
(@clie_Id INT)
AS
BEGIN

	UPDATE	kujo.tbClientes
	SET		clie_Estado = 0
	WHERE	clie_Id		= @clie_Id

END


GO
/****** Object:  StoredProcedure [kujo].[UDP_tbClientes_FIND]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--******** PROCEDIMIENTO FIND CLIENTES ***********--

CREATE   PROCEDURE [kujo].[UDP_tbClientes_FIND] 
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
/****** Object:  StoredProcedure [kujo].[UDP_tbClientes_INDEX]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--************************************************************--
--*********** PROCEDIMIENTOS TABLA  CLIENTES *****************--


--******** PROCEDIMIENTO INDEX CLIENTES ***********--

CREATE   PROCEDURE [kujo].[UDP_tbClientes_INDEX]
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
/****** Object:  StoredProcedure [kujo].[UDP_tbClientes_INSERT]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [kujo].[UDP_tbClientes_INSERT]
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
/****** Object:  StoredProcedure [kujo].[UDP_tbClientes_UPDATE]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [kujo].[UDP_tbClientes_UPDATE]
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
/****** Object:  StoredProcedure [kujo].[UDP_TbDetalles_Factura]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [kujo].[UDP_TbDetalles_Factura] 
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
/****** Object:  StoredProcedure [kujo].[UDP_TbDetalles_INDEX]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [kujo].[UDP_TbDetalles_INDEX] 
@fact_Id INT
AS
BEGIN
SELECT	SubTotal = (SUM(facd_PrecioUnitario*prod_Cantidad)),
		IVA = CAST((SUM(facd_PrecioUnitario*prod_Cantidad))*0.15 AS DECIMAL (18,2)), 
		Total =((SUM(facd_PrecioUnitario*prod_Cantidad))+(SUM(facd_PrecioUnitario*prod_Cantidad))*0.15)  
FROM kujo.TbFacturasDetalles
WHERE facd_Estado = 1 AND fact_Id = @fact_Id
END

--******** PROCEDIMIENTO REPORTE ***********--


GO
/****** Object:  StoredProcedure [kujo].[UDP_tbEmpleadosDDL]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [kujo].[UDP_tbEmpleadosDDL]
AS
BEGIN
	SELECT empl_Id,(empl_Nombres+' '+empl_Apellidos)AS nombreEmpleado FROM kujo.tbEmpleados
	WHERE empl_Estado = 1
END

GO
/****** Object:  StoredProcedure [kujo].[UDP_TbFactura_FIND]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


----------CRUD Facturas-------------


CREATE   PROCEDURE [kujo].[UDP_TbFactura_FIND]
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
/****** Object:  StoredProcedure [kujo].[UDP_TbFactura_INDEX]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [kujo].[UDP_TbFactura_INDEX] 
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
/****** Object:  StoredProcedure [kujo].[UDP_tbFacturadetalles_Load]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--******** PROCEDIMIENTOS FACTURA DETALLE ***********--


CREATE   PROCEDURE [kujo].[UDP_tbFacturadetalles_Load] 
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
/****** Object:  StoredProcedure [kujo].[UDP_TbFacturas_DELETE]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [kujo].[UDP_TbFacturas_DELETE]
@fact_Id	INT
AS
BEGIN
	UPDATE [kujo].[TbFacturas]
	SET
		fact_Estado	= 0
		WHERE fact_Id = @fact_Id

END


GO
/****** Object:  StoredProcedure [kujo].[UDP_TbFacturas_INSERT]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [kujo].[UDP_TbFacturas_INSERT]
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
/****** Object:  StoredProcedure [kujo].[UDP_TbFacturas_UPDATE]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [kujo].[UDP_TbFacturas_UPDATE]
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
/****** Object:  StoredProcedure [kujo].[UDP_TbFacturasDetalles_DELETE]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [kujo].[UDP_TbFacturasDetalles_DELETE]
(@facd_Id INT)
AS
BEGIN

	UPDATE	[kujo].[TbFacturasDetalles]
	SET		facd_Estado = 0
	WHERE	facd_Id = @facd_Id

END

GO
/****** Object:  StoredProcedure [kujo].[UDP_TbFacturasDetalles_INSERT]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [kujo].[UDP_TbFacturasDetalles_INSERT]
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
/****** Object:  StoredProcedure [kujo].[UDP_tbProducto_DELETE]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [kujo].[UDP_tbProducto_DELETE]
 @prod_ID               INT
AS
BEGIN

	UPDATE   kujo.tbProductos
	   SET   prod_Estado = 0
	 WHERE   prod_ID = @prod_ID	
END 

GO
/****** Object:  StoredProcedure [kujo].[UDP_tbProducto_FIND]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [kujo].[UDP_tbProducto_FIND]
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
/****** Object:  StoredProcedure [kujo].[UDP_tbProducto_INDEX]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [kujo].[UDP_tbProducto_INDEX]
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
/****** Object:  StoredProcedure [kujo].[UDP_tbProducto_INSERT]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [kujo].[UDP_tbProducto_INSERT]
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
/****** Object:  StoredProcedure [kujo].[UDP_tbProducto_UPDATE]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [kujo].[UDP_tbProducto_UPDATE]
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
/****** Object:  StoredProcedure [kujo].[UDP_tbProveedoresDDL]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [kujo].[UDP_tbProveedoresDDL]
AS
BEGIN
	SELECT prov_Id,prov_Nombre FROM kujo.tbProveedores
	WHERE prov_Estado = 1
END

GO
/****** Object:  StoredProcedure [kujo].[UPD_tbFacturas_FacturasPorEmpleado]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [kujo].[UPD_tbFacturas_FacturasPorEmpleado]
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
/****** Object:  StoredProcedure [kujo].[UPD_tbFacturas_Reporte]    Script Date: 9/4/2023 08:34:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [kujo].[UPD_tbFacturas_Reporte] 
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
