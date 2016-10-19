USE ShopDB;


INSERT INTO dbo.ShopOrder(CustomerId, OrderDate, OrderTotal)
VALUES (1, GETDATE(), 0);


DELETE FROM dbo.ShopOrder
WHERE OrderId=6;


