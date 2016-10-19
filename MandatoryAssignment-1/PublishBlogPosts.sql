USE BlogDB;

-- Publish some blog posts.
INSERT INTO dbo.BlogLogEntry (LogDate, PostId, ActionId, StateId, UserId)
VALUES (
	'20150811 15:15:15',
	7, /* PostId */
	3, /* Action: Publish */
	2, /* State: Published */
	3  /* User: Brian Munksgaard */
);

INSERT INTO dbo.BlogLogEntry (LogDate, PostId, ActionId, StateId, UserId)
VALUES (
	GETDATE(),
	2, /* PostId */
	3, /* Action: Publish */
	2, /* State: Published */
	3  /* User: Brian Munksgaard */
);