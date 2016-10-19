USE BlogDB;

-- Insert blog post.
--INSERT INTO dbo.BlogPost (Headline, Content)
--VALUES ('RS Tera', 'The RS Tera is suitable for introducing newcomers to the sport of sailing, but is also a good boat to race.');

-- Assign category.
INSERT INTO dbo.BlogCategoryAssignment (PostId, CategoryId)
VALUES (2, 3); -- Blog post er om joller.

-- Assign tags.
INSERT INTO dbo.BlogTagAssignment (PostId, TagId)
VALUES (2, 1), -- Mast
	   (2, 2)  -- Rig

-- Add log entry.
INSERT INTO dbo.BlogLogEntry (LogDate, PostId, ActionId, StateId, UserId)
VALUES (
	GETDATE(),
	2, /* PostId */
	3, /* Action: Publish */
	2, /* State: Published */
	1  /* User: Brian Munksgaard */
);
