USE BlogDB;

-- Insert blog post.
INSERT INTO dbo.BlogPost (Headline, Content)
VALUES ('Optimist', 'Optimistjolle, også kaldet optimisten eller optien, er bla bla bla .....');

-- Assign category.
INSERT INTO dbo.BlogCategoryAssignment (PostId, CategoryId)
VALUES (1, 3); -- Første blog post er om joller.

-- Assign tags.
INSERT INTO dbo.BlogTagAssignment (PostId, TagId)
VALUES (1, 1), -- Mast
	   (1, 2)  -- Rig

-- Add log entry.
INSERT INTO dbo.BlogLogEntry (LogDate, PostId, ActionId, StateId, UserId)
VALUES (
	GETDATE(),
	1, /* PostId */
	1, /* Action: Create */
	1, /* State: Draft */
	1  /* User: Brian Munksgaard */
);
