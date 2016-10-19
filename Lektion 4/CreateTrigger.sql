USE ShopDB;
GO

DROP TRIGGER AddLogEntry;
GO

CREATE TRIGGER AddLogEntry
ON dbo.ShopOrder
AFTER UPDATE, INSERT, DELETE
AS
BEGIN

	DECLARE @OrderId as int;
	
	IF EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED)
		BEGIN
			SET @OrderId = (SELECT OrderId from inserted)
			INSERT INTO dbo.ShopLog (LogActivity, LogTime, OrderId)
			VALUES('UPDATE', GETDATE(), @OrderId);
		END
	ELSE IF EXISTS(SELECT * FROM INSERTED)
		BEGIN
			SET @OrderId = (SELECT OrderId from inserted)
			INSERT INTO dbo.ShopLog (LogActivity, LogTime, OrderId)
			VALUES('INSERT', GETDATE(), @OrderId);
		END
	ELSE IF EXISTS(SELECT * FROM DELETED)
		BEGIN
			SET @OrderId = (SELECT OrderId from deleted)
			INSERT INTO dbo.ShopLog (LogActivity, LogTime, OrderId)
			VALUES('DELETE', GETDATE(), @OrderId);
		END
END