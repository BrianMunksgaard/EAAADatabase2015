USE BlogDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.CanEdit') IS NOT NULL DROP PROCEDURE dbo.CanEdit;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 01-10-2015
-- Description:	This stored procedure is used to
--              determine whether or not a user
--              has edit rights.
-- =============================================
CREATE PROCEDURE dbo.CanEdit
	@UserId int
AS
BEGIN

	IF EXISTS (
		SELECT e.AccessName
		FROM dbo.BlogUser AS a
		JOIN dbo.BlogRoleAssignment AS b ON b.UserId = a.UserId
		JOIN dbo.BlogRole AS c ON b.RoleId = c.RoleId
		JOIN dbo.BlogRoleAccess AS d ON b.RoleId = d.RoleId
		JOIN dbo.BlogAccess AS e ON d.AccessId = e.AccessId
		WHERE a.UserId = @UserId
		  AND e.AccessName = 'Edit'
	  )
	BEGIN
		RETURN 0; -- Can Edit.
	END
	ELSE
	BEGIN
		RETURN 1; -- No can do.
	END;
END;
