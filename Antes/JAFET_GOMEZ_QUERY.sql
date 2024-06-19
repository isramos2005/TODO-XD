USE Orion001

GO

CREATE TABLE Producto_Tipos(
PdTi_Id			INT IDENTITY(1,1),
PdTi_Codigo		VARCHAR(32),
PdTi_Nombre		VARCHAR(128),
CONSTRAINT dbo_PK_Producto_Tipos_PdTi_Id PRIMARY KEY(PdTi_Id),
);

GO

CREATE TABLE Productos (
prod_Id			INT IDENTITY(1,1),
prod_Codigo		VARCHAR(32),
prod_Nombre		VARCHAR(128),
PdTi_Id			INT,
prod_Estado		BIT DEFAULT 1
CONSTRAINT dbo_PK_Productos_prod_Id PRIMARY KEY(prod_Id),
CONSTRAINT dbo_FK_Productos_Producto_Tipos_PdTi_Id_ FOREIGN KEY (PdTi_Id) REFERENCES Producto_Tipos(PdTi_Id)

);

GO

CREATE OR ALTER PROC dbo.sp_Productos_List
AS
BEGIN
	SELECT	Pd.prod_Id,
			Pd.prod_Codigo,
			Pd.prod_Nombre,
			PdT.PdTi_Id,
			PdT.PdTi_Nombre,
			Pd.prod_Estado
	FROM	Productos			Pd
	INNER JOIN Producto_Tipos	PdT		ON	 Pd.PdTi_Id = PdT.PdTi_Id
	WHERE Pd.prod_Estado = 1
END;

GO

CREATE OR ALTER PROC dbo.sp_Productos_Insert
@prod_Codigo		VARCHAR(32),
@prod_Nombre		VARCHAR(128),
@PdTi_Id			INT
AS
BEGIN

	IF EXISTS (SELECT * FROM Productos WHERE prod_Codigo = @prod_Codigo AND prod_Estado = 1)
		BEGIN
			SELECT 409 AS Code
		END
	ELSE IF EXISTS (SELECT * FROM Productos WHERE prod_Codigo = @prod_Codigo AND prod_Estado = 0)
		BEGIN
			UPDATE Productos 
			SET
			prod_Codigo			= @prod_Codigo,
			prod_Nombre			= @prod_Nombre,
			PdTi_Id				= @PdTi_Id,
			prod_Estado			= 1
			WHERE prod_Codigo	= @prod_Codigo

			SELECT 200 AS Code
			
		END
	ELSE
		BEGIN
			INSERT INTO Productos
			(prod_Codigo, prod_Nombre,PdTi_Id)
			VALUES
			(@prod_Codigo,@prod_Nombre,@PdTi_Id)

			SELECT 200 AS Code

		END

END;

GO

CREATE OR ALTER PROC dbo.sp_Productos_Update
@prod_Id			INT,
@prod_Codigo		VARCHAR(32),
@prod_Nombre		VARCHAR(128),
@PdTi_Id			INT
AS
BEGIN
	IF EXISTS (SELECT * FROM Productos WHERE prod_Codigo = @prod_Codigo AND prod_Estado = 1)
		BEGIN
			UPDATE Productos 
			SET
			prod_Codigo		= @prod_Codigo,
			prod_Nombre		= @prod_Nombre,
			PdTi_Id			= @PdTi_Id,
			prod_Estado		= 1
			WHERE prod_Id	= @prod_Id
			
		END
	ELSE IF EXISTS (SELECT * FROM Productos WHERE prod_Codigo = @prod_Codigo AND prod_Estado = 0)
		BEGIN
			UPDATE Productos 
			SET
			prod_Codigo		= @prod_Codigo,
			prod_Nombre		= @prod_Nombre,
			PdTi_Id			= @PdTi_Id,
			prod_Estado		= 1
			WHERE prod_Id	= @prod_Id
			
			SELECT 200 AS Code

		END
	ELSE
		BEGIN
			UPDATE Productos 
			SET
			prod_Codigo		= @prod_Codigo,
			prod_Nombre		= @prod_Nombre,
			PdTi_Id			= @PdTi_Id
			WHERE prod_Id	= @prod_Id

			SELECT 200 AS Code

		END
END

GO

CREATE OR ALTER PROC dbo.sp_Productos_Delete
@prod_Id			INT
AS
BEGIN
	UPDATE Productos 
	SET
	prod_Estado		= 0
	WHERE prod_Id	= @prod_Id
	
	SELECT 200 AS Code
END;

GO

CREATE OR ALTER PROC dbo.sp_TipoProductoSelect
AS
BEGIN
	SELECT	
			PdTi_Id,
			PdTi_Nombre,
			PdTi_Codigo
	FROM	Producto_Tipos		
END