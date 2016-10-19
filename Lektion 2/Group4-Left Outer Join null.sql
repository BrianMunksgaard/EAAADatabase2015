USE ProductDB;

IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL DROP TABLE dbo.Product;
IF OBJECT_ID('dbo.ProductGroup', 'U') IS NOT NULL DROP TABLE dbo.ProductGroup;

CREATE TABLE dbo.Product(
	ProductId int IDENTITY(1,1) NOT NULL,
	ProductName nchar(30) NOT NULL,
	ProductGroupId int NOT NULL
);

CREATE TABLE dbo.ProductGroup (
	ProductGroupId int IDENTITY(1,1) NOT NULL,
	ProductGroupName nchar(30) NOT NULL
);

INSERT INTO dbo.ProductGroup (ProductGroupName)
VALUES
	('Bil'),
	('Computer'),
	('Kaffe'),
	('Telefon');


INSERT INTO dbo.Product (ProductName, ProductGroupId)
VALUES
	('Ford', 1),
	('Skoda', 1),
	('Lenovo', 2),
	('Apple', 2),
	('Merrild', 3),
	('BKI', 3);