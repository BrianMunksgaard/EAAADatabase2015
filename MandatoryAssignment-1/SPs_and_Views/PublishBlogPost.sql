/****** Script for SelectTopNRows command from SSMS  ******/
USE BlogDB;

-- Publish a blog post.
INSERT INTO BlogLogEntry (LogDate, PostId, ActionId, StateId, UserId)
VALUES (GETDATE(),
		7, /* The post to publish */
		3, /* Publish */
		2, /* New state = published */
		1  /* Brian */
		);