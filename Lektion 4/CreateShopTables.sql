USE ShopDB;

CREATE TABLE dbo.ShopProduct (
	ProductId int IDENTITY(1,1) PRIMARY KEY,
	ProductName nchar(50) NOT NULL,
	ProductDescription nvarchar(1000) NOT NULL,
	ProductPrice decimal(10,2) NOT NULL,
	ProductStock int NOT NULL
);

CREATE TABLE dbo.ShopCustomer (
	CustomerId int IDENTITY(1,1) PRIMARY KEY,
	CustomerName nchar(50),
	CustomerAddress nchar(50),
	CustomerZip nchar(10),
	CustomerCity nchar(30),
	CustomerPhone nchar(15),
	CustomerEmail nchar(50)
);

CREATE TABLE dbo.ShopOrder (
	OrderId int IDENTITY(1,1) PRIMARY KEY,
	CustomerId int FOREIGN KEY REFERENCES ShopCustomer(CustomerId),
	OrderDate datetime,
	OrderTotal decimal(15,2)
);

CREATE TABLE dbo.ShopLog (

	LogId int IDENTITY(1,1) PRIMARY KEY,
	LogActivity nchar(50),
	LogTime datetime,
	OrderId int
);

CREATE TABLE dbo.ShopOrderLine (
	OrderLineId int IDENTITY(1,1) PRIMARY KEY,
	OrderId int FOREIGN KEY REFERENCES ShopOrder(OrderId),
	ProductId int FOREIGN KEY REFERENCES ShopProduct(ProductId),
	ProductPrice decimal(10,2),
	ProductQuantity int,
	ProductPriceSum decimal(15,2)
);