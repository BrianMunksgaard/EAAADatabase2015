USE BlogDB;

EXEC dbo.EditBlogEntry
	@PostId = 1, /* The Optimist entry */
	@UserId = 1, /* Brian */
	@Headline = 'Optimist',
	@Content =  'The Optimist is a small, single-handed sailing dinghy intended for use by children up to the age of 15. Nowadays boats are usually made of Fiberglass, although wooden boats are still built.';

