USE BlogDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.PublishBlogEntry') IS NOT NULL DROP PROCEDURE dbo.PublishBlogEntry;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 01-10-2015
-- Description:	This stored procedure is used to
--              publish a blog entry to the blog.
-- =============================================
CREATE PROCEDURE dbo.PublishBlogEntry
	@UserId int,
	@PostId int
AS
BEGIN

	BEGIN TRANSACTION PostBlogEntryTransaction;

	-- First determine whether or not the user has the required
	-- access rights.
	DECLARE @CanEdit AS int;
	EXEC @CanEdit = dbo.CanEdit @UserId;

	-- If the user has edit rights mark the blog entry as published.
	IF @CanEdit = 0
	BEGIN
		INSERT INTO dbo.BlogLogEntry (LogDate, PostId, ActionId, StateId, UserId)
		VALUES (
			GETDATE(),
			@PostId,
			3, /* Action: Publish */
			2, /* State: Published */
			@UserId);
	END

	IF @@ERROR <> 0 
		BEGIN
			ROLLBACK TRANSACTION PostBlogEntryTransaction;
		END
	ELSE
		BEGIN
			COMMIT TRANSACTION PostBlogEntryTransaction;
		END;
END;
