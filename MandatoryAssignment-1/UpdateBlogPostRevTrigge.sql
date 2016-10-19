USE BlogDB;
GO

DROP TRIGGER dbo.UpdateBlogPostRevTrigger;
GO

-- This trigger is used to update the BlogPostRev table
-- whenever a blog post is changed.
CREATE TRIGGER dbo.UpdateBlogPostRevTrigger ON dbo.BlogPost
AFTER UPDATE 
AS
BEGIN

	DECLARE @PostId as int;
	SET @PostId = (SELECT PostId FROM deleted);

	DECLARE @NextRev as int;
	SELECT @NextRev = (SELECT MAX(RevisionNumber) FROM dbo.BlogPostRev AS a WHERE a.PostId = @PostId);
	IF @NextRev IS NULL 
		SET @NextRev = 1;
	ELSE
		SET @NextRev = @NextRev + 1;
	
	INSERT INTO dbo.BlogPostRev(PostId, RevisionNumber, Headline, Content)
	VALUES(@PostId, @NextRev, (SELECT Headline FROM deleted), (SELECT Content FROM deleted));

END;

