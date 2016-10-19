USE BlogDB;

-- Clean database.
EXEC dbo.CleanupDB;

DECLARE @Status AS int;
SET @Status = 0;

-- Populate entities.
EXEC @Status = dbo.PopulateDB;

-- Populate junctions/relations.
IF @Status = 0
BEGIN
	EXEC @Status = dbo.PopulateDBJunctions;
END;

-- Any errors? Cleanup database.
IF @Status <> 0
BEGIN
	PRINT 'Errors have occurred.';
	EXEC dbo.CleanupDB;
END;
