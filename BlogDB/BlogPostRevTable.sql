USE BlogDB;
GO

-- Delete table if it already exists.
IF OBJECT_ID('dbo.BlogPostRev', 'U') IS NOT NULL DROP TABLE dbo.BlogPostRev;

-- Blog post revisions
CREATE TABLE dbo.BlogPostRev (
	RevisionId int IDENTITY(1,1) PRIMARY KEY,
	PostId int FOREIGN KEY REFERENCES BlogPost(PostId),
	RevisionNumber int NOT NULL,
	Headline nchar(30) NOT NULL,
	Content nvarchar(MAX) NOT NULL
) ON [PRIMARY];