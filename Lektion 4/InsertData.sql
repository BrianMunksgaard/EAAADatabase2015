USE ShopDB;

INSERT INTO dbo.ShopCustomer 
(CustomerName, CustomerAddress, CustomerZip, CustomerCity, CustomerPhone, CustomerEmail)
VALUES
('Anders And', 'Paradis Æblevej 1', '1111', 'Andeby', '123456789', 'anders@andeby.dk');

INSERT INTO dbo.ShopProduct
(ProductName, ProductDescription, ProductPrice, ProductStock)
VALUES
('BedstemorAndBil', 'Bla Bla Bla', 100.00, 10);

