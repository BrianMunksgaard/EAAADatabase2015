
USE BlogDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.SearchBlogEntry') IS NOT NULL DROP PROCEDURE dbo.SearchBlogEntry;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 01-10-2015
-- Description:	This stored procedure is used to
--              perform a text search in the blog
--				entries. Both Headline and Content
--              attributes are searched. If either
--              one contains the search text,
--              the blog entry is returned.
-- =============================================
CREATE PROCEDURE dbo.SearchBlogEntry
	@SearchText varchar(50)
AS
BEGIN

	DECLARE @_SearchText AS varchar(50);
	SET @_SearchText = '%' + LTRIM(RTRIM(@SearchText)) + '%';

	PRINT @_SearchText;

	SELECT *
	FROM dbo.BlogPost AS a
	WHERE a.Headline LIKE @_SearchText
    OR a.Content LIKE @_SearchText;

END;
