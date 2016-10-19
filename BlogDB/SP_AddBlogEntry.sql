USE BlogDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.AddBlogEntry') IS NOT NULL DROP PROCEDURE dbo.AddBlogEntry;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 17-09-2015
-- Description:	This stored procedure is used to
--              add a blog entry to the blog.
-- =============================================
CREATE PROCEDURE dbo.AddBlogEntry
	@UserId int,
	@CategoryId int,
	@Headline nchar(30),
	@Content nvarchar(MAX)
AS
BEGIN

	BEGIN TRANSACTION AddBlogEntryTransaction;

	BEGIN TRY
		-- Add the post.
		INSERT INTO dbo.BlogPost (Headline, Content)
		VALUES(@Headline, @Content);

		DECLARE @PostId AS int;
		SET @PostId = SCOPE_IDENTITY();

		-- Assign the category.
		INSERT INTO dbo.BlogCategoryAssignment (PostId, CategoryId)
		VALUES (@PostId, @CategoryId);

		-- Update the log.
		INSERT INTO dbo.BlogLogEntry (LogDate, PostId, ActionId, StateId, UserId)
		VALUES (
			GETDATE(),
			@PostId,
			1, -- Action: Create.
			1, -- State: Draft.
			@UserId
		);
	
		COMMIT TRANSACTION AddBlogEntryTransaction;
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION AddBlogEntryTransaction;
	END CATCH
END;
GO
