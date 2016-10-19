USE BlogDB;

-- Publish blog post number 4 as user number 1 (Brian).
EXEC dbo.PublishBlogEntry
	@UserId = 1, /* Brian */
	@PostId = 4;
