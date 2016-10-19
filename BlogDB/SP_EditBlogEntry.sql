USE BlogDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.EditBlogEntry') IS NOT NULL DROP PROCEDURE dbo.EditBlogEntry;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 07-10-2015
-- Description:	This stored procedure is used to
--              update an existing blog entry.
--              When a blog post is edited it
--              changes state to a draft.
-- =============================================
CREATE PROCEDURE dbo.EditBlogEntry
	@PostId int,
	@UserId int,
	@Headline nchar(30),
	@Content nvarchar(MAX)
AS
BEGIN

	BEGIN TRANSACTION EditBlogEntryTransaction;

	BEGIN TRY

		-- Update Headline and Content.
		UPDATE dbo.BlogPost
		SET Headline = @Headline,
			Content = @Content
		WHERE PostId = @PostId;

		-- Update the log.
		INSERT INTO dbo.BlogLogEntry (LogDate, PostId, ActionId, StateId, UserId)
		VALUES (
			GETDATE(),
			@PostId,
			2, -- Action: Edit.
			1, -- State: Draft.
			@UserId
		);

		COMMIT TRANSACTION EditBlogEntryTransaction;	

	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION EditBlogEntryTransaction;
	END CATCH
END;

