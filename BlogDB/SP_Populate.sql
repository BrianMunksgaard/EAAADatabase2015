USE BlogDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.CleanupDB') IS NOT NULL DROP PROCEDURE dbo.CleanupDB;
IF OBJECT_ID('dbo.PopulateDB') IS NOT NULL DROP PROCEDURE dbo.PopulateDB;
IF OBJECT_ID('dbo.PopulateDBJunctions') IS NOT NULL DROP PROCEDURE dbo.PopulateDBJunctions;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 01-10-2015
-- Description:	This stored procedure is used to
--              cleanup the BlogDB tables by
--              dropping and creating them.
-- =============================================
CREATE PROCEDURE dbo.CleanupDB
AS
BEGIN
	EXEC dbo.DropCreateTables;
END;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 01-10-2015
-- Description:	This stored procedure is used to
--              populate the BlogDB with test
--              data.
-- =============================================
CREATE PROCEDURE dbo.PopulateDB
AS
BEGIN

	BEGIN TRANSACTION PopulateTransaction;

	/* Insert actions */
	INSERT INTO dbo.BlogAction (ActionName)
	VALUES
		('Create'),
		('Edit'),
		('Publish'),
		('Hide'),
		('Delete')

	/* Insert roles */
	INSERT INTO dbo.BlogRole (RoleName)
	VALUES
			('Author'),
			('Administrator'),
			('Commentator');

	/* Insert blog access modes */
	INSERT INTO dbo.BlogAccess (AccessName)
	VALUES
		('Read'),
		('Edit'),
		('Create'),
		('Delete');

	/* Insert categories */
	INSERT INTO dbo.BlogCategory (CategoryName, ParentId)
	VALUES
		('Bådtyper', NULL),    -- Top level category
		('Kølbåd', 1),         -- Parent -> Bådtyper
		('Jolle', 1),          -- Parent -> Bådtyper
		('Motorbåd', 1),       -- Parent -> Bådtyper
		('Kajak', 1),          -- Parent -> Bådtyper
		('Beklædning', NULL),  -- Top level category
		('Sejlområder', NULL), -- Top level category
		('Klubber', 7),        -- Parent -> Sejlområder
		('Oplevelser', NULL);  -- Top level category

	/* Insert blog states */
	INSERT INTO dbo.BlogState (StateName)
	VALUES
		('Draft'),
		('Published'),
		('Archived'),
		('Hidden');

	/* Insert blog tags */
	INSERT INTO dbo.BlogTag (TagName)
	VALUES
		('Mast'),
		('Rig'),
		('Fortøjring'),
		('Påhængsmotor');

	/* Insert blog users */
	INSERT INTO dbo.BlogUser (UserFirstName, UserLastName, UserEmail)
	VALUES 
		('Brian', 'Munksgaard', 'brian.munksgaard@gmail.com'),
		('Emil', 'Munksgaard', 'emil.munksgaard@gmail.com'),
		('Lucas', 'Munksgaard', 'lucas.munksgaard@gmail.com'),
		('Mikkel', 'Munksgaard', 'mikkelm.munksgaard@gmail.com');

	IF @@ERROR <> 0 
		BEGIN
			ROLLBACK TRANSACTION PopulateTransaction;
			RETURN 1;
		END
	ELSE
		BEGIN
			COMMIT TRANSACTION PopulateTransaction;
			RETURN 0;
		END;

END;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 01-10-2015
-- Description:	This stored procedure is used to
--              populate the BlogDB junction
--              tables with test data.
-- =============================================
CREATE PROCEDURE dbo.PopulateDBJunctions
AS
BEGIN
	
	BEGIN TRANSACTION PopulateTransaction;
	
	/* Assign role access */	
	INSERT INTO dbo.BlogRoleAccess (RoleId, AccessId)
	VALUES
		(1, 1), /* Author read */
		(1, 2), /* Author edit */
		(1, 3), /* Author create */
		(2, 1), /* Administrator read */
		(2, 2), /* Administrator edit */
		(2, 3), /* Administrator create */
		(2, 4), /* Administrator delete */
		(3, 1), /* Commentator read */
		(3, 2); /* Commentator edit */

	/* Assign roles to users */
	INSERT INTO dbo.BlogRoleAssignment (UserId, RoleId)
	VALUES
		(1, 2), /* Brian som Administrator */
		(2, 3), /* Emil som Commentator. */ 
		(3, 1), /* Lucas som Author */
		(4, 3); /* Mikkel som Commentator */

	IF @@ERROR <> 0 
		BEGIN
			ROLLBACK TRANSACTION PopulateTransaction;
			RETURN 1;
		END
	ELSE
		BEGIN
			COMMIT TRANSACTION PopulateTransaction;
			RETURN 0;
		END;
END;