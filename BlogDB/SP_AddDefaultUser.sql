USE BlogDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.AddDefaultUser') IS NOT NULL DROP PROCEDURE dbo.AddDefaultUser;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 04-10-2015
-- Description:	This stored procedure is used to
--              add a default user to the blog.
--              A default user is assigned the
--              commentator role.
-- =============================================
CREATE PROCEDURE dbo.AddDefaultUser
	@UserFirstName nchar(30),
	@UserLastName nchar(30),
	@UserEmail nchar(75)
AS
BEGIN

	BEGIN TRANSACTION AddDefaultUserTransaction;

	BEGIN TRY

		-- Add the user.
		INSERT INTO dbo.BlogUser (UserFirstName, UserLastName, UserEmail)
		VALUES (@UserFirstName, @UserLastName, @UserEmail);

		-- Retrieve user id.
		DECLARE @UserId AS int;
		SET @UserId = SCOPE_IDENTITY();

		-- Assign the role.
		INSERT INTO dbo.BlogRoleAssignment (UserId, RoleId)
		VALUES (@UserId, 3 /* Commentator */)
	
		COMMIT TRANSACTION AddDefaultUserTransaction;

	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION AddDefaultUserTransaction;
	END CATCH
END;
