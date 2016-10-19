USE BlogDB;

-- Insert blog post.
INSERT INTO dbo.BlogPost (Headline, Content)
VALUES ('Zoom8', 'The Zoom8 is a youth racing dinghy sailed in Denmark, Sweden, Norway, Finland, Austria, the Netherlands, Estonia, Latvia and Russia.');

-- Assign category.
INSERT INTO dbo.BlogCategoryAssignment (PostId, CategoryId)
VALUES (7, 3); -- Første blog post er om joller.

-- Assign tags.
INSERT INTO dbo.BlogTagAssignment (PostId, TagId)
VALUES (7, 1), -- Mast
	   (7, 2)  -- Rig

-- Add log entry.
INSERT INTO dbo.BlogLogEntry (LogDate, PostId, ActionId, StateId, UserId)
VALUES (
	'20150809 15:15:15',
	7, /* PostId */
	1, /* Action: Create */
	1, /* State: Draft */
	3  /* User: Brian Munksgaard */
);