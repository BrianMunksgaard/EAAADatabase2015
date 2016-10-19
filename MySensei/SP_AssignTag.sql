USE SenseiDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.AssignTag') IS NOT NULL DROP PROCEDURE dbo.AssignTag;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 05-12-2015
-- Description:	This stored procedure is used to
--              assign a tag to a course. If the
--              tag does not exists, it will be
--              created.
-- =============================================
CREATE PROCEDURE dbo.AssignTag
	@CourseId int,
	@TagName nvarchar(30)
AS
BEGIN

	BEGIN TRANSACTION AssignTagTransaction;

	-- First, check whether or not the tag is
	-- already assigned to the course. If so
	-- just return SUCCESS.
	IF EXISTS 
	(	SELECT	1
		FROM	dbo.CourseTagAssignment a
		WHERE	a.CourseId = @CourseId
		  AND	a.TagName = @TagName
	)
	BEGIN
		RETURN 0;
	END;

	-- Second, check whether or not the tag exists.
	-- If not, create the tag and continue.
	IF NOT EXISTS 
    (   SELECT  1
        FROM    dbo.CourseTag A
        WHERE   a.TagName = @TagName
    )
    BEGIN
        INSERT INTO dbo.CourseTag (TagName)
        VALUES (@TagName) 
    END;

	-- Finally, assign the tag to the course.
	INSERT INTO dbo.CourseTagAssignment (CourseId, TagName)
	VALUES (@CourseId, @TagName);

	-- Any errors, rollback everything.
	-- Otherwise commit all inserts.
	IF @@ERROR <> 0 
		BEGIN
			ROLLBACK TRANSACTION AssignTagTransaction;
			RETURN 1;
		END
	ELSE
		BEGIN
			COMMIT TRANSACTION AssignTagTransaction;
			RETURN 0;
		END;
END;
GO

